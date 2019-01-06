// Copyright 2018 Songhori, Ebrahim and Hussain, Siam Umar

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

`include "../Header/MAC_H.vh"

module GarbledCircuit #(parameter S = 20, K = 128)(	
	input			clk, rst, start,
	output	logic	[2:0]	tag,
	output	logic	[S-1:0]	cid, index0, index1, 
	output	logic	[K-1:0]	data0, data1	
);
	/*generate keys*/
	
	logic	[1:0]		en_LabelGen;
	logic	[2*K-1:0]	key;
	
	LabelGen #(.S(S), .K(K))LabelGen(
		.clk(clk), .rst(rst),
		.en(en_LabelGen),
		.key(key)
    );
	
	/*load the netlist*/
	
	logic					cid_rst, cur_index_rst;
	logic					cid_inc, cur_index_inc, cur_index_overflow;
	logic			[S-1:0]	cur_index;
	logic			[S-1:0]	NL_rd_addr;
	logic			[3:0]	g_logic;
	logic					done_Netlist;
	logic	signed	[S-1:0]	init_size, input_size, dff_size, output_size, gate_size, num_XOR;
	logic	signed	[S-1:0]	init_input_size, dff_gate_size;
	logic					DFF_present;
	logic					in0F, in1F;
	logic	signed	[S-1:0]	in0, in1;
	logic					is_output;
	
	Netlist #(.S(S)) Netlist(
		.clk(clk), .rst(rst), .start(start),
		.rd_addr(NL_rd_addr),
		.done(done_Netlist),
		.init_size(init_size), .input_size(input_size), .dff_size(dff_size), 
		.output_size(output_size), .gate_size(gate_size), .num_XOR(num_XOR),
		.in0F(in0F), .in1F(in1F),
		.in0(in0), .in1(in1),
		.g_logic(g_logic),
		.is_output(is_output)
	);
	
	always_comb begin
		DFF_present = (dff_size > 'd0);
		init_input_size = init_size + input_size;
		dff_gate_size = dff_size + gate_size;
		NL_rd_addr = cur_index;
	end
	
	/*garble a gate*/
	
	logic	[S-1:0]	gid;
	logic	[K-1:0]	R, AES_key;
	logic	[128*(NR_AES+1)-1:0] AES_expandedKey;
	logic	[K-1:0]	in0_label, in1_label;
	logic	[K-1:0]	t0, t1;
	logic	[K-1:0]	out_label;
	
	KeyExpansion KeyExpansion (
		.key(AES_key), 
		.expandedKey(AES_expandedKey)
	);

	GC_engine #(.S(S), .K(K)) GC_engine (  
		.clk(clk), .rst(rst),
		.R(R),
		.AES_expandedKey(AES_expandedKey),		
		.cid(cid), .gid(gid),
		.g_logic(g_logic),
		.in0_label(in0_label), .in1_label(in1_label),
		.t0(t0), .t1(t1),
		.out_label(out_label)
	);
	
	assign gid = cur_index - dff_size;
	
	/*XORs and DFFs*/
	
	logic			is_FF, is_NOT, is_XOR, is_XNOR, is_XORS;
	logic	[K-1:0]	DFF_label, XOR_label;
	logic	[S-1:0]	cur_num_XOR;
		
	always_comb begin
		is_FF = (g_logic == DFFGATE);
		is_NOT = (g_logic == NOTGATE);
		is_XOR = (g_logic == XORGATE);
		is_XNOR = (g_logic == XNORGATE);	
		is_XORS = is_NOT|is_XOR|is_XNOR;
		
		if (is_NOT) XOR_label = in0_label^R;
		else if(is_XOR) XOR_label = in0_label^in1_label;
		else XOR_label = in0_label^in1_label^R;
	end
	
	/*FIFOs for output labels and garbled tables*/
	
	logic					OL_GT_wr_en_beg, OL_GT_wr_en_end;
	logic			[S-1:0]	OL_wr_addr_beg, OL_wr_addr_end;
	logic	signed 	[S-1:0]	GT_wr_addr_beg, GT_wr_addr_end;
	
	FIFO #(.N(1), .S(NR_AES)) OL_GT_wr_en_0(	
		.clk(clk), .rst(rst),
		.in(OL_GT_wr_en_beg),
		.out(OL_GT_wr_en_end)
	);	
	
	FIFO #(.N(S), .S(NR_AES)) OL_wr_addr(	
		.clk(clk), .rst(rst),
		.in(OL_wr_addr_beg),
		.out(OL_wr_addr_end)
	);	
	
	FIFO #(.N(S), .S(NR_AES)) GT_wr_addr(	
		.clk(clk), .rst(rst),
		.in(GT_wr_addr_beg),
		.out(GT_wr_addr_end)
	);
	
	/*used later for transferring garbled tables*/
	
	logic	signed	[S-1:0]	GT_ext_rd_addr;
	logic					GT_ext_rd_inc;
	
	/*memories for input labels, output labels, and garbled tables*/
	
	logic				IL_clr;
	logic				IL_wr_en_0, IL_wr_en_1;
	logic	[S-1:0]		IL_wr_addr_0, IL_wr_addr_1;
	logic	[S-1:0]		IL_rd_addr_0, IL_rd_addr_1;  
	logic	[K-1:0]		IL_wr_data_0, IL_wr_data_1; 
	logic				IL_rd_data_ready_0, IL_rd_data_ready_1; 
	logic	[K-1:0]		IL_rd_data_0, IL_rd_data_1;
	
	DPRAM #(.S(S), .K(K)) InLabels(
		.clk(clk), .rst(rst), .clr(IL_clr),
		.wr_en_0(IL_wr_en_0), .wr_en_1(IL_wr_en_1),
		.wr_addr_0(IL_wr_addr_0), .wr_addr_1(IL_wr_addr_1),
		.rd_addr_0(IL_rd_addr_0), .rd_addr_1(IL_rd_addr_1),  
		.wr_data_0(IL_wr_data_0), .wr_data_1(IL_wr_data_1), 
		.rd_data_ready_0(IL_rd_data_ready_0), .rd_data_ready_1(IL_rd_data_ready_1),
		.rd_data_0(IL_rd_data_0), .rd_data_1(IL_rd_data_1)
	);
	
	logic				OL_clr;
	logic				OL_wr_en_0, OL_wr_en_1;
	logic	[S-1:0]		OL_wr_addr_0, OL_wr_addr_1;
	logic	[S-1:0]		OL_rd_addr_0, OL_rd_addr_1;  
	logic	[K-1:0]		OL_wr_data_0, OL_wr_data_1; 
	logic				OL_rd_data_ready_0, OL_rd_data_ready_1;
	logic	[K-1:0]		OL_rd_data_0, OL_rd_data_1;
	
	DPRAM #(.S(S), .K(K)) OutLabels(
		.clk(clk), .rst(rst), .clr(OL_clr),
		.wr_en_0(OL_wr_en_0), .wr_en_1(OL_wr_en_1),
		.wr_addr_0(OL_wr_addr_0), .wr_addr_1(OL_wr_addr_1),
		.rd_addr_0(OL_rd_addr_0), .rd_addr_1(OL_rd_addr_1),  
		.wr_data_0(OL_wr_data_0), .wr_data_1(OL_wr_data_1), 
		.rd_data_ready_0(OL_rd_data_ready_0), .rd_data_ready_1(OL_rd_data_ready_1),
		.rd_data_0(OL_rd_data_0), .rd_data_1(OL_rd_data_1)
	);
	
	/*The memory for Garbled Tables has half the elements each with twice the bit-width, since tables are generated in pairs*/
	logic					GT_clr;
	logic					GT_wr_en_0, GT_wr_en_1;
	logic	[S-2:0]			GT_wr_addr_0, GT_wr_addr_1;
	logic	[S-2:0]			GT_rd_addr_0, GT_rd_addr_1;  
	logic	[2*K-1:0]		GT_wr_data_0, GT_wr_data_1;
	logic					GT_rd_data_ready_0, GT_rd_data_ready_1; 
	logic	[2*K-1:0]		GT_rd_data_0, GT_rd_data_1;
	
	DPRAM #(.S(S-1), .K(2*K)) GarbledTables(
		.clk(clk), .rst(rst), .clr(GT_clr),
		.wr_en_0(GT_wr_en_0), .wr_en_1(GT_wr_en_1),
		.wr_addr_0(GT_wr_addr_0), .wr_addr_1(GT_wr_addr_1),
		.rd_addr_0(GT_rd_addr_0), .rd_addr_1(GT_rd_addr_1),  
		.wr_data_0(GT_wr_data_0), .wr_data_1(GT_wr_data_1), 
		.rd_data_ready_0(GT_rd_data_ready_0), .rd_data_ready_1(GT_rd_data_ready_1),
		.rd_data_0(GT_rd_data_0), .rd_data_1(GT_rd_data_1)
	);	
			
	always_comb begin			
		OL_wr_addr_beg = cur_index;
		GT_wr_addr_beg = cur_index - dff_size - cur_num_XOR;
	
		IL_clr = cur_index_rst;
		IL_rd_addr_0 = in0+'d2; //first two locations are saved for constant labels
		IL_rd_addr_1 = in1+'d2;
		IL_wr_data_0 = in0_label;
		IL_wr_data_1 = in1_label; 

		OL_clr = cur_index_rst;
		OL_wr_en_0 = OL_GT_wr_en_end;
		OL_wr_en_1 = (cur_index_inc&is_XORS)|is_FF;
		OL_wr_addr_0 = OL_wr_addr_end; 
		OL_wr_addr_1 = cur_index; 
		OL_rd_addr_0 = in0-init_input_size;
		OL_rd_addr_1 = in1-init_input_size;  
		OL_wr_data_0 = out_label;
		OL_wr_data_1 = is_FF? DFF_label : XOR_label;

		GT_clr = cur_index_rst;
		GT_wr_en_0 = OL_GT_wr_en_end;
		GT_wr_en_1 = 'b0;
		GT_wr_addr_0 = 2*GT_wr_addr_end;
		GT_wr_addr_1 = 'bz;
		GT_rd_addr_0 = 'bz;
		GT_rd_addr_1 = 2*GT_ext_rd_addr;  
		GT_wr_data_0 = {t0, t1};
		GT_wr_data_1 = 'bz; 	
	end
	
	/*store output masks*/
	
	logic	[0:2**S-1]	OutputMask;
	logic 				GC_mask;
	logic				OM_inc_beg, OM_inc_end, XOR_mask_beg, XOR_mask_end, is_XOR_end;
	logic	[2:0]		OM_beg, OM_end;
	logic	[S-1:0]		OM_index;
	
	FIFO #(.N(3), .S(NR_AES)) OM(	
		.clk(clk), .rst(rst),
		.in(OM_beg),
		.out(OM_end)
	);	
	
	always_comb begin
		GC_mask = out_label[0];
		XOR_mask_beg = XOR_label[0];
		OM_inc_beg = is_output & cur_index_inc/*gid_inc*/;
		OM_beg = {XOR_mask_beg, is_XORS, OM_inc_beg};
		{XOR_mask_end, is_XOR_end, OM_inc_end} = OM_end;
	end
	
	always_ff @(posedge clk or posedge rst) begin
		if(rst|cur_index_rst) OutputMask <= {(2**S){1'b0}};		
		else if(OM_inc_end) begin
			if(is_XOR_end) OutputMask[output_size-1-OM_index] <= XOR_mask_end;
			else OutputMask[output_size-1-OM_index] <= GC_mask;
		end	
	end
	
	/*counters*/
	
	assign cur_index_overflow = cur_index == dff_gate_size-1;
	
	always_ff @(posedge clk or posedge rst) begin
		if(rst|cid_rst) cid <= 0;
		else if(cid_inc) cid <= cid + 'd1;
		
		if(rst|cur_index_rst) cur_index <= 0;
		else if(cur_index_inc & ~cur_index_overflow) cur_index <= cur_index + 'd1;
		
		if(rst|cur_index_rst) cur_num_XOR <= 0;
		else if(cur_index_inc&is_XORS) cur_num_XOR <= cur_num_XOR + 'd1;
		
		if(rst|cur_index_rst) OM_index <= 0;
		else if(OM_inc_end) OM_index <= OM_index + 'd1;
		
		if(rst|cur_index_rst) GT_ext_rd_addr <= 0;
		else if(GT_ext_rd_inc) GT_ext_rd_addr <= GT_ext_rd_addr + 'd1;
	end
	
	/*garble the netlist*/
	
	typedef enum{
		IDLE,
		GETKEYS,
		CONSTLABELS,
		WAIT,
		DFF,
		GARBLE,
		MASKS
	}state;
	
	state currState, nextState;	
	
	always_ff @(posedge clk or posedge rst)
		if(rst) currState <= IDLE;
		else currState <= nextState;
		
	always_comb begin
		en_LabelGen = 'b0;
		cid_inc = 'b0;
		cur_index_inc = 'b0;
		cid_rst = 'b0;
		cur_index_rst = 'b0;
		IL_wr_en_0 = 'b0;
		IL_wr_en_1 = 'b0;
		IL_wr_addr_0 = {S{1'b1}};
		IL_wr_addr_1 = {S{1'b1}};
		OL_GT_wr_en_beg = 'b0;
		nextState = currState;
		
		case(currState)
			IDLE: begin
				cid_rst = 'b1;
				cur_index_rst = 'b1;		
				R = 'b0; 
				AES_key = 'b0; 
				in0_label = 'b0;
				in1_label = 'b0;
				if(start == 'b1) nextState = GETKEYS;
			end
			GETKEYS: begin
				en_LabelGen = 'b11;
				R = {key[K-1:1], 1'b1}; //last bit of R is always 1
				AES_key = key[2*K-1:K];
				nextState = CONSTLABELS;
			end				
			CONSTLABELS: begin
				en_LabelGen = 'b11;
				
				IL_wr_en_0 = 'b1;
				IL_wr_en_1 = 'b1; 
				IL_wr_addr_0 = 'b0;
				IL_wr_addr_1 = 'b1;
				
				in0_label = key[K-1:0];
				in1_label = key[2*K-1:K];
				
				if(done_Netlist) begin
					if(DFF_present) nextState = DFF;
					else nextState = GARBLE;
				end
				else nextState = WAIT;
			end		
			WAIT: begin
				if(done_Netlist) begin
					if(DFF_present) nextState = DFF;
					else nextState = GARBLE;
				end
			end		
			DFF: begin				
				/*at each access a DFF needs only one input label. 
				for cid = 0,	the index of that label is stored in in1 (the 'I' input)
								this comes either from a constant label, or from init labels
								we may need to generate the init labels if not already generated
				for cid > 0,	the index of that label is stored in in0 (the 'D' input)
								OL_rd_addr_0 is always assigned to in0, so we read it from OL_rd_data_0
							
				CONSTZERO = -2, CONSTONE = -3, IL_rd_addr_0 = in0+'d2, IL_rd_addr_1 = in1+'d2, 
				labels for CONSTZERO and CONSTONE are saved in locations 0 and 1 respectively of InputLabels*/
				
				cur_index_inc = 'b1;
				
				if(cid == 'd0) begin
					if ((in1 == CONSTZERO)||(in1 == CONSTONE)) DFF_label = IL_rd_data_1;
					else begin //generate init label and store in both InputLabels and OutputLabels
						IL_wr_en_1 = ~IL_rd_data_ready_1; 
						IL_wr_addr_1 = in1+'d2;
						en_LabelGen = {IL_wr_en_1, 1'b0};
						in1_label = key[2*K-1:K]; 
						DFF_label = in1_label;
					end
				end
				else begin
					if ((in0 == CONSTZERO)||(in0 == CONSTONE)) DFF_label = IL_rd_data_0;
					else DFF_label = OL_rd_data_0;
				end
				if(cur_index == dff_size-1) begin 
					nextState = GARBLE;
				end
			end		
			GARBLE: begin				
				cur_index_inc = (in0F|OL_rd_data_ready_0) & (in1F|OL_rd_data_ready_1);
			
				IL_wr_en_0 = in0F & ~IL_rd_data_ready_0;
				IL_wr_en_1 = in1F & ~IL_rd_data_ready_1 & ~is_NOT; 
				IL_wr_addr_0 = in0+'d2;
				IL_wr_addr_1 = in1+'d2; 
				
				en_LabelGen = {IL_wr_en_1, IL_wr_en_0};
				
				if(in0F) begin
					if(IL_rd_data_ready_0) in0_label = IL_rd_data_0;
					else in0_label = key[K-1:0];
				end
				else in0_label = OL_rd_data_0;
				
				if(in1F) begin
					if(IL_rd_data_ready_1) in1_label = IL_rd_data_1;
					else in1_label = key[2*K-1:K];
				end
				else in1_label = OL_rd_data_1;	
				
				OL_GT_wr_en_beg = cur_index_inc&(~is_XORS);		

				if((cur_index == dff_gate_size-1)&&(GT_ext_rd_addr >= gate_size-num_XOR-1)) nextState = MASKS;
			end
			MASKS: begin
				if(OM_index == output_size) begin
					cid_inc = 'b1;
					cur_index_rst = 'b1;				
					nextState = DFF;
				end
			end
		endcase
	end
	
	/*send data, part of the same state machine, written separately to keep it clean*/	
	/*
	tag 
	000: nothing
	101: input 0	110: input 1		111: input 0 and 1
	001: keys		010: garbled table	011: masks
	*/
	
	always_comb begin
		tag = 'b000;
		index0 = -1;
		index1 = -1;
		GT_ext_rd_inc = 'b0;
		case(currState)
			GETKEYS: begin
				tag = 'b001;
				data0 = R;
				data1 = AES_key;
			end				
			CONSTLABELS: begin
				tag = 'b111;
				index0 = IL_wr_addr_0;
				index1 = IL_wr_addr_1;
				data0 = in0_label;
				data1 = in1_label;
			end		
			WAIT: begin
			end		
			DFF: begin	
				if(|en_LabelGen) begin
					tag = {1'b1, en_LabelGen};
					index0 = IL_wr_addr_0;
					index1 = IL_wr_addr_1;	
					data0 = in0_label;
					data1 = in1_label;					
				end
			end			
			GARBLE: begin
				if(|en_LabelGen) begin
					tag = {1'b1, en_LabelGen};
					index0 = IL_wr_addr_0;
					index1 = IL_wr_addr_1;	
					data0 = in0_label;
					data1 = in1_label;					
				end
				else begin
					if(GT_rd_data_ready_1) begin
						tag = 3'b010;
						GT_ext_rd_inc = 'b1;
						index0 = 2*GT_ext_rd_addr;
						index1 = 2*GT_ext_rd_addr+'d1;
						data0 = GT_rd_data_1[2*K-1:K];
						data1 = GT_rd_data_1[K-1:0];
					end
				end
			end
			MASKS: begin
				if(OM_index == output_size) begin
					tag = 3'b011;
					data0 = OutputMask[0:K-1];
					data1 = OutputMask[K:2*K-1];
				end
			end
		endcase
	end
	
endmodule

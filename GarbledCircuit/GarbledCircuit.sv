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
	output	logic	[2:0]	tag_t1,
	output	logic	[S-1:0]	cid, index0_t1, index1_t1, 
	output	logic	[K-1:0]	data0_t1, data1_t1	
);
	/*generate keys*/
	
	logic	[1:0]		en_LabelGen;
	logic	[2*K-1:0]	key;
	logic	[2*K-1:0]	CurrKeys_t1[2];
	
	LabelGen #(.S(S), .K(K))LabelGen(
		.clk(clk), .rst(rst),
		.en(en_LabelGen),
		.key(key)
    );
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			CurrKeys_t1[0] <= 'b0;
			CurrKeys_t1[1] <= 'b0;
		end     
		else begin
			CurrKeys_t1[0] <= key[K-1:0];
			CurrKeys_t1[1] <= key[2*K-1:K];
		end
	end
	
	/*load the netlist*/
	
	logic					cid_rst, cur_index_rst;
	logic					cid_inc, cur_index_inc, cur_index_inc_t1, cur_index_overflow;
	logic			[S-1:0]	cur_index, cur_index_t1;
	logic			[S-1:0]	NL_rd_addr;
	logic			[3:0]	g_logic, g_logic_t1;
	logic					done_Netlist;
	logic	signed	[S-1:0]	init_size, input_size, dff_size, output_size, gate_size, num_XOR;
	logic	signed	[S-1:0]	init_input_size, dff_gate_size;
	logic					DFF_present;
	logic					in0F, in1F;
	logic	signed	[S-1:0]	in0, in1;
	logic					is_output, is_output_t1;
	
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
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			cur_index_t1 <= 'b0;
			cur_index_inc_t1 <= 'b0;
			g_logic_t1 <= 'b0;
			is_output_t1 <= 'b0;
		end     
		else begin
			cur_index_t1 <= cur_index;
			cur_index_inc_t1 <= cur_index_inc;
			g_logic_t1 <= g_logic;	
			is_output_t1 <= is_output;
		end
	end
	
	/*garble a gate*/
	
	logic	[S-1:0]	gid_t1;
	logic	[K-1:0]	R, AES_key;
	logic	[128*(NR_AES+1)-1:0] AES_expandedKey;
	logic	[K-1:0]	in0_label_t1, in1_label_t1;
	logic	[K-1:0]	gt_row_0_t1, gt_row_1_t1;
	logic	[K-1:0]	out_label_t1;
	
	assign gid_t1 = cur_index_t1 - dff_size;
	
	KeyExpansion KeyExpansion (
		.key(AES_key), 
		.expandedKey(AES_expandedKey)
	);

	GC_engine #(.S(S), .K(K)) GC_engine (  
		.clk(clk), .rst(rst),
		.R(R),
		.AES_expandedKey(AES_expandedKey),		
		.cid(cid), .gid(gid_t1),
		.g_logic(g_logic_t1),
		.in0_label(in0_label_t1), .in1_label(in1_label_t1),
		.gt_row_0(gt_row_0_t1), .gt_row_1(gt_row_1_t1),
		.out_label(out_label_t1)
	);
	
	/*XORs and DFFs*/
	
	logic			is_FF_t1, is_NOT_t1, is_XOR_t1, is_XNOR_t1, is_XORS_t1;
	logic	[K-1:0]	DFF_label_t1, XOR_label_t1;
	logic	[S-1:0]	cur_num_XOR_t1;
		
	always_comb begin
		is_FF_t1 = (g_logic_t1 == DFFGATE);
		is_NOT_t1 = (g_logic_t1 == NOTGATE);
		is_XOR_t1 = (g_logic_t1 == XORGATE);
		is_XNOR_t1 = (g_logic_t1 == XNORGATE);	
		is_XORS_t1 = is_NOT_t1|is_XOR_t1|is_XNOR_t1;
		
		if (is_NOT_t1) XOR_label_t1 = in0_label_t1^R;
		else if(is_XOR_t1) XOR_label_t1 = in0_label_t1^in1_label_t1;
		else XOR_label_t1 = in0_label_t1^in1_label_t1^R;
	end
	
	/*FIFOs for output labels and garbled tables*/
	
	logic					OL_GT_wr_en_beg_t1, OL_GT_wr_en_end_t1;
	logic			[S-1:0]	OL_wr_addr_beg_t1, OL_wr_addr_end_t1;
	logic	signed 	[S-1:0]	GT_wr_addr_beg_t1, GT_wr_addr_end_t1;
	
	FIFO #(.N(1), .S(NR_AES)) OL_GT_wr_en_0_t1( 
		.clk(clk), .rst(rst),
		.in(OL_GT_wr_en_beg_t1),
		.out(OL_GT_wr_en_end_t1)
	);	
	
	FIFO #(.N(S), .S(NR_AES)) OL_wr_addr(	
		.clk(clk), .rst(rst),
		.in(OL_wr_addr_beg_t1),
		.out(OL_wr_addr_end_t1)
	);	
	
	FIFO #(.N(S), .S(NR_AES)) GT_wr_addr(	
		.clk(clk), .rst(rst),
		.in(GT_wr_addr_beg_t1),
		.out(GT_wr_addr_end_t1)
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
	logic	[K-1:0]		IL_rd_data_0_t1, IL_rd_data_1_t1;
	
	DPRAM #(.S(S), .K(K)) InLabels(
		.clk(clk), .rst(rst), .clr(IL_clr),
		.wr_en_0(IL_wr_en_0), .wr_en_1(IL_wr_en_1),
		.wr_addr_0(IL_wr_addr_0), .wr_addr_1(IL_wr_addr_1),
		.rd_addr_0(IL_rd_addr_0), .rd_addr_1(IL_rd_addr_1),  
		.wr_data_0(IL_wr_data_0), .wr_data_1(IL_wr_data_1), 
		.rd_data_ready_0(IL_rd_data_ready_0), .rd_data_ready_1(IL_rd_data_ready_1),
		.rd_data_0(IL_rd_data_0_t1), .rd_data_1(IL_rd_data_1_t1)
	);
	
	logic				OL_clr;
	logic				OL_wr_en_0_t1, OL_wr_en_1_t1;
	logic	[S-1:0]		OL_wr_addr_0_t1, OL_wr_addr_1_t1;
	logic	[S-1:0]		OL_rd_addr_0, OL_rd_addr_1;  
	logic	[K-1:0]		OL_wr_data_0_t1, OL_wr_data_1_t1; 
	logic				OL_rd_data_ready_0, OL_rd_data_ready_1;
	logic	[K-1:0]		OL_rd_data_0_t1, OL_rd_data_1_t1;
	
	DPRAM #(.S(S), .K(K)) OutLabels(
		.clk(clk), .rst(rst), .clr(OL_clr),
		.wr_en_0(OL_wr_en_0_t1), .wr_en_1(OL_wr_en_1_t1),
		.wr_addr_0(OL_wr_addr_0_t1), .wr_addr_1(OL_wr_addr_1_t1),
		.rd_addr_0(OL_rd_addr_0), .rd_addr_1(OL_rd_addr_1),  
		.wr_data_0(OL_wr_data_0_t1), .wr_data_1(OL_wr_data_1_t1), 
		.rd_data_ready_0(OL_rd_data_ready_0), .rd_data_ready_1(OL_rd_data_ready_1),
		.rd_data_0(OL_rd_data_0_t1), .rd_data_1(OL_rd_data_1_t1)
	);
	
	/*The memory for Garbled Tables has half the elements each with twice the bit-width, since tables are generated in pairs*/
	logic					GT_clr;
	logic					GT_wr_en_0_t1, GT_wr_en_1_t1;
	logic	[S-2:0]			GT_wr_addr_0_t1, GT_wr_addr_1_t1;
	logic	[S-2:0]			GT_rd_addr_0, GT_rd_addr_1;  
	logic	[2*K-1:0]		GT_wr_data_0_t1, GT_wr_data_1_t1;
	logic					GT_rd_data_ready_0, GT_rd_data_ready_1; 
	logic	[2*K-1:0]		GT_rd_data_0_t1, GT_rd_data_1_t1;
	
	DPRAM #(.S(S-1), .K(2*K)) GarbledTables(
		.clk(clk), .rst(rst), .clr(GT_clr),
		.wr_en_0(GT_wr_en_0_t1), .wr_en_1(GT_wr_en_1_t1),
		.wr_addr_0(GT_wr_addr_0_t1), .wr_addr_1(GT_wr_addr_1_t1),
		.rd_addr_0(GT_rd_addr_0), .rd_addr_1(GT_rd_addr_1),  
		.wr_data_0(GT_wr_data_0_t1), .wr_data_1(GT_wr_data_1_t1), 
		.rd_data_ready_0(GT_rd_data_ready_0), .rd_data_ready_1(GT_rd_data_ready_1),
		.rd_data_0(GT_rd_data_0_t1), .rd_data_1(GT_rd_data_1_t1)
	);	
			
	always_comb begin			
		OL_wr_addr_beg_t1 = cur_index_t1;
		GT_wr_addr_beg_t1 = cur_index_t1 - dff_size - cur_num_XOR_t1;
	
		IL_clr = cur_index_rst;
		IL_rd_addr_0 = in0+'d2; //first two locations are saved for constant labels
		IL_rd_addr_1 = in1+'d2;
		IL_wr_data_0 = key[K-1:0];
		IL_wr_data_1 = key[2*K-1:K]; 

		OL_clr = cur_index_rst;
		OL_wr_en_0_t1 = OL_GT_wr_en_end_t1;
		OL_wr_en_1_t1 = (cur_index_inc_t1&is_XORS_t1)|is_FF_t1;
		OL_wr_addr_0_t1 = OL_wr_addr_end_t1; 
		OL_wr_addr_1_t1 = cur_index_t1; 
		OL_rd_addr_0 = in0-init_input_size;
		OL_rd_addr_1 = in1-init_input_size;  
		OL_wr_data_0_t1 = out_label_t1;
		OL_wr_data_1_t1 = is_FF_t1? DFF_label_t1 : XOR_label_t1;

		GT_clr = cur_index_rst;
		GT_wr_en_0_t1 = OL_GT_wr_en_end_t1;
		GT_wr_en_1_t1 = 'b0;
		GT_wr_addr_0_t1 = GT_wr_addr_end_t1;
		GT_wr_addr_1_t1 = 'bz;
		GT_rd_addr_0 = 'bz;
		GT_rd_addr_1 = GT_ext_rd_addr;  
		GT_wr_data_0_t1 = {gt_row_0_t1, gt_row_1_t1};
		GT_wr_data_1_t1 = 'bz; 	
	end
	
	/*store output masks*/
	
	logic	[0:2**S-1]	OutputMask_t1;
	logic 				GC_mask_t1;
	logic				OM_inc_beg_t1, OM_inc_end_t1, XOR_mask_beg_t1, XOR_mask_end_t1, is_XOR_end_t1;
	logic	[2:0]		OM_beg_t1, OM_end_t1;
	logic	[S-1:0]		OM_index;
	
	FIFO #(.N(3), .S(NR_AES)) OM(
		.clk(clk), .rst(rst),
		.in(OM_beg_t1),
		.out(OM_end_t1)
	);	
	
	always_comb begin
		GC_mask_t1 = out_label_t1[0];
		XOR_mask_beg_t1 = XOR_label_t1[0];
		OM_inc_beg_t1 = is_output_t1 & cur_index_inc_t1;
		OM_beg_t1 = {XOR_mask_beg_t1, is_XORS_t1, OM_inc_beg_t1};
		{XOR_mask_end_t1, is_XOR_end_t1, OM_inc_end_t1} = OM_end_t1;
	end
	
	always_ff @(posedge clk or posedge rst) begin
		if(rst|cur_index_rst) OutputMask_t1 <= {(2**S){1'b0}};		
		else if(OM_inc_end_t1) begin
			if(is_XOR_end_t1) OutputMask_t1[output_size-1-OM_index] <= XOR_mask_end_t1;
			else OutputMask_t1[output_size-1-OM_index] <= GC_mask_t1;
		end	
	end
	
	/*counters*/
	
	assign cur_index_overflow = (cur_index == dff_gate_size-1);
	
	always_ff @(posedge clk or posedge rst) begin
		if(rst|cid_rst) cid <= 0;
		else if(cid_inc) cid <= cid + 'd1;
		
		if(rst|cur_index_rst) cur_index <= 0;
		else if(cur_index_inc & ~cur_index_overflow) cur_index <= cur_index + 'd1;
		
		if(rst|cur_index_rst) cur_num_XOR_t1 <= 0;
		else if(cur_index_inc_t1&is_XORS_t1) cur_num_XOR_t1 <= cur_num_XOR_t1 + 'd1;
		
		if(rst|cur_index_rst) OM_index <= 0;
		else if(OM_inc_end_t1) OM_index <= OM_index + 'd1;
		
		if(rst|cur_index_rst) GT_ext_rd_addr <= 0;
		else if(GT_ext_rd_inc) GT_ext_rd_addr <= GT_ext_rd_addr + 'd1;
	end
	
	/*garble the netlist*/
	
	/*assign labels*/
	
	typedef enum{
		NONE,
		R_AES,
		KEY_0,
		KEY_1,
		IL_0,
		IL_1,
		OL_0,
		OL_1,
		GT_RD,
		OM_RD
	}mem_id;
	
	mem_id DFF_mem_id, DFF_mem_id_t1, in0_mem_id, in0_mem_id_t1, in1_mem_id, in1_mem_id_t1;
	
	always_ff @(posedge clk or posedge rst)
		if(rst) begin
			DFF_mem_id_t1 <= NONE;
			in0_mem_id_t1 <= NONE;
			in1_mem_id_t1 <= NONE;
		end
		else begin
			DFF_mem_id_t1 <= DFF_mem_id;
			in0_mem_id_t1 <= in0_mem_id;
			in1_mem_id_t1 <= in1_mem_id;
		end
	
	always_comb begin
		case(DFF_mem_id_t1)
			NONE:	DFF_label_t1 = 'b0;
			KEY_0:	DFF_label_t1 = CurrKeys_t1[0];
			KEY_1:	DFF_label_t1 = CurrKeys_t1[1];
			IL_0:	DFF_label_t1 = IL_rd_data_0_t1;
			IL_1:	DFF_label_t1 = IL_rd_data_1_t1;
			OL_0:	DFF_label_t1 = OL_rd_data_0_t1;
			OL_1:	DFF_label_t1 = OL_rd_data_1_t1;
		endcase
		case(in0_mem_id_t1)
			NONE:	in0_label_t1 = 'b0;
			KEY_0:	in0_label_t1 = CurrKeys_t1[0];
			KEY_1:	in0_label_t1 = CurrKeys_t1[1];
			IL_0:	in0_label_t1 = IL_rd_data_0_t1;
			IL_1:	in0_label_t1 = IL_rd_data_1_t1;
			OL_0:	in0_label_t1 = OL_rd_data_0_t1;
			OL_1:	in0_label_t1 = OL_rd_data_1_t1;
		endcase
		case(in1_mem_id_t1)
			NONE:	in1_label_t1 = 'b0;
			KEY_0:	in1_label_t1 = CurrKeys_t1[0];
			KEY_1:	in1_label_t1 = CurrKeys_t1[1];
			IL_0:	in1_label_t1 = IL_rd_data_0_t1;
			IL_1:	in1_label_t1 = IL_rd_data_1_t1;
			OL_0:	in1_label_t1 = OL_rd_data_0_t1;
			OL_1:	in1_label_t1 = OL_rd_data_1_t1;
		endcase
	end
	
	/*FSM*/
	
	typedef enum{
		IDLE,
		GETKEYS,
		CONSTLABELS,
		WAIT,
		DFF,
		GARBLE,
		MASKS,
		RSTCOUNTERS
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
		OL_GT_wr_en_beg_t1 = 'b0;
		nextState = currState;
		
		case(currState)
			IDLE: begin
				cid_rst = 'b1;
				cur_index_rst = 'b1;		
				R = 'b0; 
				AES_key = 'b0; 
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
								OL_rd_addr_0 is always assigned to in0, so we read it from OL_rd_data_0_t1
							
				CONSTZERO = -2, CONSTONE = -3, IL_rd_addr_0 = in0+'d2, IL_rd_addr_1 = in1+'d2, 
				labels for CONSTZERO and CONSTONE are saved in locations 0 and 1 respectively of InputLabels*/
				
				cur_index_inc = 'b1;
				
				if(cid == 'd0) begin
					if ((in1 == CONSTZERO)||(in1 == CONSTONE)) DFF_mem_id = IL_1;
					else begin //generate init label and store in both InputLabels and OutputLabels
						IL_wr_en_1 = ~IL_rd_data_ready_1; 
						IL_wr_addr_1 = in1+'d2;
						en_LabelGen = {IL_wr_en_1, 1'b0};
						DFF_mem_id = KEY_1;
					end
				end
				else begin
					if ((in0 == CONSTZERO)||(in0 == CONSTONE)) DFF_mem_id = IL_0;
					else DFF_mem_id = OL_0;
				end
				if(cur_index == dff_size-1) begin 
					nextState = GARBLE;
				end
			end		
			GARBLE: begin				
				cur_index_inc = (in0F|OL_rd_data_ready_0) & (in1F|OL_rd_data_ready_1);
			
				IL_wr_en_0 = in0F & ~IL_rd_data_ready_0;
				IL_wr_en_1 = in1F & ~IL_rd_data_ready_1 & ~((g_logic == NOTGATE)); //is_NOT_t1 is not matched in time
				IL_wr_addr_0 = in0+'d2;
				IL_wr_addr_1 = in1+'d2; 
				
				en_LabelGen = {IL_wr_en_1, IL_wr_en_0};
				
				if(in0F) begin
					if(IL_rd_data_ready_0) in0_mem_id = IL_0;
					else in0_mem_id = KEY_0;
				end
				else in0_mem_id = OL_0;
				
				if(in1F) begin
					if(IL_rd_data_ready_1) in1_mem_id = IL_1;
					else in1_mem_id = KEY_1;
				end
				else in1_mem_id = OL_1;	
				
				OL_GT_wr_en_beg_t1 = cur_index_inc_t1&(~(is_XORS_t1|is_FF_t1));		

				/*processed all dffs and gates, transferred all garbled tables, and the inputs for the last gate are ready*/
				if((cur_index >= dff_gate_size-1)&&(GT_ext_rd_addr >= gate_size-num_XOR-1)&&(cur_index_inc == 'b1)) nextState = MASKS;
			end
			MASKS: begin
				if(OM_index == output_size) nextState = RSTCOUNTERS;
			end
			RSTCOUNTERS:  begin
				cid_inc = 'b1;
				cur_index_rst = 'b1;				
				nextState = DFF;
			end
		endcase
	end
	
	/*send data, part of the same state machine, written separately to keep it clean*/	
	/*
	tag_t1 
	000: nothing
	101: input 0	110: input 1		111: input 0 and 1
	001: keys		010: garbled table	011: masks
	*/
	
	logic	[2:0]	tag;
	logic	[S-1:0]	index0, index1; 
	mem_id data_mem_id, data_mem_id_t1;
	
	always_ff @(posedge clk or posedge rst) begin
		if(rst) begin
			tag_t1 <= 'b0;
			index0_t1 <= -1;
			index1_t1 <= -1;
			data_mem_id_t1 <= NONE;
		end
		else begin
			tag_t1 <= tag;
			index0_t1 <= index0;
			index1_t1 <= index1;
			data_mem_id_t1 <= data_mem_id;
		end
	end	
	
	always_comb begin
		case(data_mem_id_t1)
			R_AES: begin
				data0_t1 = R;
				data1_t1 = AES_key;
			end	
			KEY_0: begin
				data0_t1 = CurrKeys_t1[0];
				data1_t1 = CurrKeys_t1[1];
			end	
			GT_RD: begin
				data0_t1 = GT_rd_data_1_t1[2*K-1:K];
				data1_t1 = GT_rd_data_1_t1[K-1:0];
			end	
			OM_RD: begin
				data0_t1 = OutputMask_t1[0:K-1];
				data1_t1 = OutputMask_t1[K:2*K-1];
			end			
		endcase
	end
	
	always_comb begin
		tag = 'b000;
		index0 = -1;
		index1 = -1;
		GT_ext_rd_inc = 'b0;
		case(currState)
			GETKEYS: begin
				tag = 'b001;
				data_mem_id = R_AES;
			end				
			CONSTLABELS: begin
				tag = 'b111;
				index0 = IL_wr_addr_0;
				index1 = IL_wr_addr_1;
				data_mem_id = KEY_0; //KEY_0 and KEY_1 equivalent in this case
			end		
			WAIT: begin
			end		
			DFF: begin	
				if(|en_LabelGen) begin
					tag = {1'b1, en_LabelGen};
					index0 = IL_wr_addr_0;
					index1 = IL_wr_addr_1;
					data_mem_id = KEY_0; //KEY_0 and KEY_1 equivalent in this case				
				end
			end			
			GARBLE: begin
				if(|en_LabelGen) begin
					tag = {1'b1, en_LabelGen};
					index0 = IL_wr_addr_0;
					index1 = IL_wr_addr_1;
					data_mem_id = KEY_0; //KEY_0 and KEY_1 equivalent in this case							
				end
				else begin
					if(GT_rd_data_ready_1) begin
						tag = 3'b010;
						GT_ext_rd_inc = 'b1;
						index0 = 2*GT_ext_rd_addr;
						index1 = 2*GT_ext_rd_addr+'d1;
						data_mem_id = GT_RD; //KEY_0 and KEY_1 equivalent in this case	
					end
				end
			end
			MASKS: begin
				if(OM_index == output_size) begin
					tag = 3'b011;
					data_mem_id = OM_RD;
				end
			end
		endcase
	end
	
endmodule

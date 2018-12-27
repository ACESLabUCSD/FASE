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
	input			clk, rst, start
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
	
	logic	[S-1:0]	cid, gid;
	logic	[3:0]	g_logic;
	logic					done_Netlist;
	logic	signed	[S-1:0]	init_size, input_size, dff_size, output_size, gate_size;
	logic					in0F, in1F;
	logic	signed	[S-1:0]	in0, in1;
	logic					is_output;
	
	Netlist #(.S(S)) Netlist(
		.clk(clk), .rst(rst), .start(start),
		.gid(gid),
		.done(done_Netlist),
		.init_size(init_size), .input_size(input_size), .dff_size(dff_size), .output_size(output_size), .gate_size(gate_size),
		.in0F(in0F), .in1F(in1F),
		.in0(in0), .in1(in1),
		.g_logic(g_logic),
		.is_output(is_output)
	);
	
	/*garble a gate*/
	
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
	
	/*XORs*/
	
	logic			is_XOR, is_XNOR;
	logic	[K-1:0]	XOR_label;
	logic	[S-1:0]	num_XOR;
		
	always_comb begin	
		is_XOR = ((g_logic == XORGATE)|(g_logic == XNORGATE)|(g_logic == NOTGATE))? 'b1 : 'b0;
		is_XNOR = (g_logic == XNORGATE)? 'b1 : 'b0;
		XOR_label = is_XNOR? in0_label^in1_label^R : in0_label^in1_label;
	end
	
	/*FIFOs for output labels and garbled tables*/
	
	logic			OL_GT_wr_en_beg, OL_GT_wr_en_end;
	logic	[S-1:0]	OL_wr_addr_beg, OL_wr_addr_end;
	logic	[S-1:0]	GT_wr_addr_beg, GT_wr_addr_end;
	
	FIFO #(.N(1), .S(NR_AES)) FIFO_OL_GT_wr_en_0(	
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
	
	/*memories for input labels, output labels, and garbled tables*/
	
	logic				IL_wr_en_0, IL_wr_en_1;
	logic	[S-1:0]		IL_wr_addr_0, IL_wr_addr_1;
	logic	[S-1:0]		IL_rd_addr_0, IL_rd_addr_1;  
	logic	[K-1:0]		IL_wr_data_0, IL_wr_data_1; 
	logic	[K-1:0]		IL_rd_data_0, IL_rd_data_1;
	
	DPRAM #(.S(S), .K(K)) InLabels(
		.clk(clk), .rst(rst),
		.wr_en_0(IL_wr_en_0), .wr_en_1(IL_wr_en_1),
		.wr_addr_0(IL_wr_addr_0), .wr_addr_1(IL_wr_addr_1),
		.rd_addr_0(IL_rd_addr_0), .rd_addr_1(IL_rd_addr_1),  
		.wr_data_0(IL_wr_data_0), .wr_data_1(IL_wr_data_1), 
		.rd_data_0(IL_rd_data_0), .rd_data_1(IL_rd_data_1)
	);
	
	logic				ILF_wr_en_0, ILF_wr_en_1;
	logic	[S-1:0]		ILF_wr_addr_0, ILF_wr_addr_1;
	logic	[S-1:0]		ILF_rd_addr_0, ILF_rd_addr_1;  
	logic				ILF_wr_data_0, ILF_wr_data_1; 
	logic				ILF_rd_data_0, ILF_rd_data_1;
	
	DPRAM #(.S(S), .K(1)) InLabelsFlag(
		.clk(clk), .rst(rst),
		.wr_en_0(ILF_wr_en_0), .wr_en_1(ILF_wr_en_1),
		.wr_addr_0(ILF_wr_addr_0), .wr_addr_1(ILF_wr_addr_1),
		.rd_addr_0(ILF_rd_addr_0), .rd_addr_1(ILF_rd_addr_1),  
		.wr_data_0(ILF_wr_data_0), .wr_data_1(ILF_wr_data_1), 
		.rd_data_0(ILF_rd_data_0), .rd_data_1(ILF_rd_data_1)
	);
	
	logic				OL_wr_en_0, OL_wr_en_1;
	logic	[S-1:0]		OL_wr_addr_0, OL_wr_addr_1;
	logic	[S-1:0]		OL_rd_addr_0, OL_rd_addr_1;  
	logic	[K-1:0]		OL_wr_data_0, OL_wr_data_1; 
	logic	[K-1:0]		OL_rd_data_0, OL_rd_data_1;
	
	DPRAM #(.S(S), .K(K)) OutLabels(
		.clk(clk), .rst(rst),
		.wr_en_0(OL_wr_en_0), .wr_en_1(OL_wr_en_1),
		.wr_addr_0(OL_wr_addr_0), .wr_addr_1(OL_wr_addr_1),
		.rd_addr_0(OL_rd_addr_0), .rd_addr_1(OL_rd_addr_1),  
		.wr_data_0(OL_wr_data_0), .wr_data_1(OL_wr_data_1), 
		.rd_data_0(OL_rd_data_0), .rd_data_1(OL_rd_data_1)
	);
	
	logic				OLF_wr_en_0, OLF_wr_en_1;
	logic	[S-1:0]		OLF_wr_addr_0, OLF_wr_addr_1;
	logic	[S-1:0]		OLF_rd_addr_0, OLF_rd_addr_1;  
	logic	[K-1:0]		OLF_wr_data_0, OLF_wr_data_1; 
	logic	[K-1:0]		OLF_rd_data_0, OLF_rd_data_1;
	
	DPRAM #(.S(S), .K(1)) OutLabelsFlag(
		.clk(clk), .rst(rst),
		.wr_en_0(OLF_wr_en_0), .wr_en_1(OLF_wr_en_1),
		.wr_addr_0(OLF_wr_addr_0), .wr_addr_1(OLF_wr_addr_1),
		.rd_addr_0(OLF_rd_addr_0), .rd_addr_1(OLF_rd_addr_1),  
		.wr_data_0(OLF_wr_data_0), .wr_data_1(OLF_wr_data_1), 
		.rd_data_0(OLF_rd_data_0), .rd_data_1(OLF_rd_data_1)
	);
	
	logic				GT_wr_en_0, GT_wr_en_1;
	logic	[S-1:0]		GT_wr_addr_0, GT_wr_addr_1;
	logic	[S-1:0]		GT_rd_addr_0, GT_rd_addr_1;  
	logic	[K-1:0]		GT_wr_data_0, GT_wr_data_1; 
	logic	[K-1:0]		GT_rd_data_0, GT_rd_data_1;
	
	DPRAM #(.S(S), .K(K)) GarbledTables(
		.clk(clk), .rst(rst),
		.wr_en_0(GT_wr_en_0), .wr_en_1(GT_wr_en_1),
		.wr_addr_0(GT_wr_addr_0), .wr_addr_1(GT_wr_addr_1),
		.rd_addr_0(GT_rd_addr_0), .rd_addr_1(GT_rd_addr_1),  
		.wr_data_0(GT_wr_data_0), .wr_data_1(GT_wr_data_1), 
		.rd_data_0(GT_rd_data_0), .rd_data_1(GT_rd_data_1)
	);	
		
	always_comb begin			
		OL_wr_addr_beg = gid;
		GT_wr_addr_beg = gid - num_XOR;
	
		IL_rd_addr_0 = in0+'d2;//first two locations are saved for constant labels
		IL_rd_addr_1 = in1+'d2;
		IL_wr_data_0 = in0_label;
		IL_wr_data_1 = in1_label; 

		ILF_wr_en_0 = IL_wr_en_0;
		ILF_wr_en_1 = IL_wr_en_1; 
		ILF_wr_addr_0 = IL_wr_addr_0;
		ILF_wr_addr_1 = IL_wr_addr_1; 
		ILF_rd_addr_0 = IL_rd_addr_0;
		ILF_rd_addr_1 = IL_rd_addr_1;
		ILF_wr_data_0 = 'b1;
		ILF_wr_data_1 = 'b1;

		OL_wr_en_0 = OL_GT_wr_en_end;
		OL_wr_en_1 = is_XOR;
		OL_wr_addr_0 = OL_wr_addr_end;
		OL_wr_addr_1 = gid;
		OL_rd_addr_0 = in0-input_size;
		OL_rd_addr_1 = in1-input_size;  
		OL_wr_data_0 = out_label;
		OL_wr_data_1 = XOR_label;

		OLF_wr_en_0 = OL_wr_en_0;
		OLF_wr_en_1 = OL_wr_en_1;
		OLF_wr_addr_0 = OL_wr_addr_0;
		OLF_wr_addr_1 = OL_wr_addr_1;
		OLF_rd_addr_0 = OL_rd_addr_0;
		OLF_rd_addr_1 = OL_rd_addr_1;  
		OLF_wr_data_0 = 'b1;
		OLF_wr_data_1 = 'b1; 

		GT_wr_en_0 = OL_GT_wr_en_end;
		GT_wr_en_1 = OL_GT_wr_en_end;
		GT_wr_addr_0 = 2*GT_wr_addr_end;
		GT_wr_addr_1 = 2*GT_wr_addr_end+'d1;
		GT_rd_addr_0 = 'b0;
		GT_rd_addr_1 = 'b0;  
		GT_wr_data_0 = t0;
		GT_wr_data_1 = t1; 		
	end
	
	/*garble the netlist*/
	
	logic	gid_inc;
	always_ff @(posedge clk or posedge rst)
		if(rst) begin 
			gid <= -'d1;
			num_XOR <= 'd0;
		end
		else begin 
			if(gid_inc) begin
				gid <= gid + 'd1;
				if(is_XOR) num_XOR <= num_XOR + 'd1;
			end
		end
	
	typedef enum{
		IDLE,
		GETKEYS,
		CONSTLABELS,
		WAIT,
		GARBLE
	}state;
	
	state currState, nextState;
	
	always_ff @(posedge clk or posedge rst)
		if(rst) currState <= IDLE;
		else currState <= nextState;
		
	always_comb begin
		en_LabelGen = 'b0;
		gid_inc = 'b0;
		IL_wr_en_0 = 'b0;
		IL_wr_en_1 = 'b0;
		IL_wr_addr_0 = {S{1'b1}};
		IL_wr_addr_1 = {S{1'b1}};
		OL_GT_wr_en_beg = 'b0;	
		nextState = currState;
		
		case(currState)
			IDLE: begin
				cid = 'd0;			
				R = 'b0; 
				AES_key = 'b0; 
				in0_label = 'b0;
				in1_label = 'b0;
				if(start == 'b1) nextState = GETKEYS;
			end
			GETKEYS: begin
				en_LabelGen = 'b11;
				R = key[K-1:0];
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
				
				gid_inc = 'b1; //gid starts from -1, starting the counter here so that from the beginning of the next state gid is 0
				
				if(done_Netlist) nextState = GARBLE;
				else nextState = WAIT;
			end		
			WAIT: begin
				if(done_Netlist) nextState = GARBLE;
			end		
			GARBLE: begin				
				IL_wr_en_0 = in0F & ~ILF_rd_data_0;
				IL_wr_en_1 = in1F & ~ILF_rd_data_1; 
				IL_wr_addr_0 = in0+'d2;
				IL_wr_addr_1 = in1+'d2; 
				
				en_LabelGen = {IL_wr_en_1, IL_wr_en_0};
				
				if(in0F) begin
					if(ILF_rd_data_0) in0_label = IL_rd_data_0;
					else in0_label = key[K-1:0];
				end
				else in0_label = OL_rd_data_0;
				
				if(in1 == -1) in1_label = R; 
				else if(in1F) begin
					if(ILF_rd_data_1) in1_label = IL_rd_data_1;
					else in1_label = key[2*K-1:K];
				end
				else in1_label = OL_rd_data_1;	
				
				OL_GT_wr_en_beg = ~is_XOR;	
				
				gid_inc = (in0F|OLF_rd_data_0) & (in1F|OLF_rd_data_1);			
			end
		endcase
	end
	
endmodule

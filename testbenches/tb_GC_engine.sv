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

module tb_GC_engine;
	
	logic			clk, rst;	
	logic	[K-1:0]	R, AES_key;
	logic	[128*(NR_AES+1)-1:0] AES_expandedKey;
	logic	[S-1:0]	cid, gid;
	logic	[3:0]	g_logic;
	logic	[K-1:0]	in0_label, in1_label;
	logic	[K-1:0]	out_label;
	logic	[K-1:0]	out_label_ref;
	logic	[K-1:0]	gt_row_0, gt_row_1;
	logic	[K-1:0]	gt_row_0_ref, gt_row_1_ref;
	
	KeyExpansion e (
		.key(AES_key), 
		.expandedKey(AES_expandedKey)
	);

	GC_engine #(.S(S), .K(K)) uut (  
		.clk(clk), .rst(rst),
		.R(R),
		.AES_expandedKey(AES_expandedKey),		
		.cid(cid), .gid(gid),
		.g_logic(g_logic),
		.in0_label(in0_label), .in1_label(in1_label),
		.gt_row_0(gt_row_0), .gt_row_1(gt_row_1),
		.out_label(out_label)
	);	
	
	parameter num_gates = 11;
	
	logic	[K-1:0]	KEYS [0:1];
	logic	[S-1:0]	IN0 [0:num_gates-1]; 
	logic	[S-1:0]	IN1 [0:num_gates-1]; 
	logic	[3:0]	G_LOGICS [0:num_gates-1]; 
	logic	[K-1:0]	IN_LABELS [0:2*num_gates+1]; 
	logic	[K-1:0]	GT_REF [0:2*num_gates-1];
	logic	[K-1:0]	OUT_LABELS_REF [0:2*num_gates-1];
	
	logic	[S-1:0]	in0, in1;
	
	integer k, l, m, x;
	integer X[num_gates];

	always #50 clk = ~clk;
	
	localparam KEYFILE = "Keys.txt";
	localparam LABELFILE = "Labels.txt";
	localparam IN0FILE = "In0.txt";
	localparam IN1FILE = "In1.txt";
	localparam LOGICFILE = "Logics.txt";
	localparam TABLEFILE = "Tables.txt";
	localparam OLABELFILE = "OLabels.txt";
		
	initial begin
		$readmemh(KEYFILE, KEYS);
		$readmemh(LABELFILE, IN_LABELS);
		$readmemh(IN0FILE, IN0);
		$readmemh(IN1FILE, IN1);
		$readmemh(LOGICFILE, G_LOGICS);
		$readmemh(TABLEFILE, GT_REF);
		$readmemh(OLABELFILE, OUT_LABELS_REF);
		
		clk = 'b0;
		rst = 'b1;
		
		gid = 'b0;				
		g_logic = 'b0;
		in0_label = 'b0;
		in1_label = 'b0;		
		R = KEYS[0]; 
		AES_key = KEYS[1]; 
		cid = 'd0;
		
		#100;
		rst = 'b0;
		
		x = 0;		
		for (l = 0; l < NR_AES+12; l = l+1) begin	
			@(posedge clk);	
			if(l < num_gates) begin
				gid = l;	
				in0 = IN0[l] + 2; //The first two labels from the Labels file are assigned to constants
				in1 = IN1[l] + 2;
				g_logic = G_LOGICS[l];
				in0_label = IN_LABELS[in0];
				in1_label = IN_LABELS[in1];	
				if ((g_logic == XORGATE)|(g_logic == XNORGATE)|(g_logic == NOTGATE)) x = x + 1;
				X[l] = x;
			end
			if(l > NR_AES) begin
				m = l-NR_AES-1;
				gt_row_0_ref = GT_REF[2*(m-X[m])];
				gt_row_1_ref = GT_REF[2*(m-X[m])+1];	
				out_label_ref = OUT_LABELS_REF[2*(m)];
				
				$display("\ngate id = %d\nout_label = %x \nt0 = %x \nt1 = %x", m, out_label, gt_row_0, gt_row_1);				
				g_logic = G_LOGICS[m];
				if ((g_logic == XORGATE)|(g_logic == XNORGATE)|(g_logic == NOTGATE)) $display("XOR gate");
				else begin
					assert((out_label == out_label_ref) && (gt_row_0 == gt_row_0_ref) && (gt_row_1 == gt_row_1_ref)) $display("Pass");
					else $error("Correct Values: \nout_label = %x \nt0 = %x \nt1 = %x", out_label_ref, gt_row_0_ref, gt_row_1_ref);	
				end
			end
		end		
		
		$stop();		
	end

endmodule

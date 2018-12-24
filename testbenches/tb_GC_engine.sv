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

	localparam S=20, L=32, K=128;
	
	logic			clk, rst;	
	logic	[K-1:0]	R, AES_key;
	logic	[128*(NR_AES+1)-1:0] AES_expandedKey;
	logic	[S-1:0]	cid, gid;
	logic	[3:0]	g_logic;
	logic	[K-1:0]	in0_label, in1_label;
	logic	[K-1:0]	out_label;
	logic	[K-1:0]	out_label_ref;
	logic	[K-1:0]	t0, t1;
	logic	[K-1:0]	t0_ref, t1_ref;
	
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
		.t0(t0), .t1(t1),
		.out_label(out_label)
	);	
	
	logic	[K-1:0]	KEYS [0:19];
	logic	[3:0]	IN0 [0:7]; 
	logic	[3:0]	IN1 [0:7]; 
	logic	[3:0]	G_LOGICS [0:7]; 
	logic	[K-1:0]	T_REF [0:15];
	logic	[K-1:0]	OUT_LABELS_REF [0:15];
	
	logic	[L-1:0]	in0, in1;
	
	integer k, l;

	always #50 clk = ~clk;
		
	initial begin
		$readmemh({LOC, KEYFILE}, KEYS);
		$readmemh({LOC, IN0FILE}, IN0);
		$readmemh({LOC, IN1FILE}, IN1);
		$readmemh({LOC, LOGICFILE}, G_LOGICS);
		$readmemh({LOC, TABLEFILE}, T_REF);
		$readmemh({LOC, OLABELFILE}, OUT_LABELS_REF);
		
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
			
		for (l = 0; l < NR_AES+9; l = l+1) begin	
			@(posedge clk);	
			if(l < 8) begin
				gid = l;	
				in0 = IN0[l] + 4; //The two labels from the Keys file after R and AES keys are assigned to constants
				in1 = IN1[l] + 4;
				g_logic = G_LOGICS[l];
				in0_label = KEYS[in0];
				in1_label = KEYS[in1];	
			end
			if(l > NR_AES) begin
				t0_ref = T_REF[2*(l-NR_AES-1)];
				t1_ref = T_REF[2*(l-NR_AES-1)+1];	
				out_label_ref = OUT_LABELS_REF[2*(l-NR_AES-1)];
				
				$display("%d\nout_label = %x \nt0 = %x \nt1 = %x", l-NR_AES-1, out_label, t0, t1);
				assert((out_label == out_label_ref) && (t0 == t0_ref) && (t1 == t1_ref)) $display("Pass");
				else $error("Correct Values: \nout_label = %x \nt0 = %x \nt1 = %x", out_label_ref, t0_ref, t1_ref);	
			end
		end		
		
		$stop();		
	end

endmodule

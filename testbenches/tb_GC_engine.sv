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
	
	logic	[K-1:0]	R, AES_key;
	logic	[S-1:0]	cid, gid;
	logic	[3:0]	g_logic;
	logic	[K-1:0]	in0_label, in1_label;
	logic	[K-1:0]	out_label;
	logic	[K-1:0]	out_label_ref;
	logic	[K-1:0]	t0, t1;
	logic	[K-1:0]	t0_ref, t1_ref;

	GC_engine #(.S(S), .K(K)) uut (  
		.R(R),
		.AES_key(AES_key),
		.cid(cid),
		.gid(gid),
		.g_logic(g_logic),
		.in0_label(in0_label),
		.in1_label(in1_label),
		.t0(t0),
		.t1(t1),
		.out_label(out_label)
	);	
	
	parameter LOC = "/home/siam/git/hostCPU_TG/hw_aclrtr/all_logic/";
	parameter KEYFILE = "Keys.txt";
	parameter IN0FILE = "In0.txt";
	parameter IN1FILE = "In1.txt";
	parameter LOGICFILE = "Logics.txt";
	parameter LABELFILE = "Labels.txt";
	parameter TABLEFILE = "Tables.txt";
	parameter OLABELFILE = "OLabels.txt";
	
	logic	[K-1:0]	KEYS [0:1];
	logic	[3:0]	IN0 [0:7]; 
	logic	[3:0]	IN1 [0:7]; 
	logic	[3:0]	G_LOGICS [0:7]; 
	logic	[K-1:0]	IN_LABELS [0:17]; //The first two labels from the Labels file are assigned to constants
	logic	[K-1:0]	T_REF [0:15];
	logic	[K-1:0]	OUT_LABELS_REF [0:15];
	
	logic	[L-1:0]	in0, in1;
	
	integer i;

	initial
	begin
		$readmemh({LOC, KEYFILE}, KEYS);
		$readmemh({LOC, IN0FILE}, IN0);
		$readmemh({LOC, IN1FILE}, IN1);
		$readmemh({LOC, LOGICFILE}, G_LOGICS);
		$readmemh({LOC, LABELFILE}, IN_LABELS);
		$readmemh({LOC, TABLEFILE}, T_REF);
		$readmemh({LOC, OLABELFILE}, OUT_LABELS_REF);
		
		R = KEYS[0]; 
		AES_key = KEYS[1]; 
		cid = 'd0;
		
		for (i = 0; i < 8; i = i+1) begin			
			gid = i;	
			in0 = IN0[i] + 2; //The first two labels from the Labels file are assigned to constants
			in1 = IN1[i] + 2;
			g_logic = G_LOGICS[i];
			in0_label = IN_LABELS[in0];
			in1_label = IN_LABELS[in1];	
			t0_ref = T_REF[2*i];
			t1_ref = T_REF[2*i+1];	
			out_label_ref = OUT_LABELS_REF[2*i];
			#1;
			$display("%d\nout_label = %x \nt0 = %x \nt1 = %x", i, out_label, t0, t1);
			assert((out_label == out_label_ref) && (t0 == t0_ref) && (t1 == t1_ref)) $display("Pass");
			else $error("Correct Values: \nout_label = %x \nt0 = %x \nt1 = %x", out_label_ref, t0_ref, t1_ref);			
			#10;
		end
		
		$stop();		
	end	

endmodule

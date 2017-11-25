// Copyright 2015 Songhori, Ebrahim

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


module tb_GC_engine;

	localparam S=20, L=32, K=128;

	reg				clk;
	
	reg 	[K-1:0]	R, AES_key;

	reg		[S-1:0]	cid, gid;

	reg		[K-1:0]	in0_label, in1_label;

	wire	[K-1:0]	out_label;
	reg		[K-1:0]	out_label_ref;

	wire	[K-1:0]	t0, t1;
	reg		[K-1:0]	t0_ref, t1_ref;

	GC_engine #(.S(S), .K(K)) uut (  
		.R(R),
		.AES_key(AES_key),
		.cid(cid),
		.gid(gid),
		.in0_label(in0_label),
		.in1_label(in1_label),
		.t0(t0),
		.t1(t1),
		.out_label(out_label)
	);	


	always #50 clk=~clk;

	initial
	begin
		clk = 0;

		R = 128'hffffffff_ffffffff_ffffffff_ffffffff ;
		AES_key = 128'h070099cb_1ac4dce4_c95ed0f3_ad18dce4;

		cid = 20'd1;
		gid = 20'd2;

		in0_label = 128'hX;
		in1_label = 128'hX;

		@(posedge clk);
		
		in0_label = 128'h2e042293_8bcfc8d2_f730f940_12da7244;
		in1_label = 128'h1dc0dcda_c3c3ce43_a3ea9323_b42574d5;
		
		out_label_ref = 128'h83da0cdb_44f17220_3032a794_e80f7db5;
		t0_ref = 128'hd187df08_33af8db7_16c9353a_62be8d18;
		t1_ref = 128'h190b405c_f77799bd_e54c9275_e96dff40;			
		
		@(posedge clk);
		
		in0_label = 128'h2b73eabd_0406297d_5da1ab0d_bab1fc86;
		in1_label = 128'hf3d20ae1_b32a3962_68486f2b_6b6b27c1;
		
		out_label_ref = 128'h596923b3f5f7cb06b518ba0681ea0737;
		t0_ref = 128'h0a045702af0e3335da0a651c1f758b83;
		t1_ref = 128'hb985b769ddc6c6ea813dbfaa79ede20b;	
		
		
	end	
		
	always @(out_label) begin
		#10;
		$display("out_label = %x \nt0 = %x \nt1 = %x", out_label, t0, t1);
		if((out_label == out_label_ref) || (t0 == t0_ref) || (t1 == t1_ref)) $display("Pass");
		else $display("Fail! \nCorrect Values: \nout_label = %x \nt0 = %x \nt1 = %x", out_label_ref, t0_ref, t1_ref);
	end

endmodule

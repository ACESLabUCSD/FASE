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

		R = 128'h93D5B035B782DBB4A04097B7B6D7DBB5 ;
		AES_key = 128'hEC45CB722FC0DBA74829739EC516DBA7;

		cid = 20'd0;
		gid = 20'd0;

		in0_label = 128'hX;
		in1_label = 128'hX;

		@(posedge clk);
		
		in0_label = 128'h68B695F9E1BFC0A9646FBB88694A66F7;
		in1_label = 128'hF965EA419F90407ABA09D714C18F5F5C;
		
		out_label_ref = 128'hF42A5CA5E208CF5AA2EADFC8CA6CC33A;
		t0_ref = 128'h1C64A9FAFFB6905471A6B17B1979977D;
		t1_ref = 128'hC17835695FF945D30B64A1973415FC1B;			
		
		@(posedge clk);
		
		in0_label = 128'h5271DAD279EFDE733D23385036CB03D9;
		in1_label = 128'hBA789E13091AD85C2A9EE573D06ED20B;
		
		out_label_ref = 128'h06D6709E0102033E142A5727BDFB3260;
		t0_ref = 128'h44862828837B832B5ACB8D8E9E1B2F6C;
		t1_ref = 128'hC3204E1009BF70C4CB86852110689390;	
		
		
	end	
		
	always @(out_label) begin
		#10;
		$display("out_label = %x \nt0 = %x \nt1 = %x", out_label, t0, t1);
		if((out_label == out_label_ref) || (t0 == t0_ref) || (t1 == t1_ref)) $display("Pass");
		else $display("Fail! \nCorrect Values: \nout_label = %x \nt0 = %x \nt1 = %x", out_label_ref, t0_ref, t1_ref);
	end

endmodule

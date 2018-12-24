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

//This module garbles a single AND gate per cycle

`include "../Header/MAC_H.vh"

module GC_engine #(parameter S=20, K=128 )(	
	input					clk, rst,
	input 			[K-1:0]	R,// AES_key,
	input			[128*(NR_AES+1)-1:0] AES_expandedKey,
	input			[S-1:0]	cid, gid,
	input			[3:0]	g_logic,
	input			[K-1:0]	in0_label, in1_label,
	output	logic	[K-1:0]	t0, t1, out_label
);

	logic	[K-1:0]	in0_label_R, in1_label_R;
	
	logic	[K-1:0]	A0_beg, A1_beg, B0_beg, B1_beg;
	logic	[K-1:0]	A0_end, A1_end, B0_end, B1_end;
	
	logic	[2:0]	v_beg, v_end;
	logic	[S-1:0]	cid_end, gid_end;
	
	logic	[K-1:0]	tweak0_beg, tweak1_beg;
	logic	[K-1:0]	tweak0_end, tweak1_end;
	
	logic 			pa, pb;

	logic	[K-1:0]	mask0_beg, mask1_beg, mask2_beg, mask3_beg;
	logic	[K-1:0]	mask0_end, mask1_end, mask2_end, mask3_end;
	logic	[K-1:0]	key0, key1, key2, key3;
	logic	[K-1:0]	mask_key0, mask_key1, mask_key2, mask_key3;

	logic	[K-1:0]	G, E;	
	logic	[K-1:0]	C0, C1;
	
	FIFO #(.N(K), .S(NR_AES)) FIFO_A0(	
		.clk(clk), .rst(rst),
		.in(A0_beg),
		.out(A0_end)
	);
	
	FIFO #(.N(K), .S(NR_AES)) FIFO_A1(	
		.clk(clk), .rst(rst),
		.in(A1_beg),
		.out(A1_end)
	);
	
	FIFO #(.N(K), .S(NR_AES)) FIFO_B0(	
		.clk(clk), .rst(rst),
		.in(B0_beg),
		.out(B0_end)
	);
	
	FIFO #(.N(K), .S(NR_AES)) FIFO_B1(	
		.clk(clk), .rst(rst),
		.in(B1_beg),
		.out(B1_end)
	);
	
	FIFO #(.N(S), .S(NR_AES)) FIFO_cid(	
		.clk(clk), .rst(rst),
		.in(cid),
		.out(cid_end)
	);
	
	FIFO #(.N(S), .S(NR_AES)) FIFO_gid(	
		.clk(clk), .rst(rst),
		.in(gid),
		.out(gid_end)
	);
	
	FIFO #(.N(3), .S(NR_AES)) FIFO_v(	
		.clk(clk), .rst(rst),
		.in(v_beg),
		.out(v_end)
	);

	AES_128 AES_128_0(
		.clk(clk), .rst(rst),
		.state(mask0_beg), 
		.expandedKey(AES_expandedKey), 
		.out(key0)
	);

	AES_128 AES_128_1(
		.clk(clk), .rst(rst),
		.state(mask1_beg),
		.expandedKey(AES_expandedKey), 
		.out(key1)
	);

	AES_128 AES_128_2(
		.clk(clk), .rst(rst),
		.state(mask2_beg),
		.expandedKey(AES_expandedKey), 
		.out(key2)
	);

	AES_128 AES_128_3(
		.clk(clk), .rst(rst),
		.state(mask3_beg), 
		.expandedKey(AES_expandedKey),
		.out(key3)
	);
	
	always_comb begin		
		/*before AES*/
		
		v_beg = Type2V(g_logic);
		in0_label_R = in0_label ^ R;
		in1_label_R = in1_label ^ R;
		
		if(v_beg[0]) begin
			A0_beg = in0_label_R;
			A1_beg = in0_label;
		end
		else begin
			A0_beg = in0_label;
			A1_beg = in0_label_R;			
		end
		
		if(v_beg[1]) begin
			B0_beg = in1_label_R;
			B1_beg = in1_label;
		end
		else begin
			B0_beg = in1_label;
			B1_beg = in1_label_R;			
		end
	
		tweak0_beg = {{(K/2-S){1'b0}}, cid, {(K/2-S-1){1'b0}}, gid, 1'b0};
		tweak1_beg = {{(K/2-S){1'b0}}, cid, {(K/2-S-1){1'b0}}, gid, 1'b1};
	
		mask0_beg = A0_beg ^ tweak0_beg;
		mask1_beg = A1_beg ^ tweak0_beg;
		mask2_beg = B0_beg ^ tweak1_beg;
		mask3_beg = B1_beg ^ tweak1_beg;
		
		/*after AES*/
	
		tweak0_end = {{(K/2-S){1'b0}}, cid_end, {(K/2-S-1){1'b0}}, gid_end, 1'b0};
		tweak1_end = {{(K/2-S){1'b0}}, cid_end, {(K/2-S-1){1'b0}}, gid_end, 1'b1};
	
		mask0_end = A0_end ^ tweak0_end;
		mask1_end = A1_end ^ tweak0_end;
		mask2_end = B0_end ^ tweak1_end;
		mask3_end = B1_end ^ tweak1_end;
	
		mask_key0 = mask0_end ^ key0;
		mask_key1 = mask1_end ^ key1;
		mask_key2 = mask2_end ^ key2;
		mask_key3 = mask3_end ^ key3;
	
		pa = A0_end[0];
		pb = B0_end[0];
	
		t0 = (pb)?(mask_key0 ^ mask_key1 ^ R):(mask_key0 ^ mask_key1);
		t1 = mask_key2 ^ mask_key3 ^ A0_end;
	
		G = (pa)?(mask_key0 ^ t0):(mask_key0);
		E = (pb)?(mask_key2 ^ t1 ^ A0_end):(mask_key2);
		
		if (v_end[2]) begin
			C0 = G^E^R;
			C1 = G^E;
		end
		else begin
			C0 = G^E;
			C1 = G^E^R;
		end
	
		out_label = C0;		
	end	
		
endmodule

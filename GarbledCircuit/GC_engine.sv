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

module GC_engine #(parameter S=20, K=128 )(	
	input 			[K-1:0]	R, AES_key,
	input			[S-1:0]	cid, gid,
	input			[3:0]	g_logic,
	input			[K-1:0]	in0_label, in1_label,
	output	logic	[K-1:0]	t0, t1, out_label
);

	logic	[K-1:0]	in0_label_R, in1_label_R;
	logic	[2:0]	v;
	
	logic	[K-1:0]	A0, A1, B0, B1;
	logic	[K-1:0]	tweak0, tweak1;
	logic 			pa, pb;

	logic	[K-1:0]	 mask0, mask1, mask2, mask3;
	logic	[K-1:0]	 key0, key1, key2, key3;
	logic	[K-1:0]	 key0_endian, key1_endian, key2_endian, key3_endian;
	logic	[K-1:0]	 mask_key0, mask_key1, mask_key2, mask_key3;

	logic	[K-1:0]	G, E;	
	logic	[K-1:0]	C0, C1;

	AES_128 AES_128_0(
		.state(changeEndian(mask0)), 
		.key(changeEndian(AES_key)), 
		.out(key0_endian)
	);

	AES_128 AES_128_1(
		.state(changeEndian(mask1)), 
		.key(changeEndian(AES_key)), 
		.out(key1_endian)
	);

	AES_128 AES_128_2(
		.state(changeEndian(mask2)), 
		.key(changeEndian(AES_key)), 
		.out(key2_endian)
	);

	AES_128 AES_128_3(
		.state(changeEndian(mask3)), 
		.key(changeEndian(AES_key)), 
		.out(key3_endian)
	);
	
	always_comb begin
		
		v = Type2V(g_logic);
		in0_label_R = in0_label ^ R;
		in1_label_R = in1_label ^ R;
		
		if(v[0]) begin
			A0 = in0_label_R;
			A1 = in0_label;
		end
		else begin
			A0 = in0_label;
			A1 = in0_label_R;			
		end
		
		if(v[1]) begin
			B0 = in1_label_R;
			B1 = in1_label;
		end
		else begin
			B0 = in1_label;
			B1 = in1_label_R;			
		end
		
		/*A0 = in0_label;
		B0 = in1_label;
		A1 = A0 ^ R;
		B1 = B0 ^ R;*/
	
		tweak0 = {{(K/2-S){1'b0}}, cid, {(K/2-S-1){1'b0}}, gid, 1'b0};
		tweak1 = {{(K/2-S){1'b0}}, cid, {(K/2-S-1){1'b0}}, gid, 1'b1};
	
		mask0 = A0 ^ tweak0;
		mask1 = A1 ^ tweak0;
		mask2 = B0 ^ tweak1;
		mask3 = B1 ^ tweak1;
		
		key0 = changeEndian(key0_endian);
		key1 = changeEndian(key1_endian);
		key2 = changeEndian(key2_endian);
		key3 = changeEndian(key3_endian);
	
		mask_key0 = mask0 ^ key0;
		mask_key1 = mask1 ^ key1;
		mask_key2 = mask2 ^ key2;
		mask_key3 = mask3 ^ key3;
	
		pa = A0[0];
		pb = B0[0];
	
		t0 = (pb)?(mask_key0 ^ mask_key1 ^ R):(mask_key0 ^ mask_key1);
		t1 = mask_key2 ^ mask_key3 ^ A0;
	
		G = (pa)?(mask_key0 ^ t0):(mask_key0);
		E = (pb)?(mask_key2 ^ t1 ^ A0):(mask_key2);
		
		if (v[2]) begin
			C0 = G^E^R;
			C1 = G^E;
		end
		else begin
			C0 = G^E;
			C1 = G^E^R;
		end
		
		/*C0 = G ^ E;
		C1 = C0 ^ R;*/
	
		out_label = C0;
		
	end
	
endmodule

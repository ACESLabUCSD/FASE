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
	input 	[K-1:0]	R, AES_key,
	input	[S-1:0]	cid, gid,
	input	[K-1:0]	in0_label, in1_label,
	output	[K-1:0]	t0, t1, out_label
);

	wire	[K-1:0]	A0, B0;
	wire	[K-1:0]	A1, B1, C0, C1;
	wire	[K-1:0]	tweak0, tweak1;
	wire 			pa, pb;

	wire	[K-1:0]	 mask0, mask1, mask2, mask3;
	wire	[K-1:0]	 key0, key1, key2, key3;
	wire	[K-1:0]	 key0_endian, key1_endian, key2_endian, key3_endian;
	wire	[K-1:0]	 mask_key0, mask_key1, mask_key2, mask_key3;

	wire	[K-1:0]	 G, E;	
			
	assign A0 = in0_label;
	assign B0 = in1_label;
	assign A1 = A0 ^ R;
	assign B1 = B0 ^ R;

	assign tweak0 = {{(K/2-S){1'b0}}, cid, {(K/2-S-1){1'b0}}, gid, 1'b0};
	assign tweak1 = {{(K/2-S){1'b0}}, cid, {(K/2-S-1){1'b0}}, gid, 1'b1};

	assign mask0 = A0 ^ tweak0;
	assign mask1 = A1 ^ tweak0;
	assign mask2 = B0 ^ tweak1;
	assign mask3 = B1 ^ tweak1;

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
	
	assign key0 = changeEndian(key0_endian);
	assign key1 = changeEndian(key1_endian);
	assign key2 = changeEndian(key2_endian);
	assign key3 = changeEndian(key3_endian);

	assign mask_key0 = mask0 ^ key0;
	assign mask_key1 = mask1 ^ key1;
	assign mask_key2 = mask2 ^ key2;
	assign mask_key3 = mask3 ^ key3;

	assign pa = A0[0];
	assign pb = B0[0];

	assign t0 = (pb)?(mask_key0 ^ mask_key1 ^ R):(mask_key0 ^ mask_key1);
	assign t1 = mask_key2 ^ mask_key3 ^ A0;

	assign G = (pa)?(mask_key0 ^ t0):(mask_key0);
	assign E = (pb)?(mask_key2 ^ t1 ^ A0):(mask_key2);
	assign C0 = G ^ E;
	assign C1 = C0 ^ R;

	assign out_label = C0;
endmodule

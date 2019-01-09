`timescale 1ns / 1ps
`include "../Header/MAC_H.vh"

`ifndef SIM
module LabelGen #(parameter S = 20, K = 128)(
    input 				clk, rst,
    input 	[1:0]		en,
    output	[2*K-1:0]	key
    );
	
	logic [1:0]	clk_en;
	
	BUFGCE 	BUFGCE_inst_0 (
		.O(clk_en[0]), // 1-bit output: Buffer
		.CE(en[0]), // 1-bit input: Buffer enable
		.I(clk) // 1-bit input: Buffer
	);	
	BUFGCE 	BUFGCE_inst_1 (
		.O(clk_en[1]), // 1-bit output: Buffer
		.CE(en[1]), // 1-bit input: Buffer enable
		.I(clk) // 1-bit input: Buffer
	);
	 
	parameter n = 3, N_RO = 16, logN = 4;
	
	genvar k;
	generate
	for (k = 0; k < K; k = k + 1)
	begin: TRNG
	TRNG_RO #(n, N_RO, logN) TRNG_RO_0( 
		.clk(clk_en[0]),
		.rst(rst),
		.out(key[k])
    );
	TRNG_RO #(n, N_RO, logN) TRNG_RO_1( 
		.clk(clk_en[1]),
		.rst(rst),
		.out(key[K+k])
    );
	end
	endgenerate
	
endmodule

`else
module LabelGen #(parameter S = 20, K = 128)(
    input 				clk, rst,
    input 	[1:0]		en,
    output	[2*K-1:0]	key
    );
	
	localparam SIZE = S+1; //2 keys per gate
	localparam RANDFILE = "Rand.txt";
	
	logic	[K-1:0]	RAND [0:(2**SIZE)+2]; //2 extra for R and AES key
	initial begin
		$readmemh(RANDFILE, RAND);
	end
	
	logic	[SIZE-1:0] index, index_;
	assign index_ = index + en[0] + en[1];	
	always_ff @(posedge clk or posedge rst) begin
		if(rst)	index <= 'd0;
		else index <= index_;
	end
	
	assign key = {RAND[index+'d1]&{K{en[1]}}, RAND[index]&{K{en[0]}}};
endmodule

`endif

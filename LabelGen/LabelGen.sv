`timescale 1ns / 1ps

module LabelGen #(parameter K = 128)(
    input wire clk, rst, en,
    output [K-1:0] KEY
    );
	
	wire clk_en;
	
	BUFGCE 	BUFGCE_inst (
		.O(clk_en), // 1-bit output: Buffer
		.CE(en), // 1-bit input: Buffer enable
		.I(clk) // 1-bit input: Buffer
	);
	 
	parameter n = 3, N_RO = 16, logN = 4;
	
	genvar k;
	generate
	for (k = 0; k < K; k = k + 1)
	begin: TRNG
	TRNG_RO #(n, N_RO, logN) TRNG_RO( 
		.clk(clk_en),
		.rst(rst),
		.rand(KEY[k])
    );
	end
	endgenerate
	
endmodule

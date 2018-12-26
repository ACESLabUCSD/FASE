`timescale 1ns / 1ps
`include "../Header/MAC_H.vh"

`ifdef SIM
module LabelGen #(parameter K = 128)(
    input wire clk, rst, en,
    output [K-1:0] key
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
		.out(key[k])
    );
	end
	endgenerate
	
endmodule

`else
module LabelGen #(parameter S = 20, K = 128)(
    input wire clk, rst, en,
    output [2*K-1:0] key
    );
	
	localparam SIZE = S+1; //2 keys per gate
	
	logic	[K-1:0]	RAND [0:(2**SIZE)+2]; //2 extra for R and AES key
	initial begin
		$readmemh({LOC, RANDFILE}, RAND);
	end
	
	logic	[SIZE-1:0] index, index_;
	
	assign key = {RAND[index+'d1], RAND[index]};
	assign index_ = index + 'd2;
	
	always_ff @(posedge clk or posedge rst) begin
		if(rst)	index <= 'd0;
		else if(en)  index <= index_;
	end
endmodule

`endif

`include "../Header/MAC_H.vh"

module DPRAM #(parameter S = 20, K = 128)(
	input					clk, rst,
	input					wr_en_0, wr_en_1,
	input			[S-1:0]	wr_addr_0, wr_addr_1,
	input			[S-1:0]	rd_addr_0, rd_addr_1,  
	input			[K-1:0]	wr_data_0, wr_data_1, 
	output	logic	[K-1:0]	rd_data_0, rd_data_1
);

	localparam ZEROFILE = "Zeros.txt";

	logic	[K-1:0]	DPRAM [0:2**S-1];
	initial begin
		$readmemh(ZEROFILE, DPRAM);
	end
	
	always_comb  begin
		rd_data_0 = DPRAM[rd_addr_0];
		rd_data_1 = DPRAM[rd_addr_1];
	end

	always_ff @(posedge clk or posedge rst) begin
		if (wr_en_0) DPRAM[wr_addr_0] <= wr_data_0; 
		if (wr_en_1) DPRAM[wr_addr_1] <= wr_data_1; 
	end

endmodule
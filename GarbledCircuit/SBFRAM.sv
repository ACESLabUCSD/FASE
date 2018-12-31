`include "../Header/MAC_H.vh"

module SBFRAM #(parameter S = 20)( //Single-Bit Flat RAM
	input					clk, rst, clr,
	input					wr_en_0, wr_en_1,
	input			[S-1:0]	wr_addr_0, wr_addr_1,
	input			[S-1:0]	rd_addr_0, rd_addr_1,  
	input					wr_data_0, wr_data_1, 
	output	logic			rd_data_0, rd_data_1
);

	logic	[0:2**S-1]	SBFRAM ;
	
	always_comb  begin
		rd_data_0 = SBFRAM[rd_addr_0];
		rd_data_1 = SBFRAM[rd_addr_1];
	end

	always_ff @(posedge clk or posedge rst) begin
		if(rst|clr) SBFRAM <= {(2**S){1'b0}};
		else begin
			if (wr_en_0) SBFRAM[wr_addr_0] <= wr_data_0; 
			if (wr_en_1) SBFRAM[wr_addr_1] <= wr_data_1; 
		end
	end

endmodule
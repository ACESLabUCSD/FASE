`include "../Header/MAC_H.vh"

module DPRAM #(parameter S = 20, K = 128)(
	input					clk, rst, clr,
	input					wr_en_0, wr_en_1,
	input			[S-1:0]	wr_addr_0, wr_addr_1,
	input			[S-1:0]	rd_addr_0, rd_addr_1,  
	input			[K-1:0]	wr_data_0, wr_data_1, 
	output	logic			busy_0, busy_1,  
	output	logic			rd_data_ready_0, rd_data_ready_1, 
	output	logic	[K-1:0]	rd_data_0, rd_data_1
);

	localparam ZEROFILE = "Zeros.txt";
	logic	[K-1:0]	DPRAM [0:2**S-1];
	initial begin
		$readmemh(ZEROFILE, DPRAM);
	end
	
	logic	[S-1:0]	addr_0, addr_1;
	
	always_comb begin
		busy_0 = wr_en_0; // will be different later with merged write
		busy_1 = wr_en_1;
		addr_0 = wr_en_0? wr_addr_0:rd_addr_0;
		addr_1 = wr_en_1? wr_addr_1:rd_addr_1;
	end

	always_ff @(posedge clk or posedge rst) begin
		rd_data_0 <= DPRAM[addr_0];
		rd_data_1 <= DPRAM[addr_1];
		if (wr_en_0) DPRAM[addr_0] <= wr_data_0; 
		if (wr_en_1) DPRAM[addr_1] <= wr_data_1; 
	end
	
	/*flag*/
	
	logic	[0:2**S-1]	FLAG ;
	
	always_comb  begin
		rd_data_ready_0 = FLAG[rd_addr_0];
		rd_data_ready_1 = FLAG[rd_addr_1];
	end

	always_ff @(posedge clk or posedge rst) begin
		if(rst|clr) FLAG <= {(2**S){1'b0}};
		else begin
			if (wr_en_0) FLAG[wr_addr_0] <= 'b1; 
			if (wr_en_1) FLAG[wr_addr_1] <= 'b1; 
		end
	end

endmodule
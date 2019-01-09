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
	
	logic	[S-1:0]	addr_0, addr_1;
	
	always_comb begin
		busy_0 = wr_en_0; // will be different later with merged write
		busy_1 = wr_en_1;
		addr_0 = wr_en_0? wr_addr_0:rd_addr_0;
		addr_1 = wr_en_1? wr_addr_1:rd_addr_1;
	end

	generate	
		if(K == 128) begin: K_128
			blk_mem_gen_0 blk_mem(
				.clka(clk),    // input wire clka
				.wea(wr_en_0),      // input wire [0 : 0] wea
				.addra(addr_0),  // input wire [13 : 0] addra
				.dina(wr_data_0),    // input wire [127 : 0] dina
				.douta(rd_data_0),  // output wire [127 : 0] douta
				.clkb(clk),    // input wire clkb
				.web(wr_en_1),      // input wire [0 : 0] web
				.addrb(addr_1),  // input wire [13 : 0] addrb
				.dinb(wr_data_1),    // input wire [127 : 0] dinb
				.doutb(rd_data_1)  // output wire [127 : 0] doutb
			);
		end
		else begin: K_256
			blk_mem_gen_1 blk_mem(
				.clka(clk),    // input wire clka
				.wea(wr_en_0),      // input wire [0 : 0] wea
				.addra(addr_0),  // input wire [13 : 0] addra
				.dina(wr_data_0),    // input wire [127 : 0] dina
				.douta(rd_data_0),  // output wire [127 : 0] douta
				.clkb(clk),    // input wire clkb
				.web(wr_en_1),      // input wire [0 : 0] web
				.addrb(addr_1),  // input wire [13 : 0] addrb
				.dinb(wr_data_1),    // input wire [127 : 0] dinb
				.doutb(rd_data_1)  // output wire [127 : 0] doutb
			);
		end
	endgenerate
	
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
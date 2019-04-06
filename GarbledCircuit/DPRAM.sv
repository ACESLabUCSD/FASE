`include "../Header/MAC_H.vh"

module DPRAM #(parameter S = 13, K = 128)(
	input					clk, rst, clr,
	input					wr_en_0, wr_en_1,
	input			[S-1:0]	wr_addr_0, wr_addr_1,
	input					rd_req_0, rd_req_1,
	input			[S-1:0]	rd_addr_0, rd_addr_1,  
	input			[K-1:0]	wr_data_0, wr_data_1,  
	output	logic			rd_data_ready_0, rd_data_ready_1, 
	output	logic			stall_rd, 
	output	logic	[K-1:0]	rd_data_0_t1, rd_data_1_t1
);
	
	logic			wea, web;
	logic	[S-1:0]	addra, addrb;  
	logic	[K-1:0]	dina, dinb;  
	logic	[K-1:0]	douta_t1, doutb_t1;

`ifdef MEM_OPT
	logic 			wr_en_q;
	logic	[S-1:0]	wr_addr_q;
	logic	[K-1:0]	wr_data_q;
	
	logic 	[4:0]	mem_state;
	
	assign mem_state = {wr_en_q, wr_en_0, wr_en_1, rd_req_0, rd_req_1};
			
	always_ff @(posedge clk or posedge rst) begin
		if(rst) begin 
			wr_en_q <= 'b0;
			wr_addr_q <= 'b0;
			wr_data_q <= 'b0;
		end
		else begin
			/*if((mem_state == 5'b00111)||(mem_state == 5'b01011)||(mem_state == 5'b11100)||(mem_state == 5'b11101)||(mem_state == 5'b11110)||(mem_state == 5'b11111))*/
			if((mem_state == 5'b00111)||(mem_state == 5'b01011)||(mem_state[4:2] == 3'b111))wr_en_q <= 'b1;
			else wr_en_q <= 'b0;
			if(wr_en_1) begin
				wr_addr_q <= wr_addr_1;
				wr_data_q <= wr_data_1;
			end
			else begin
				wr_addr_q <= wr_addr_0;
				wr_data_q <= wr_data_0;
			end			
		end
	end
	
	typedef enum{
		NONE,
		A,
		B
	}rd_port_id;
	
	rd_port_id rd_port_0, rd_port_0_t1, rd_port_1, rd_port_1_t1;
	
	always_ff @(posedge clk or posedge rst)
		if(rst) begin
			rd_port_0_t1 <= NONE;
			rd_port_1_t1 <= NONE;
		end
		else begin
			rd_port_0_t1 <= rd_port_0;
			rd_port_1_t1 <= rd_port_1;
		end
	
	always_comb begin
		case(rd_port_0_t1)
			NONE:	rd_data_0_t1 = 'b0;
			A:		rd_data_0_t1 = douta_t1;
			B:		rd_data_0_t1 = doutb_t1;
		endcase
		case(rd_port_1_t1)
			NONE:	rd_data_1_t1 = 'b0;
			A:		rd_data_1_t1 = douta_t1;
			B:		rd_data_1_t1 = doutb_t1;
		endcase
	end

	always_comb begin
		stall_rd = 'b0;	
		wea = wr_en_0;
		web = wr_en_1;
		addra = wr_en_0? wr_addr_0:rd_addr_0;
		addrb = wr_en_1? wr_addr_1:rd_addr_1;
		dina = wr_data_0;
		dinb = wr_data_1;
		rd_port_0 = A;
		rd_port_1 = B;
		
		if(mem_state == 5'b00101) begin
			addra = rd_addr_1;
			rd_port_1 = A;
		end
		if(mem_state == 5'b01010) begin
			addrb = rd_addr_0;
			rd_port_0 = B;
		end
		if((mem_state == 5'b10000)||(mem_state == 5'b10001)) begin
			wea = 'b1;
			addra = wr_addr_q;
			dina = wr_data_q;
		end
		if(mem_state == 5'b10010) begin
			web = 'b1;
			addrb = wr_addr_q;
			dinb = wr_data_q;
		end
		if(mem_state == 5'b00111) begin
			web = 'b0;
			addrb = rd_addr_1;
		end
		if(mem_state == 5'b01011) begin
			wea = 'b0;
			addra = rd_addr_0;
		end
		if(mem_state[4:2] == 3'b011)begin
			stall_rd = 'b1;
		end
		if((mem_state == 5'b10011)||(mem_state[4:2] == 5'b101))begin
			stall_rd = 'b1;
			wea = 'b1;
			addra = wr_addr_q;
			dina = wr_data_q;
		end
		if(mem_state[4:3] == 2'b11)begin
			stall_rd = 'b1;
			web = 'b1;
			addrb = wr_addr_q;
			dinb = wr_data_q;
		end
	end
`else	
	always_comb begin
		wea = wr_en_0;
		web = wr_en_1;
		addra = wr_en_0? wr_addr_0:rd_addr_0;
		addrb = wr_en_1? wr_addr_1:rd_addr_1;
		dina = wr_data_0;
		dinb = wr_data_1;
		rd_data_0_t1 = douta_t1;
		rd_data_1_t1 = doutb_t1;
	end
`endif

	generate	
		if(K == 128) begin: K_128
			if(S == 13) begin: S_13
			blk_mem_gen_0 blk_mem(
				.clka(clk),    
				.wea(wea),     
				.addra(addra), 
				.dina(dina),   
				.douta(douta_t1), 
				.clkb(clk),    
				.web(web),     
				.addrb(addrb), 
				.dinb(dinb),   
				.doutb(doutb_t1)  
			);
			end
			else begin: S_10
			blk_mem_gen_3 blk_mem(
				.clka(clk),    
				.wea(wea),     
				.addra(addra), 
				.dina(dina),   
				.douta(douta_t1), 
				.clkb(clk),    
				.web(web),     
				.addrb(addrb), 
				.dinb(dinb),   
				.doutb(doutb_t1)  
			);
			end
	
			/*flags*/
			
			logic	[0:2**S-1]	FLAG ;
			
			always_comb  begin
				rd_data_ready_0 = FLAG[rd_addr_0];
				rd_data_ready_1 = FLAG[rd_addr_1];
			end

			always_ff @(posedge clk or posedge rst) begin
				if(rst|clr) FLAG <= {(2**S){1'b0}};
				else begin
					if (wea) FLAG[addra] <= 'b1; 
					if (web) FLAG[addrb] <= 'b1; 
				end
			end
		end
		else begin: K_256
			blk_mem_gen_1 blk_mem(
				.clka(clk),    
				.wea(wea),     
				.addra(addra), 
				.dina(dina),   
				.douta(douta_t1), 
				.clkb(clk),    
				.web(web),     
				.addrb(addrb), 
				.dinb(dinb),   
				.doutb(doutb_t1)  
			);		
			
			always_comb  begin
				rd_data_ready_0 = 'b0;
				rd_data_ready_1 = 'b1;
			end
		end
	endgenerate

endmodule
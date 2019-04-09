`include "../Header/MAC_H.vh"

module Netlist #(parameter S = 14)(
	input							clk, rst,
	input							start, prep_next_cycle,
	input					[31:0]	netlist_in,
	input					[S-1:0]	rd_addr,
	output	logic					ready,
	output	logic	signed	[S-1:0]	init_size, input_size, dff_size, output_size, gate_size, XOR_size,
	output	logic					in0F, in1F, //1 if they are inputs of the circuit
	output	logic	signed	[S-1:0]	in0, in1,
	output	logic			[3:0]	g_logic,
	output	logic					is_output //1 if gate output is output of the circuit
);

	localparam N_CKT_PARAM = 4;

	/*memory to store the circuit*/
	
	logic			wr_en;
	logic	[S-1:0]	addr, wr_addr;
	logic	[31:0]	rd_data, rd_data_future;
	logic			old_bit, future;
	
	always_ff @(posedge clk or posedge rst) begin		
		if(rst) old_bit <= 'b0;
		else old_bit <= addr[0];
	end	
	
	always_comb begin
		addr = wr_en? wr_addr : rd_addr + N_CKT_PARAM + future;
		if((old_bit ^ addr[0])) rd_data = rd_data_future;
	end	
	
	always_ff @(posedge clk or posedge rst) begin		
		if(rst) wr_addr <= 'd0;
		else if(wr_en) wr_addr <= wr_addr + 'd1;
	end
	
	blk_mem_gen_2 blk_mem (
		.clka(clk),    // input wire clka
		.wea(wr_en),      // input wire [0 : 0] wea
		.addra(addr),  // input wire [13 : 0] addra
		.dina(netlist_in),    // input wire [31 : 0] dina
		.douta(rd_data_future)  // output wire [31 : 0] douta
	);
	
	/*register file to store the circuit parameters*/
	
	logic			CP_wr_en; 
	logic	[31:0]	netlist_in_t1;
	
	logic	[31:0]	CircuitParams [0:N_CKT_PARAM-1]; 		
	initial begin
		$readmemh("Zeros.txt", CircuitParams);
	end	
	
	always_ff @(posedge clk or posedge rst) begin
		if(rst) begin 
			CircuitParams[addr] <= 'b0;
		end
		else begin
			netlist_in_t1 <= netlist_in;
			if(CP_wr_en) CircuitParams[addr] <= netlist_in_t1;
		end
	end
	
	logic	signed	[S-1:0]	init_input_size, dff_gate_size;
	
	always_comb begin
		init_size = CircuitParams[0][2*P-1:P] + CircuitParams[0][P-1:0]; 
		input_size = CircuitParams[1][2*P-1:P] + CircuitParams[1][P-1:0]; 
		output_size = CircuitParams[2][P-1:0]; 
		dff_size = CircuitParams[2][2*P-1:P]; 
		gate_size = CircuitParams[3][P-1:0]; 
		XOR_size = CircuitParams[3][2*P-1:P];
		
		init_input_size = init_size + input_size;
		dff_gate_size = dff_size + gate_size;
		in0F = (in0 < init_input_size)? 'b1 : 'b0;
		in1F = (in1 < init_input_size)? 'b1 : 'b0;
	end
	
	typedef enum{
		IDLE,
		STORE,
		PREP,
		GARBLE
	}state;
	
	state currState, nextState;
	
	always_ff @(posedge clk or posedge rst)
		if(rst) currState <= IDLE;
		else currState <= nextState;
		
	always_comb begin	
		ready = 'b0;
		wr_en = 'b0;
		CP_wr_en = 'b0;
		future = 'b0;
		is_output = 'b0;
		g_logic = 'b0;
		in1 = -'d1;
		in0 = -'d1;
		nextState = currState;
		
		case(currState)
			IDLE: begin 
				if(start == 'b1) nextState = STORE;
			end					
			STORE: begin
				wr_en = 'b1;
				CP_wr_en = (wr_addr < N_CKT_PARAM);
				if(wr_addr == dff_size + gate_size + N_CKT_PARAM - 'd1) nextState = PREP; 
			end									
			PREP: begin
				ready = 'b1;
				nextState = GARBLE;
			end	
			GARBLE: begin
				future = 'b1;
		
				is_output = rd_data[0];
				g_logic = rd_data[4:1];
				in1 = rd_data[P+4:5];
				in0 = {1'b0, rd_data[31:P+5]};
				
				if(prep_next_cycle) nextState = PREP; 
			end	
			
		endcase
	end
	
endmodule
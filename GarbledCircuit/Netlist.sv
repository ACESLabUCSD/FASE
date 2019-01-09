`include "../Header/MAC_H.vh"

module Netlist #(parameter S = 14)(
	input							clk, rst, start,
	input					[31:0]	netlist_in,
	input					[S-1:0]	rd_addr,
	output	logic					done,
	output	logic	signed	[S-1:0]	init_size, input_size, dff_size, output_size, gate_size, num_XOR,
	output	logic					in0F, in1F, //1 if they are inputs of the circuit
	output	logic	signed	[S-1:0]	in0, in1,
	output	logic			[3:0]	g_logic,
	output	logic					is_output //1 if gate output is output of the circuit
);

	/*memory to store the circuit*/
	
	logic			wr_en;
	logic	[S-1:0]	addr, wr_addr;
	logic	[31:0]	line;
	
	assign addr = wr_en? wr_addr : rd_addr+'d4;
	
	always_ff @(posedge clk or posedge rst) begin		
		if(rst) wr_addr <= 0;
		else if(wr_en) wr_addr <= wr_addr + 'd1;
	end
	
	blk_mem_gen_2 blk_mem (
		.clka(clk),    // input wire clka
		.wea(wr_en),      // input wire [0 : 0] wea
		.addra(addr),  // input wire [13 : 0] addra
		.dina(netlist_in),    // input wire [31 : 0] dina
		.douta(line)  // output wire [31 : 0] douta
);
	
	/*register file to store the circuit parameters*/
	
	logic			CP_wr_en; 
	
	logic	[31:0]	CircuitParams [0:3]; 		
	initial begin
		$readmemh("Zeros.txt", CircuitParams);
	end	
	
	always_ff @(posedge clk or posedge rst) begin
		if(rst) CircuitParams[addr+1] <= 'b0;
		else if(CP_wr_en) CircuitParams[addr+1] <= netlist_in;
	end
	
	logic	signed	[S-1:0]	init_input_size, dff_gate_size;
	
	always_comb begin
		init_size = CircuitParams[0][2*S-1:S]+CircuitParams[0][S-1:0]; 
		input_size = CircuitParams[1][2*S-1:S]+CircuitParams[1][S-1:0]; 
		output_size = CircuitParams[2][S-1:0]; 
		dff_size = CircuitParams[2][2*S-1:S]; 
		gate_size = CircuitParams[3][S-1:0]; 
		num_XOR = CircuitParams[3][2*S-1:S];
		
		init_input_size = init_size + input_size;
		dff_gate_size = dff_size + gate_size;
		in0F = (in0 < init_input_size)? 'b1 : 'b0;
		in1F = (in1 < init_input_size)? 'b1 : 'b0;
	end
	
	typedef enum{
		IDLE,
		STORE,
		GARBLE
	}state;
	
	state currState, nextState;
	
	always_ff @(posedge clk or posedge rst)
		if(rst) currState <= IDLE;
		else currState <= nextState;
		
	always_comb begin	
		done = 'b0;
		wr_en = 'b0;
		CP_wr_en = 'b0;
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
				CP_wr_en = (wr_addr < 'd4);
				if(wr_addr == dff_size + gate_size + 'd3) begin
					done = 'b1;
					nextState = GARBLE;
				end
			end				
			GARBLE: begin
				is_output = line[0];
				g_logic = line[4:1];
				in1 = line[S+4:5];
				in0 = {1'b0, line[31:S+5]};
			end	
			
		endcase
	end
	
endmodule
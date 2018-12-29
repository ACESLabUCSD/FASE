`include "../Header/MAC_H.vh"

module Netlist #(parameter S = 20)(
	input								clk, rst, start,
	input					[S-1:0]		gid,
	output	logic						done,
	output	logic	signed	[S-1:0]		init_size, input_size, dff_size, output_size, gate_size, num_XOR,
	output								in0F, in1F, //1 if they are inputs of the circuit
	output	logic	signed	[S-1:0]		in0, in1,
	output	logic			[3:0]		g_logic,
	output	logic						is_output //1 if gate output is output of the circuit
);

	logic	[31:0]	Netlist [0:2**S-1]; 		
	initial begin
		$readmemh({LOC, NETLISTFILE}, Netlist);
	end
	
	logic	[S-1:0]	index;
	logic	[31:0]	line;
	assign line = Netlist[index];	
	
	typedef enum{
		IDLE,
		INIT,
		INPUT,
		OUTPUT,
		GATE,
		GARBLE
	}state;
	
	state currState, nextState;
	
	always_ff @(posedge clk or posedge rst)
		if(rst) currState <= IDLE;
		else currState <= nextState;
		
	always_comb begin	
		done = 'b0;
		is_output = 'b0;
		g_logic = 'b0;
		in1 = -'d1;
		in0 = -'d1;
		nextState = currState;
		case(currState)
			IDLE: begin
				init_size = 'd0; 
				input_size = 'd0; 
				dff_size = 'd0; 
				output_size = 'd0; 
				gate_size = 'd0; 
				if(start == 'b1) nextState = INIT;
			end				
			INIT: begin
				index = 'd0;
				init_size = line[2*S-1:S]+line[S-1:0];
				nextState = INPUT;
			end				
			INPUT: begin
				index = 'd1;
				input_size = line[2*S-1:S]+line[S-1:0];
				nextState = OUTPUT;
			end				
			OUTPUT: begin
				index = 'd2;
				output_size = line[S-1:0];
				dff_size = line[2*S-1:S];
				nextState = GATE;
			end				
			GATE: begin
				index = 'd3;
				gate_size = line[S-1:0];
				num_XOR = line[2*S-1:S];
				done = 'b1;
				nextState = GARBLE;
			end				
			GARBLE: begin
				index = gid+'d4;
				is_output = line[0];
				g_logic = line[4:1];
				in1 = line[S+4:5];
				in0 = {1'b0, line[31:S+5]};
			end	
			
		endcase
	end
	
	assign in0F = (in0 < input_size)? 'b1 : 'b0;
	assign in1F = (in1 < input_size)? 'b1 : 'b0;
	
endmodule
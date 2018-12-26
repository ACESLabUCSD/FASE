`include "../Header/MAC_H.vh"

module Netlist #(parameter S = 20)(
	input	[S-1:0]		gid,
	output	[S-1:0]		input_size, //1 if their input of the circuit
	output				in0F, in1F, //1 if their input of the circuit
	output	[S-1:0]		in0, in1,
	output	[3:0]		g_logic
);

	logic	[S-1:0]	IN0 [0:2**S-1]; 
	logic	[S-1:0]	IN1 [0:2**S-1]; 
	logic	[3:0]	G_LOGICS [0:2**S-1]; 
		
	initial begin
		$readmemh({LOC, IN0FILE}, IN0);
		$readmemh({LOC, IN1FILE}, IN1);
		$readmemh({LOC, LOGICFILE}, G_LOGICS);
	end
	
	assign input_size = 'd16;
	assign in0 = IN0[gid];
	assign in1 = IN1[gid];
	assign in0F = (in0 < input_size)? 'b1 : 'b0;
	assign in1F = (in1 < input_size)? 'b1 : 'b0;
	assign g_logic = G_LOGICS[gid];
	
endmodule
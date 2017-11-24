`timescale 1ns / 1ps
`include "../Header/MAC_H.vh"

module MAC_TG #(parameter N = 8)( 
	input clk,
	input rst,
	input [N-1:0] g_input,
	input [N-1:0] e_input,
	output [N-1:0] o
);

	reg [N-1:0] o_reg;

	MAC #(.N(N)) _MAC(
		.A(g_input),
		.X(e_input),
		.Y0(o_reg),
		.Y(o)
	);
	
	always @(posedge clk or posedge rst)
		if(rst) o_reg <= {N{1'b0}};
		else o_reg <= o;

endmodule

module MAC #(parameter N = 8)( 
	input signed [N-1:0] A, X, Y0,
	output signed [N-1:0] Y
);

	wire signed [N-1:0] AX;

	MULT_ #(.N(N)) _MULT( 
		.A(A),
		.X(X),
		.AX(AX)
	);
	
	wire [N:0] _S;
	
	ADD_ #(.N(N)) _ADD(
		.A(AX),
		.B(Y0), 
		.O(_S) 
	);
	
	assign Y = _S[N:1];	

endmodule
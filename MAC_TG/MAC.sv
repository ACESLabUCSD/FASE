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

	MULT #(.N(N)) _MULT( 
		.A(A),
		.X(X),
		.AX(AX)
	);
	
	wire [N-1:0] _S;
	wire _c;
	
	ADD #(.N(N)) _ADD(
		.A(AX),
		.B(Y0), 
		.CI(1'b0), 
		.S(_S), 
		.CO(_c)
	);
	
	assign Y = {_c, _S[N-1:1]};	

endmodule

module MULT #(parameter N = 8, M = N)( 
	input signed [N-1:0] A,
	input signed [M-1:0] X,
	output signed [N-1:0] AX
);
	
	genvar i, j, k;
	
	wire [N-1:0] S[log2(M)-1:0][M/2-1:0];
	
	generate
	for(i = 0; i < M/2; i = i+1)
	begin:MSA
		MUX_SHIFT_ADD #(.N(N), .C(1)) _MUX_SHIFT_ADD(
			.A(A),
			.x(X[2*i+1:2*i]),
			.S(S[0][i])
		);
	end
	endgenerate
	
	generate
	for (j = 0; j < log2(M/2); j = j + 1)
	begin: col
		for(k = 0; k < M/(2**(j+2)); k = k + 1)
		begin: row
			SHIFT_ADD #(.N(N), .C(2**(j+1))) _SHIFT_ADD(
				.S0(S[j][2*k]), 
				.S1(S[j][2*k+1]),
				.S(S[j+1][k])				
			);
		end	
	end
	endgenerate
	
	assign AX = S[log2(M)-1][0];
	
endmodule

module MUX_SHIFT_ADD #(parameter N = 8, C = 1)( 
	input [N-1:0] A,
	input [1:0] x,
	output [N-1:0] S
);	
	wire [N-1:0] ax0, ax1;
	assign ax0 = {N{x[0]}}&{{C{1'b0}}, A[N-1:C]};
	assign ax1 = {N{x[1]}}&A;
	
	wire [N-1:0] _S;
	wire _c;
	
	ADD #(.N(N)) _ADD(
		.A(ax0),
		.B(ax1), 
		.CI(A[0]), 
		.S(_S), 
		.CO(_c)
	);
	
	assign S = {_c, _S[N-1:1]};	
	
endmodule

module SHIFT_ADD #(parameter N = 8, C = 1)( 
	input [N-1:0] S0, S1,
	output [N-1:0] S
);	
	wire [N-1:0] S0_;
	assign S0_ = {{C{1'b0}}, S0[N-1:C]};
	
	ADD #(.N(N)) _ADD(
		.A(S0_),
		.B(S1), 
		.CI(S0[0]), 
		.S(S), 
		.CO()
	);
	
endmodule

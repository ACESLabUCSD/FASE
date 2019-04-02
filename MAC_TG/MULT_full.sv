`timescale 1ns / 1ps
`include "../Header/MAC_H.vh"

module MULT_full #(parameter N = 8, M = N)( 
	input	[N-1:0] A,
	input	[M-1:0] X,
	output	[N+M-1:0] AX
);
	
	genvar i, j, k;
	
	logic [N+M-1:0] S[log2(M)-1:0][M/2-1:0];
	
	generate
	for(i = 0; i < M/2; i = i+1)
	begin:MSA
		MUX_SHIFT_ADD_full #(.N(N), .C(1)) _MUX_SHIFT_ADD_full(
			.A(A),
			.x(X[2*i+1:2*i]),
			.S(S[0][i][N+1:0])
		);
	end
	endgenerate
	
	generate
	for (j = 0; j < log2(M/2); j = j + 1)
	begin: col
		for(k = 0; k < M/(2**(j+2)); k = k + 1)
		begin: row
			SHIFT_ADD_full #(.N(N+2**(j+1)), .C(2**(j+1))) _SHIFT_ADD_full(
				.S0(S[j][2*k][N+2**(j+1)-1:0]), 
				.S1(S[j][2*k+1][N+2**(j+1)-1:0]),
				.S(S[j+1][k][N+2**(j+2)-1:0])				
			);
		end	
	end
	endgenerate
	
	assign AX = S[log2(M)-1][0];
	
endmodule

module MUX_SHIFT_ADD_full #(parameter N = 8, C = 1)( 
	input [N-1:0] A,
	input [1:0] x,
	output [N+C:0] S
);	
	logic [N-1:0] Ax0, Ax1;
	assign Ax0 = A&{N{x[0]}};
	assign Ax1 = A&{N{x[1]}};
	
	logic [N-1:0] _S;
	logic _c;
	
	ADD #(.N(N)) _ADD(
		.A({{C{1'b0}}, Ax0[N-1:C]}),
		.B(Ax1), 
		.CI(1'b0), 
		.S(_S), 
		.CO(_c)
	);
	
	assign S = {_c, _S, Ax0[C-1:0]};	
	
endmodule

module SHIFT_ADD_full #(parameter N = 8, C = 1)( 
	input [N-1:0] S0, S1,
	output [N+C-1:0] S
);	
	logic [N-1:0] _S;
	
	ADD #(.N(N)) _ADD(
		.A({{C{1'b0}}, S0[N-1:C]}),
		.B(S1), 
		.CI(1'b0), 
		.S(_S), 
		.CO()
	);
	
	assign S = {_S, S0[C-1:0]};	
	
endmodule

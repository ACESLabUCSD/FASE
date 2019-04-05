`timescale 1ns / 1ps
`include "../Header/MAC_H.vh"

module tb_MULT_full;

parameter N = 32, M = N; 

reg  [N-1:0] A, X;
wire  [N+M-1:0] AX;
reg  [N+M-1:0] AX_ref;
reg  [N+M-1:0] err;

  
MULT_full #(.N(N)) uut( 
	.A(A),
	.X(X),
	.AX(AX)
);

always @(*) begin
	AX_ref = A*X;
	err = AX_ref - AX;
end

integer l, m, n;

always @(AX) begin
	#10;
	$display("A = %d, X = %d, AX = %d, AX_ref = %d, error = %d\n", A, X, AX, AX_ref, err);
end


initial begin
	A =		{N{1'b1}};
	X =		{N{1'b1}};
	#100;
	A =		{N{1'b1}};
	X =		32'd2147483647;
	#100;
	A =		{1'b0, A[N-1:1]};
	X =		32'd2147483647;
	#100;
	#100;
	A =		32'd1196140742;
	X =		32'd2147483647;
	#100;
	A =		32'd2147483647;
	X =		32'd2147483647;
	#100;
	#100;
	A =		{1'b0, A[N-1:1]};
	X =		32'd2147483647;
	#100;
	X =		32'd2147483647;
	#100;
	A =		32'd1189375164;
	#100;
	A =		{1'b0, A[N-1:1]};
	X =		32'd198304613;
	#100;
	$stop();
end

	


endmodule
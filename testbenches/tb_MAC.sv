`timescale 1ns / 1ps
`include "../Header/MAC_H.vh"

module tb_MAC;

parameter N = 32, M = N; 

reg signed [N-1:0] A, X, Y0;
wire signed [N-1:0] Y;
reg signed [2*N-1:0] AX;
reg signed [N-1:0] Y1;
reg signed [N:0] Y2;
reg signed [N-1:0] Yref;
reg signed [N:0] err;

  
MAC #(.N(N)) uut( 
	.A(A),
	.X(X),
	.Y0(Y0),
	.Y(Y)
);

always @(*) begin
	AX = A*X;
	Y1 = AX[2*N-1:N];
	Y2 = Y1 + Y0;
	Yref = Y2[N:1];
	err = Yref - Y;
end

integer l, m, n;

always @(Y) begin
	#10;
	$display("A = %d, X = %d, Y0 = %d, Y = %d, Yref = %d, error = %d\n", A, X, Y0, Y, Yref, err);

	/*for(l = 0; l < M/2; l = l+1)
		$display("S[0][%d]\t= %b", l, uut._MULT.S[0][l]);
	for (m = 0; m < log2(M/2); m = m + 1)
		for(n = 0; n < M/(2**(m+2)); n = n + 1)
			$display("S[%d][%d] \t= %b", m+1, n, uut._MULT.S[m+1][n]);*/
end


initial begin
	A =		32'h1234fd54;
	X =		32'h01234567;
	Y0 =	32'd2147483647;
	#100;
	A =		{N{1'b1}};
	X =		{N{1'b1}};
	Y0 =	32'h0;
	#100;
	A =		{N{1'b1}};
	X =		32'd2147483647;
	Y0 =	32'd2147483647;
	#100;
	A =		{1'b0, A[N-1:1]};
	X =		32'd2147483647;
	Y0 =	32'd609397184;
	#100;
	A =		-32'd2147483647;
	X =		32'd545404223;
	Y0 =	32'd1811450916;
	#100;
	A =		32'd2147483647;
	X =		-32'd418932850;
	Y0 =	32'd2147483647;
	#100;
	A =		32'd1196140742;
	X =		32'd2147483647;
	Y0 =	32'd2147483647;
	#100;
	A =		32'd2147483647;
	X =		32'd2147483647;
	Y0 =	32'd2084672538;
	#100;
	A =		-32'd418932850;
	X =		-32'd2147483647;
	Y0 =	32'd676943031;
	#100;
	A =		{1'b0, A[N-1:1]};
	X =		32'd2147483647;
	Y0 =	32'd545404223;
	#100;
	A =		-32'd153380492;
	X =		32'd2147483647;
	Y0 =	32'd735241226;
	#100;
	A =		32'd1189375164;
	X =		-32'd417177824;
	Y0 =	32'd147944789;
	#100;
	A =		{1'b0, A[N-1:1]};
	X =		32'd198304613;
	Y0 =	32'd545404223;
	#100;
	A =		-32'd676943031;
	X =		-32'd2147483647;
	Y0 =	32'd545434523;
	#100;
	$stop();
end

	


endmodule
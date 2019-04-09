`timescale 1ns / 1ps
`include "../Header/MAC_H.vh"

module tb_MULT_full_seq;

parameter N = 1024, M = N; 

logic 	clk, rst;
logic  [0:0] a;
logic  [N-1:0] A;
logic  [M-1:0] X;
logic  [0:0] aX;
logic  [N+M-1:0] AX, AX_ref;
logic  [N+M-1:0] err;

  
MULT_full_seq #(.M(M)) uut( 
	.clk(clk),
	.rst(rst),
	.a(a),
	.X(X),
	.aX(aX)
);

always #50 clk = ~clk;

integer k;

initial begin
	clk = 1'b0;
	rst = 1'b1;
	A = {N{1'b1}};
	X = {(N/2){2'b10}};
	AX_ref = A*X;
	#75;
	rst = 1'b0;
	for (k = 0; k < N; k = k+1) begin
		a <= A[k];
		@(posedge clk);
		AX[k-1] = aX;
	end
	for (k = 0; k < M; k = k+1) begin
		a <= 1'b0;
		@(posedge clk);
		AX[k+N-1] = aX;
	end
	@(posedge clk);
	AX[k+N-1] = aX;
	@(posedge clk);
	AX[k+N] = aX;
	@(posedge clk);
	$display("A = %d, X = %d, AX = %d, AX_ref = %d\n", A, X, AX, AX_ref);
	$display("error = %d\n", AX-AX_ref);
	$stop();
end

	


endmodule
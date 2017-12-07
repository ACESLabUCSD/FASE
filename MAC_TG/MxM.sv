`timescale 1ns / 1ps
`include "../Header/MAC_H.vh"
 
module MxM_TG #(parameter W = 8, N = 1000)(
	input clk, rst,
	input [W-1:0] g_input, e_input,
	output [W-1:0] o
);

	MxM #(.W(W), .N(N)) _MxM( 
		.clk(clk), .rst(rst),
		.A(g_input), .X(e_input),
		.Y(o)
	);	

endmodule

module MxM #(parameter W = 8, N = 1000)( //W = bit-width, N = common inner dimension of the matrices: (MxN)x(NxP) -> (MxP), run for M*N*P cc
	input clk, rst,
	input [W-1:0] A, X,
	output reg [W-1:0] Y
);
	
	reg [W-1:0] Y0; 
	wire [W-1:0] Y1; 
	reg [log2(N)-1:0] n; 
	
	MAC #(.N(W)) _MAC(
		.A(A),
		.X(X),
		.Y0(Y0),
		.Y(Y1)
	);
	
	always @(posedge clk or posedge rst)
		if(rst) begin
			n <= 0; 
			Y0 <= 0;
			Y <= 0;
		end
		else begin					
			if (n == N-1) n <= 0; 
			else n <= n+1;
			if (n == 0) begin
				Y0 <= 0;
				Y <= Y1;
			end Y0 <= Y1;
		end
	
endmodule
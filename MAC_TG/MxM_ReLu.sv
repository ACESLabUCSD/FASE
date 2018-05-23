`timescale 1ns / 1ps
`include "../Header/MAC_H.vh"

module MxM_ReLu_TG #(parameter W = 8)(
	input clk, rst,
	input [W-1:0] g_input, e_input,
	output [W-1:0] o
);

	MxM_ReLu #(.W(W)) _MxM_ReLu( 
		.clk(clk), .rst(rst),
		.A(g_input), .X(e_input),
		.Y(o)
	);	

endmodule

module MxM_ReLu #(parameter W = 8)( //W = bit-width
	input clk, rst,
	input [W-1:0] A, X,
	output reg [W-1:0] Y
);
	
	parameter S = 2;
	parameter N[S+1:0] = {4, 6, 8, 10};
	parameter [S-1:0] R = {1'b1, 1'b1};
	reg [log2(S)-1:0] s;
	reg [4:0] n, m; 
	
	reg [W-1:0] Y0; 
	wire [W-1:0] Y1; 
	
	MAC #(.N(W)) _MAC(
		.A(A),
		.X(X),
		.Y0(Y0),
		.Y(Y1)
	);
	
	always @(posedge clk or posedge rst)
		if(rst) begin
			s <= 0;
			n <= 0; 
			m <= 0;
			Y0 <= 0;
			Y <= 0;
		end
		else begin					
			if (n == N[s+1]-1) begin
				n <= 0; 
				m <= m+1;
			end
			else n <= n+1;
			
			if (n == 0) begin
				Y0 <= 0;
				Y <= {W{~Y1[W-1]}}&Y1;
			end Y0 <= Y1;
			
			if(m == N[s]*N[s+2]-1) begin 
				m <= 0;
				s <= s+1;
			end			
		end
	
endmodule



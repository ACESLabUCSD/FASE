`timescale 1ns / 1ps

module OscRing #(parameter n = 3)( // n- no of inverters
    input wire clk,
	 input wire rst,
    output wire out
    );

(*S = "YES", KEEP = "TRUE"*)wire [n:0] c;

genvar k;
generate
for (k = n-1; k >= 0; k = k - 1)
begin: inverter
	LUT1 #(
	.INIT(2'b01) 
	) inverter (
	.O(c[k]), 
	.I0(c[k+1]) 
	);
end
endgenerate

assign c[n] = rst? 1'b1 : c[0];

FD Sample (
	.Q (out),
	.C (clk),
	.D (c[0]));


endmodule

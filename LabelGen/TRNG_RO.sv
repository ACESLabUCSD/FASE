`timescale 1ns / 1ps

(*KEEP_HIERARCHY = "TRUE"*)
module TRNG_RO #(parameter n = 3, N_RO = 32, logN = 5)( // n- no of inverters in one ring, N_RO- no of rings
    input wire clk,
    input wire rst,
    output wire rand
    );
	 
(* OPTIMIZE = "OFF" *)

wire [N_RO-1:0] R;	 

genvar k;
generate
for (k = N_RO-1; k >= 0; k = k - 1)
begin: Ring
	OscRing #(n) Ring( 
    .clk(clk),
	.rst(rst),
    .out(R[k])
    );
end
endgenerate

wire randD;
XOR_tree #(N_RO, logN ) XOR_tree1(
    .in(R),
    .out(randD)
    );
	 
FD Capture (
	.Q (rand),
	.C (clk),
	.D (randD));


endmodule



`include "../Header/MAC_H.vh"

module FIFO #(parameter N = 128, S = NR_AES)(	
	input			clk, rst,
	input 	[N-1:0]	in,
	output	[N-1:0]	out
);

	logic	[N-1:0]	FIFO[0:S-1];
	
	assign out = FIFO[S-1];
	
	integer k;
	
	always_ff @(posedge clk or posedge rst) begin
		for(k = 0; k < S; k = k+1) begin
			if(rst)	begin 
				FIFO[k] <= 'b0;
			end
			else begin 
				if (k == 0) begin
					FIFO[k]	<=  in;
				end
				else begin 
					FIFO[k]	<= FIFO[k-1];
				end
			end
		end
	end

endmodule
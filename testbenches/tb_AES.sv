`timescale 1ns / 1ps
`include "../Header/MAC_H.vh"

module tb_AES;

	logic			clk, rst;
	logic	[127:0]	state, key;
	logic	[127:0]	out;
	 
	AES_128 uut(
		.clk(clk), .rst(rst),
		.key(key),
		.state(state),
		.out(out)
	);

	integer k, l;
	logic	[127:0]	out_ref_in, out_ref_out;
	logic	[127:0]	out_ref_PL[0:NR_AES];

	always #50 clk = ~clk;
		
	initial begin
		clk = 'b0;
		rst = 'b1;
		#100;
		rst = 'b0;
		
		//http://aes.online-domain-tools.com/
		key = 128'he4dc18adf3d05ec9e4dcc41acb990007; //in GC key is fixed for one netlist, so there is no pipeline for the keys, will not work in a generic setting where keys are regularly updated.
		
		@(posedge clk);
		state = 128'h4072da1240f930f7d3c8cf8b9322042e;
		out_ref_in = 128'hd225406f484809186cb5d86be4098445;
		@(posedge clk);
		state = 128'h110687e2636afdb84c12653d55f3bae1;	
		out_ref_in = 128'hccbf51af8e0bbc46283481a211e9c77b;
	end

	always_ff @(posedge clk or posedge rst) begin
		if(rst) l <= 0;
		else l <= l+1;

		for(k = 0; k < NR_AES+1; k = k+1) begin
			if(rst)	out_ref_PL[k] <= 'b0;
			else begin 
				if (k == 0) out_ref_PL[k] <=  out_ref_in;
				else out_ref_PL[k] <= out_ref_PL[k-1];
			end
		end
			
		if(l > NR_AES) begin
			$display("out = %x", (out));
			assert(out == out_ref_out) $display("Pass");
			else $error("Output should be %x", out_ref_out);
		end
			
		if (l > NR_AES+1) $stop();
	end

	assign out_ref_out = out_ref_PL[NR_AES];
	
endmodule
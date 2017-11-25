module tb_AES;

reg [127:0] state, key;
wire [127:0] out;
reg [127:0] out_ref;
 
AES_128 uut
(
	.key(key),
	.state(state),
	.out(out)
);

	always @(out) begin
		#10;
		$display("out = %x", (out));
		if(out == out_ref) $display("Pass");
		else $display("Fail! Output should be %x", out_ref);
	end
	
initial begin
	//http://aes.online-domain-tools.com/
	#10;
	state = 128'h4072da1240f930f7d3c8cf8b9322042e;
	key = 128'he4dc18adf3d05ec9e4dcc41acb990007;
	out_ref = 128'hd225406f484809186cb5d86be4098445;
	#100;
	state = 128'h110687e2636afdb84c12653d55f3bae1;	
	key = 128'h1209239bbbe23cca9c3c8ccf138f54e0;
	out_ref = 128'h5867142e883b431b428fc33306a272de;
end

endmodule
module tb_MxM;

parameter W = 8, M = 200, N = 100, P = 120; // W = bit-width, (MxN)x(NxP) -> (MxP)

reg clk, rst;
reg [W-1:0] A, X;
wire signed [W-1:0] Y;

MxM #(.W(W), .N(N)) uut( 
	.clk(clk), .rst(rst),
	.A(A), .X(X),
	.Y(Y)
);

reg [W-1:0] A_arr[M*N-1:0], X_arr[N*P-1:0], Y_arr[M*P-1:0];
reg signed [W-1:0] Y_ref;
integer m, n, p;
reg init, pass;

parameter HEX_PATH = "./";
initial begin
	$readmemh ("A_200_100.hex", A_arr);
	$readmemh ("X_100_120.hex", X_arr);
	$readmemh ("Y_200_120.hex", Y_arr);
	clk <= 0;
	rst <= 1;
	@(posedge clk);
	#20;
	rst <= 0;	
end

always #50 clk = ~clk;

always @(posedge clk)
		if(rst) begin			
			A <= 0;
			X <= 0;
			n <= 0; 
			m <= 0; 
			p <= 0;
			init <= 1'b1;
			pass <= 1'b1;
		end
		else begin
			A <= A_arr[m*N + n];
			X <= X_arr[p*N + n];
			
			n <= n+1;
			if (n == N-1) begin
				n <= 0; 
				m <= m+1;
				if (m == M-1) begin	
					init <= 0;
					m <= 0;
					p <= p+1;
					if (p == P-1) begin
						p <= 0;
					end
				end
			end
			if (n == 0) begin
				Y_ref <= Y_arr[p*M + m-1];
				if (((Y-Y_ref) < -5)||((Y-Y_ref) > 5)) begin
					pass <= 1'b0;
					$display ("%d,\t\t%d:\t\t%d", p, m, (Y-Y_ref));
				end
			end
			if ((~init) && (p == 0) && (n == 1)) begin
				if(pass) $display ("Passed!");
				$stop();
			end
		end

endmodule 
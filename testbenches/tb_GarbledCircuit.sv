// Copyright 2018 Songhori, Ebrahim and Hussain, Siam Umar

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

`include "../Header/MAC_H.vh"
`define SIM

module tb_GarbledCircuit;
	
	logic			clk, rst, start;	
	logic	[2:0]	tag;
	logic	[S-1:0]	index0, index1; 
	logic	[K-1:0]	data0, data1;	
	
	GarbledCircuit  #(.S(S), .K(K)) uut (  
		.clk(clk), .rst(rst), .start(start),
		.tag(tag),
		.index0(index0), .index1(index1), 
        .data0(data0), .data1(data1)
	);	
	
	logic	[K-1:0]	Keys [0:1];
	logic	[K-1:0]	InLabels [0:2**S-1];
	logic	[K-1:0]	GarbledTables [0:2**S-1];
	logic	[K-1:0]	OutputMask ;
	
	always #50 clk = ~clk;
	
	integer k, f_IL, f_K, f_GT;
		
	initial begin	
		f_IL = $fopen({LOC, LABELFILE},"w");
		f_K = $fopen({LOC, KEYFILE},"w");
		f_GT = $fopen({LOC, TABLEFILE},"w");
		
		clk = 'b0;
		rst = 'b1;	
		start = 'b0;	
		#100;
		rst = 'b0;
		#100;
		start = 'b1;
		#100;		
		start = 'b0;
		while(1) begin
			@(posedge clk);
			if(tag[2]) begin
				if(tag[0]) InLabels[index0] = data0;
				if(tag[1]) InLabels[index1] = data1;
			end
			else begin
				if(tag[1:0] == 2'b01) begin
					Keys[0] = data0;
					Keys[1] = data1;					
				end
				else if(tag[1:0] == 2'b10) begin
					GarbledTables[index0] = data0;
					GarbledTables[index1] = data1;				
				end
				else if(tag[1:0] == 2'b11) begin
					OutputMask = data0;	
		
					for (k = 0; k < 21; k = k+1)
						$fwrite(f_IL,"%H\n", InLabels[k]);
					for (k = 0; k < 8; k = k+1) begin
						$fwrite(f_GT,"%H\n", GarbledTables[2*k]);
						$fwrite(f_GT,"%H\n", GarbledTables[2*k+1]);
					end
						
					$fclose(f_IL);
					$fclose(f_K);
					$fclose(f_GT);
					$stop();
					//break;
				end
			end
		end		
	end

endmodule

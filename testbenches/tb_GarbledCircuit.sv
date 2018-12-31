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
	logic	[S-1:0]	cid, index0, index1; 
	logic	[K-1:0]	data0, data1;	
	
	GarbledCircuit  #(.S(S), .K(K)) uut (  
		.clk(clk), .rst(rst), .start(start),
		.tag(tag),
		.cid(cid), .index0(index0), .index1(index1), 
        .data0(data0), .data1(data1)
	);	
	
	logic	[K-1:0]	Keys [0:1];
	logic	[K-1:0]	InLabels [0:2**S-1];
	logic	[K-1:0]	GarbledTables [0:2**S-1];
	logic	[0:K-1]	OutputMask[CC] ;
	
	always #50 clk = ~clk;
	
	integer f_N, f_IL, f_K, f_GT, f_M;
	integer k, l, line, init_size, input_size, dff_size, output_size, gate_size, num_XOR;
		
	initial begin	
		$display("starting simulation");
		
		f_N = $fopen({LOC, NETLISTFILE},"r");
		
		$fscanf(f_N, "%h", line);
		init_size = line[2*S-1:S]+line[S-1:0];
		$fscanf(f_N, "%h", line);
		input_size = line[2*S-1:S]+line[S-1:0];
		$fscanf(f_N, "%h", line);
		output_size = line[S-1:0];
		dff_size = line[2*S-1:S];
		$fscanf(f_N, "%h", line);
		gate_size = line[S-1:0];
		num_XOR = line[2*S-1:S];
		
		$fclose(f_N);
		
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
			if(cid == CC)break;
			if(tag[2]) begin
				if(tag[0]) InLabels[cid*input_size+index0] = data0;
				if(tag[1]) InLabels[cid*input_size+index1] = data1;
			end
			else begin
				if(tag[1:0] == 2'b01) begin
					Keys[0] = data0;
					Keys[1] = data1;					
				end
				else if(tag[1:0] == 2'b10) begin
					GarbledTables[2*cid*(gate_size-num_XOR)+index0] = data0;
					GarbledTables[2*cid*(gate_size-num_XOR)+index1] = data1;				
				end
				else if(tag[1:0] == 2'b11) begin
					OutputMask[cid] = data0;	
				end
			end
		end	
		
		f_IL = $fopen({LOC, LABELFILE},"w");
		f_K = $fopen({LOC, KEYFILE},"w");
		f_GT = $fopen({LOC, TABLEFILE},"w");
		f_M = $fopen({LOC, MASKFILE},"w");
		
		for (k = 0; k < (init_size+CC*input_size+2); k = k+1) //+2 for constant labels
			$fwrite(f_IL,"%H\n", InLabels[k]);
		for (k = 0; k < 2; k = k+1)
			$fwrite(f_K,"%H\n", Keys[k]);
		for (k = 0; k < CC*(gate_size-num_XOR); k = k+1) begin
			$fwrite(f_GT,"%H\n", GarbledTables[2*k]);
			$fwrite(f_GT,"%H\n", GarbledTables[2*k+1]);
		end
		for (l = 0; l < CC; l = l+1)
			for (k = 0; k < output_size; k = k+1)
				$fwrite(f_M,"%b\n", OutputMask[l][k]);
			
		$fclose(f_IL);
		$fclose(f_K);
		$fclose(f_GT);
		$fclose(f_M);
		
		$display("end simulation");
		$stop();	
	end

endmodule

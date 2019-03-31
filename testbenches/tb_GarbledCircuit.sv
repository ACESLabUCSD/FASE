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

module tb_GarbledCircuit;
	
	logic			clk, rst, start;
	logic	[31:0]	netlist_in;	
	logic	[2:0]	tag_t1;
	logic	[S-1:0]	cid, index0_t1, index1_t1; 
	logic	[K-1:0]	data0_t1, data1_t1;	
	
	GarbledCircuit  #(.S(S), .K(K)) uut (  
		.clk(clk), .rst(rst), .start(start),
		.netlist_in(netlist_in),
		.tag_t1(tag_t1),
		.cid(cid), .index0_t1(index0_t1), .index1_t1(index1_t1), 
        .data0_t1(data0_t1), .data1_t1(data1_t1)
	);	
	
	logic	[K-1:0]	Keys [0:1];
	logic	[K-1:0]	InLabels [0:2**S-1];
	logic	[K-1:0]	GarbledTables [0:2**S-1];
	logic	[0:K-1]	OutputMask[CC] ;
	
	always #50 clk = ~clk;
	
	integer f_N, f_IL, f_K, f_GT, f_M;
	integer k, l, line, cycles;
	integer init_size, input_size, dff_size, output_size, gate_size, num_XOR;
	integer	dff_gate_size;
	
	assign dff_gate_size = dff_size + gate_size;	
	//assign netlist_in = line;
		
	initial begin	
		$display("Starting simulation");
		
		k = 0;
		l = 0;
		line = 0;
		cycles = 0;
		init_size = 0;
		input_size = 0;
		dff_size = 0;
		output_size = 0;
		gate_size = 0;
		num_XOR = 0;
		netlist_in = 'b0;	
		
		clk = 'b0;
		rst = 'b1;	
		start = 'b0;	
		#100;
		rst = 'b0;
		
		f_N = $fopen({LOC, NETLISTFILE},"r");
		
		@(posedge clk);
		start = 'b1;
		
		$fscanf(f_N, "%h", line);
		init_size = line[2*P-1:P]+line[P-1:0];	
		@(posedge clk);		
		start = 'b0;
		netlist_in = line;	
		
		$fscanf(f_N, "%h", line);
		input_size = line[2*P-1:P]+line[P-1:0];
		@(posedge clk);	
		netlist_in = line;
		
		$fscanf(f_N, "%h", line);
		output_size = line[P-1:0];
		dff_size = line[2*P-1:P];
		@(posedge clk);	
		netlist_in = line;
		
		$fscanf(f_N, "%h", line);
		gate_size = line[P-1:0];
		num_XOR = line[2*P-1:P];
		@(posedge clk);
		netlist_in = line;	
		
		for (k = 0; k < dff_gate_size; k = k+1) begin
			$fscanf(f_N, "%h", line);
			@(posedge clk);	
			netlist_in = line;
		end			
		
		$fclose(f_N);
		
		while(1) begin
			cycles = cycles + 1;
			@(posedge clk);
			if(cid == CC)break;
			
			if(tag_t1[2]) begin
				if(tag_t1[0]) InLabels[cid*input_size+index0_t1] = data0_t1;
				if(tag_t1[1]) InLabels[cid*input_size+index1_t1] = data1_t1;
			end
			else begin
				if(tag_t1[1:0] == 2'b01) begin
					Keys[0] = data0_t1;
					Keys[1] = data1_t1;					
				end
				else if(tag_t1[1:0] == 2'b10) begin
					GarbledTables[2*cid*(gate_size-num_XOR)+index0_t1] = data0_t1;
					GarbledTables[2*cid*(gate_size-num_XOR)+index1_t1] = data1_t1;				
				end
				else if(tag_t1[1:0] == 2'b11) begin
					OutputMask[cid] = data0_t1;	
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
			for (k = output_size-1; k >= 0; k = k-1)
				$fwrite(f_M,"%b\n", OutputMask[l][k]);
			
		$fclose(f_IL);
		$fclose(f_K);
		$fclose(f_GT);
		$fclose(f_M);
		
		$display("Simulation ended in %d cycles", cycles);
		$stop();	
	end

endmodule

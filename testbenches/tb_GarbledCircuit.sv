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
	
	GarbledCircuit  #(.S(S), .K(K)) uut (  
		.clk(clk), .rst(rst), .start(start)
	);

	always #50 clk = ~clk;
		
	initial begin		
		clk = 'b0;
		rst = 'b1;	
		start = 'b0;	
		#100;
		rst = 'b0;
		#100;
		start = 'b1;
		#100;		
		start = 'b0;
	end

endmodule

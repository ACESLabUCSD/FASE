//MAC_H.vh

`ifndef _MAC_H_
`define _MAC_H_

function integer log2;
	input [31:0] value;
	reg [31:0] temp;
	begin
		temp = value - 1;
		for (log2 = 0; temp > 0; log2 = log2 + 1)
			temp = temp >> 1;
	end
endfunction

`endif 
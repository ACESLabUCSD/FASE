//MAC_H.vh

`ifndef _MAC_H_
`define _MAC_H_

function automatic integer log2;
	input [31:0] value;
	reg [31:0] temp;
	begin
		temp = value - 1;
		for (log2 = 0; temp > 0; log2 = log2 + 1)
			temp = temp >> 1;
	end
endfunction

function automatic [127:0] changeEndian;
	input [127:0] text;
	begin
		changeEndian = {
			text[7:0],
			text[15:8],
			text[23:16],
			text[31:24],
			text[39:32],
			text[47:40],
			text[55:48],
			text[63:56],
			text[71:64],
			text[79:72],
			text[87:80],
			text[95:88],
			text[103:96],
			text[111:104],
			text[119:112],
			text[127:120]
		};
	end
endfunction

parameter NOTINPUT	= -1;
parameter CONSTZERO	= -2;
parameter CONSTONE	= -3;

parameter ANDGATE	= 4'b1000; //8
parameter ANDNGATE	= 4'b0100; //4
parameter NANDGATE	= 4'b0111; //7
parameter NANDNGATE = 4'b1011; //11
parameter ORGATE	= 4'b1110; //14
parameter ORNGATE	= 4'b1101; //13
parameter NORGATE	= 4'b0001; //1
parameter NORNGATE	= 4'b0010; //2
parameter XORGATE	= 4'b0110; //6
parameter XNORGATE	= 4'b1001; //9
parameter NOTGATE	= 4'b1100; //12
parameter DFFGATE	= 4'b1111;

function automatic integer Type2V;
	input [3:0] gateType;
begin
	if (gateType == ANDGATE) Type2V =  3'b000;
	else if (gateType == ANDNGATE) Type2V =  3'b010;
	else if (gateType == NANDGATE) Type2V =  3'b100;
	else if (gateType == NANDNGATE) Type2V =  3'b110;
	else if (gateType == ORGATE) Type2V =  3'b111;
	else if (gateType == ORNGATE) Type2V =  3'b101;
	else if (gateType == NORGATE) Type2V =  3'b011;
	else if (gateType == NORNGATE) Type2V =  3'b001;
end
endfunction

parameter NR_AES = 10; //no of pipeline stages in AES = no of AES rounds
parameter K = 128; //security parameter, bit-length of keys
parameter S = 14; //width of gate id (or wire id), maximum number of gates = 2^S

/*simulation files*/	
parameter CC = 32;
parameter LOC = "/home/siam/git/hostCPU_TG/hw_aclrtr/hamming/";
parameter NETLISTFILE = "Netlist.txt";
parameter KEYFILE = "Keys.txt";
parameter LABELFILE = "Labels.txt";
parameter MASKFILE = "OMasks.txt";
parameter TABLEFILE = "Tables.txt";
parameter OLABELFILE = "OLabels.txt";
`endif 
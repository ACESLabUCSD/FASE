`timescale 1ns / 1ps
`include "../Header/MAC_H.vh"

//AES 128 bit, ECB mode
module AES_128(
	state,
	key,
	out
);

	
  localparam    NR = 10;

  input   	[127:0]	key;
  input		[127:0]	state;
  output	[127:0]	out;
  wire		[127:0]	out_wire;
  
  assign out = changeEndian(out_wire);
  
  wire    		[128*(NR+1)-1:0] expandedKey;
  wire    		[127:0]     expandedKeyi[NR:0];
  wire    		[127:0]     x1[NR-1:0];
  wire    		[127:0]     x2[NR-1:0];
  wire    		[127:0]     x3[NR-1:0];
  wire    		[127:0]     x4[NR-2:0];


  genvar i;

  KeyExpansion e (.key(changeEndian(key)), .expandedKey(expandedKey));


  generate 
  for(i=0;i<(NR+1);i=i+1)
  begin:EXPANDKEY
    assign expandedKeyi[i] = expandedKey[128*(i+1)-1:128*i];
  end
  endgenerate

  AddRoundKey a(.x(changeEndian(state)), .y(expandedKeyi[0]), .z(x1[0]));

  generate 
  for(i=0;i<NR;i=i+1)
  begin:SUBBYTES
    SubBytes a(.x(x1[i]), .z(x2[i]));
  end
  endgenerate

  generate 
  for(i=0;i<NR;i=i+1)
  begin:SHIFTROWS
    ShiftRows c(.x(x2[i]), .z(x3[i]));
  end
  endgenerate

  generate 
  for(i=0;i<NR-1;i=i+1)
  begin:MIXCOLUMNS
    MixColumns d(.x(x3[i]), .z(x4[i]));
  end
  endgenerate

  generate 
  for(i=0;i<NR;i=i+1)
  begin:ADDROUNDKEY
    if(i==NR-1) begin:LAST
      AddRoundKey a(.x(x3[i]), .y(expandedKeyi[i+1]), .z(out_wire));
    end else begin:ELSE
      AddRoundKey a(.x(x4[i]), .y(expandedKeyi[i+1]), .z(x1[i+1]));
    end
  end
  endgenerate


endmodule

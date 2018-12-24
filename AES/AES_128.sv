`timescale 1ns / 1ps
`include "../Header/MAC_H.vh"

//AES 128 bit, ECB mode
module AES_128(
	input				clk, rst,
	//input   	[127:0]	key,
	/*in GC key is fixed for one netlist, so there is no pipeline for the keys, will not work in a generic setting where keys are regularly updated.*/
	input		[128*(NR_AES+1)-1:0] expandedKey,
	input		[127:0]	state,
	output		[127:0]	out
);
	
  logic		[127:0]	out_wire;  
  assign out = changeEndian(out_wire);
  
  //logic    		[128*(NR_AES+1)-1:0] expandedKey;
  logic    		[127:0]     expandedKeyi[NR_AES:0];
  logic    		[127:0]     x1[NR_AES-1:0];
  logic    		[127:0]     x1_reg[NR_AES-1:0];
  logic    		[127:0]     x2[NR_AES-1:0];
  logic    		[127:0]     x3[NR_AES-1:0];
  logic    		[127:0]     x4[NR_AES-2:0];

  genvar i;
	
  //KeyExpansion e (.key(changeEndian(key)), .expandedKey(expandedKey));

  generate 
  for(i=0;i<(NR_AES+1);i=i+1)
  begin:EXPANDKEY
    assign expandedKeyi[i] = expandedKey[128*(i+1)-1:128*i];
  end
  endgenerate

  AddRoundKey a(.x(changeEndian(state)), .y(expandedKeyi[0]), .z(x1[0]));

  generate 
  for(i=0;i<NR_AES;i=i+1)
  begin:SUBBYTES
    SubBytes a(.x(x1_reg[i]), .z(x2[i]));
  end
  endgenerate

  generate 
  for(i=0;i<NR_AES;i=i+1)
  begin:SHIFTROWS
    ShiftRows c(.x(x2[i]), .z(x3[i]));
  end
  endgenerate

  generate 
  for(i=0;i<NR_AES-1;i=i+1)
  begin:MIXCOLUMNS
    MixColumns d(.x(x3[i]), .z(x4[i]));
  end
  endgenerate

  generate 
  for(i=0;i<NR_AES;i=i+1)
  begin:ADDROUNDKEY
    if(i==NR_AES-1) begin:LAST
      AddRoundKey a(.x(x3[i]), .y(expandedKeyi[i+1]), .z(out_wire));
    end else begin:ELSE
      AddRoundKey a(.x(x4[i]), .y(expandedKeyi[i+1]), .z(x1[i+1]));
    end
  end
  endgenerate
  
  integer k;
  always_ff @(posedge clk or posedge rst) begin
	for(k=0;k<NR_AES;k=k+1)
		if(rst)	x1_reg[k] <= 'b0;
		else x1_reg[k] <= x1[k];
  end


endmodule

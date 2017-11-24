
module MAC_TG_N32 ( clk, rst, g_input, e_input, o );
  input [31:0] g_input;
  input [31:0] e_input;
  output [31:0] o;
  input clk, rst;
  wire   \_MAC/AX[31] , \_MAC/AX[30] , \_MAC/AX[29] , \_MAC/AX[28] ,
         \_MAC/AX[27] , \_MAC/AX[26] , \_MAC/AX[25] , \_MAC/AX[24] ,
         \_MAC/AX[23] , \_MAC/AX[22] , \_MAC/AX[21] , \_MAC/AX[20] ,
         \_MAC/AX[19] , \_MAC/AX[18] , \_MAC/AX[17] , \_MAC/AX[16] ,
         \_MAC/AX[15] , \_MAC/AX[14] , \_MAC/AX[13] , \_MAC/AX[12] ,
         \_MAC/AX[11] , \_MAC/AX[10] , \_MAC/AX[9] , \_MAC/AX[8] ,
         \_MAC/AX[7] , \_MAC/AX[6] , \_MAC/AX[5] , \_MAC/AX[4] , \_MAC/AX[3] ,
         \_MAC/AX[2] , \_MAC/AX[1] , \_MAC/AX[0] ;
  wire   [31:0] o_reg;
  wire   SYNOPSYS_UNCONNECTED__0;

  DFF \o_reg_reg[0]  ( .D(o[0]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o_reg[0])
         );
  DFF \o_reg_reg[1]  ( .D(o[1]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o_reg[1])
         );
  DFF \o_reg_reg[2]  ( .D(o[2]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o_reg[2])
         );
  DFF \o_reg_reg[3]  ( .D(o[3]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o_reg[3])
         );
  DFF \o_reg_reg[4]  ( .D(o[4]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o_reg[4])
         );
  DFF \o_reg_reg[5]  ( .D(o[5]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o_reg[5])
         );
  DFF \o_reg_reg[6]  ( .D(o[6]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o_reg[6])
         );
  DFF \o_reg_reg[7]  ( .D(o[7]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o_reg[7])
         );
  DFF \o_reg_reg[8]  ( .D(o[8]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o_reg[8])
         );
  DFF \o_reg_reg[9]  ( .D(o[9]), .CLK(clk), .RST(rst), .I(1'b0), .Q(o_reg[9])
         );
  DFF \o_reg_reg[10]  ( .D(o[10]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[10]) );
  DFF \o_reg_reg[11]  ( .D(o[11]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[11]) );
  DFF \o_reg_reg[12]  ( .D(o[12]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[12]) );
  DFF \o_reg_reg[13]  ( .D(o[13]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[13]) );
  DFF \o_reg_reg[14]  ( .D(o[14]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[14]) );
  DFF \o_reg_reg[15]  ( .D(o[15]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[15]) );
  DFF \o_reg_reg[16]  ( .D(o[16]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[16]) );
  DFF \o_reg_reg[17]  ( .D(o[17]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[17]) );
  DFF \o_reg_reg[18]  ( .D(o[18]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[18]) );
  DFF \o_reg_reg[19]  ( .D(o[19]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[19]) );
  DFF \o_reg_reg[20]  ( .D(o[20]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[20]) );
  DFF \o_reg_reg[21]  ( .D(o[21]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[21]) );
  DFF \o_reg_reg[22]  ( .D(o[22]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[22]) );
  DFF \o_reg_reg[23]  ( .D(o[23]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[23]) );
  DFF \o_reg_reg[24]  ( .D(o[24]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[24]) );
  DFF \o_reg_reg[25]  ( .D(o[25]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[25]) );
  DFF \o_reg_reg[26]  ( .D(o[26]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[26]) );
  DFF \o_reg_reg[27]  ( .D(o[27]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[27]) );
  DFF \o_reg_reg[28]  ( .D(o[28]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[28]) );
  DFF \o_reg_reg[29]  ( .D(o[29]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[29]) );
  DFF \o_reg_reg[30]  ( .D(o[30]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[30]) );
  DFF \o_reg_reg[31]  ( .D(o[31]), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        o_reg[31]) );
  ADD_ \_MAC/_ADD  ( .A({\_MAC/AX[31] , \_MAC/AX[30] , \_MAC/AX[29] , 
        \_MAC/AX[28] , \_MAC/AX[27] , \_MAC/AX[26] , \_MAC/AX[25] , 
        \_MAC/AX[24] , \_MAC/AX[23] , \_MAC/AX[22] , \_MAC/AX[21] , 
        \_MAC/AX[20] , \_MAC/AX[19] , \_MAC/AX[18] , \_MAC/AX[17] , 
        \_MAC/AX[16] , \_MAC/AX[15] , \_MAC/AX[14] , \_MAC/AX[13] , 
        \_MAC/AX[12] , \_MAC/AX[11] , \_MAC/AX[10] , \_MAC/AX[9] , 
        \_MAC/AX[8] , \_MAC/AX[7] , \_MAC/AX[6] , \_MAC/AX[5] , \_MAC/AX[4] , 
        \_MAC/AX[3] , \_MAC/AX[2] , \_MAC/AX[1] , \_MAC/AX[0] }), .B(o_reg), 
        .O({o, SYNOPSYS_UNCONNECTED__0}) );
  MULT_ \_MAC/_MULT  ( .A(g_input), .X(e_input), .AX({\_MAC/AX[31] , 
        \_MAC/AX[30] , \_MAC/AX[29] , \_MAC/AX[28] , \_MAC/AX[27] , 
        \_MAC/AX[26] , \_MAC/AX[25] , \_MAC/AX[24] , \_MAC/AX[23] , 
        \_MAC/AX[22] , \_MAC/AX[21] , \_MAC/AX[20] , \_MAC/AX[19] , 
        \_MAC/AX[18] , \_MAC/AX[17] , \_MAC/AX[16] , \_MAC/AX[15] , 
        \_MAC/AX[14] , \_MAC/AX[13] , \_MAC/AX[12] , \_MAC/AX[11] , 
        \_MAC/AX[10] , \_MAC/AX[9] , \_MAC/AX[8] , \_MAC/AX[7] , \_MAC/AX[6] , 
        \_MAC/AX[5] , \_MAC/AX[4] , \_MAC/AX[3] , \_MAC/AX[2] , \_MAC/AX[1] , 
        \_MAC/AX[0] }) );
endmodule


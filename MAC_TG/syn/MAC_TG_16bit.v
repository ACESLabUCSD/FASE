
module MAC_TG_N16 ( clk, rst, g_input, e_input, o );
  input [15:0] g_input;
  input [15:0] e_input;
  output [15:0] o;
  input clk, rst;
  wire   \_MAC/AX[15] , \_MAC/AX[14] , \_MAC/AX[13] , \_MAC/AX[12] ,
         \_MAC/AX[11] , \_MAC/AX[10] , \_MAC/AX[9] , \_MAC/AX[8] ,
         \_MAC/AX[7] , \_MAC/AX[6] , \_MAC/AX[5] , \_MAC/AX[4] , \_MAC/AX[3] ,
         \_MAC/AX[2] , \_MAC/AX[1] , \_MAC/AX[0] ;
  wire   [15:0] o_reg;
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
  ADD_ \_MAC/_ADD  ( .A({\_MAC/AX[15] , \_MAC/AX[14] , \_MAC/AX[13] , 
        \_MAC/AX[12] , \_MAC/AX[11] , \_MAC/AX[10] , \_MAC/AX[9] , 
        \_MAC/AX[8] , \_MAC/AX[7] , \_MAC/AX[6] , \_MAC/AX[5] , \_MAC/AX[4] , 
        \_MAC/AX[3] , \_MAC/AX[2] , \_MAC/AX[1] , \_MAC/AX[0] }), .B(o_reg), 
        .O({o, SYNOPSYS_UNCONNECTED__0}) );
  MULT_ \_MAC/_MULT  ( .A(g_input), .X(e_input), .AX({\_MAC/AX[15] , 
        \_MAC/AX[14] , \_MAC/AX[13] , \_MAC/AX[12] , \_MAC/AX[11] , 
        \_MAC/AX[10] , \_MAC/AX[9] , \_MAC/AX[8] , \_MAC/AX[7] , \_MAC/AX[6] , 
        \_MAC/AX[5] , \_MAC/AX[4] , \_MAC/AX[3] , \_MAC/AX[2] , \_MAC/AX[1] , 
        \_MAC/AX[0] }) );
endmodule


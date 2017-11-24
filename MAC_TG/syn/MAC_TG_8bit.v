
module MAC_TG_N8 ( clk, rst, g_input, e_input, o );
  input [7:0] g_input;
  input [7:0] e_input;
  output [7:0] o;
  input clk, rst;
  wire   \_MAC/AX[7] , \_MAC/AX[6] , \_MAC/AX[5] , \_MAC/AX[4] , \_MAC/AX[3] ,
         \_MAC/AX[2] , \_MAC/AX[1] , \_MAC/AX[0] ;
  wire   [7:0] o_reg;
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
  ADD_ \_MAC/_ADD  ( .A({\_MAC/AX[7] , \_MAC/AX[6] , \_MAC/AX[5] , 
        \_MAC/AX[4] , \_MAC/AX[3] , \_MAC/AX[2] , \_MAC/AX[1] , \_MAC/AX[0] }), 
        .B(o_reg), .O({o, SYNOPSYS_UNCONNECTED__0}) );
  MULT_ \_MAC/_MULT  ( .A(g_input), .X(e_input), .AX({\_MAC/AX[7] , 
        \_MAC/AX[6] , \_MAC/AX[5] , \_MAC/AX[4] , \_MAC/AX[3] , \_MAC/AX[2] , 
        \_MAC/AX[1] , \_MAC/AX[0] }) );
endmodule


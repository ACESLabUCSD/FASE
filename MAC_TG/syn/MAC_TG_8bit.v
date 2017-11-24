
module MAC_TG_N8 ( clk, rst, g_input, e_input, o );
  input [7:0] g_input;
  input [7:0] e_input;
  output [7:0] o;
  input clk, rst;
  wire   \_MAC/AX[7] , \_MAC/AX[6] , \_MAC/AX[5] , \_MAC/AX[4] , \_MAC/AX[3] ,
         \_MAC/AX[2] , \_MAC/AX[1] , \_MAC/AX[0] , \_MAC/_MULT/AX__[7] ,
         \_MAC/_MULT/AX__[6] , \_MAC/_MULT/AX__[5] , \_MAC/_MULT/AX__[4] ,
         \_MAC/_MULT/AX__[3] , \_MAC/_MULT/AX__[2] , \_MAC/_MULT/AX__[1] ,
         \_MAC/_MULT/AX__[0] , \_MAC/_MULT/AX_[0] , \_MAC/_MULT/AX_[1] ,
         \_MAC/_MULT/AX_[2] , \_MAC/_MULT/AX_[3] , \_MAC/_MULT/AX_[4] ,
         \_MAC/_MULT/AX_[5] , \_MAC/_MULT/AX_[6] , \_MAC/_MULT/AX_[7] ,
         \_MAC/_MULT/X_[7] , \_MAC/_MULT/X_[6] , \_MAC/_MULT/X_[5] ,
         \_MAC/_MULT/X_[4] , \_MAC/_MULT/X_[3] , \_MAC/_MULT/X_[2] ,
         \_MAC/_MULT/X_[1] , \_MAC/_MULT/X_[0] , \_MAC/_MULT/A_[7] ,
         \_MAC/_MULT/A_[6] , \_MAC/_MULT/A_[5] , \_MAC/_MULT/A_[4] ,
         \_MAC/_MULT/A_[3] , \_MAC/_MULT/A_[2] , \_MAC/_MULT/A_[1] ,
         \_MAC/_MULT/A_[0] , \_MAC/_MULT/MULT/S[1][1][0] ,
         \_MAC/_MULT/MULT/S[1][1][1] , \_MAC/_MULT/MULT/S[1][1][2] ,
         \_MAC/_MULT/MULT/S[1][1][3] , \_MAC/_MULT/MULT/S[1][1][4] ,
         \_MAC/_MULT/MULT/S[1][1][5] , \_MAC/_MULT/MULT/S[1][1][6] ,
         \_MAC/_MULT/MULT/S[1][1][7] ,
         \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[7] ,
         \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[6] ,
         \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[5] ,
         \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[4] , n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320;
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
  TwosComplement \_MAC/_MULT/TwosComplement_O  ( .A({\_MAC/_MULT/AX_[7] , 
        \_MAC/_MULT/AX_[6] , \_MAC/_MULT/AX_[5] , \_MAC/_MULT/AX_[4] , 
        \_MAC/_MULT/AX_[3] , \_MAC/_MULT/AX_[2] , \_MAC/_MULT/AX_[1] , 
        \_MAC/_MULT/AX_[0] }), .O({\_MAC/_MULT/AX__[7] , \_MAC/_MULT/AX__[6] , 
        \_MAC/_MULT/AX__[5] , \_MAC/_MULT/AX__[4] , \_MAC/_MULT/AX__[3] , 
        \_MAC/_MULT/AX__[2] , \_MAC/_MULT/AX__[1] , \_MAC/_MULT/AX__[0] }) );
  TwosComplement \_MAC/_MULT/TwosComplement_B  ( .A(e_input), .O({
        \_MAC/_MULT/X_[7] , \_MAC/_MULT/X_[6] , \_MAC/_MULT/X_[5] , 
        \_MAC/_MULT/X_[4] , \_MAC/_MULT/X_[3] , \_MAC/_MULT/X_[2] , 
        \_MAC/_MULT/X_[1] , \_MAC/_MULT/X_[0] }) );
  TwosComplement \_MAC/_MULT/TwosComplement_A  ( .A(g_input), .O({
        \_MAC/_MULT/A_[7] , \_MAC/_MULT/A_[6] , \_MAC/_MULT/A_[5] , 
        \_MAC/_MULT/A_[4] , \_MAC/_MULT/A_[3] , \_MAC/_MULT/A_[2] , 
        \_MAC/_MULT/A_[1] , \_MAC/_MULT/A_[0] }) );
  XOR \_MAC/_MULT/MUX_O/U22  ( .A(\_MAC/_MULT/AX_[0] ), .B(n320), .Z(
        \_MAC/AX[0] ) );
  XOR \_MAC/_MULT/MUX_O/U19  ( .A(\_MAC/_MULT/AX_[1] ), .B(n319), .Z(
        \_MAC/AX[1] ) );
  XOR \_MAC/_MULT/MUX_O/U16  ( .A(\_MAC/_MULT/AX_[2] ), .B(n318), .Z(
        \_MAC/AX[2] ) );
  XOR \_MAC/_MULT/MUX_O/U13  ( .A(\_MAC/_MULT/AX_[3] ), .B(n317), .Z(
        \_MAC/AX[3] ) );
  XOR \_MAC/_MULT/MUX_O/U10  ( .A(\_MAC/_MULT/AX_[4] ), .B(n316), .Z(
        \_MAC/AX[4] ) );
  XOR \_MAC/_MULT/MUX_O/U7  ( .A(\_MAC/_MULT/AX_[5] ), .B(n315), .Z(
        \_MAC/AX[5] ) );
  XOR \_MAC/_MULT/MUX_O/U4  ( .A(\_MAC/_MULT/AX_[6] ), .B(n314), .Z(
        \_MAC/AX[6] ) );
  XOR \_MAC/_MULT/MUX_O/U1  ( .A(\_MAC/_MULT/AX_[7] ), .B(n313), .Z(
        \_MAC/AX[7] ) );
  XOR \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/FA_IF2.FAINST[7].FA_/U2  ( 
        .A(\_MAC/_MULT/MULT/S[1][1][7] ), .B(
        \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[7] ), .Z(
        \_MAC/_MULT/AX_[7] ) );
  XOR \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/FA_IF2.FAINST[6].FA_/U2  ( 
        .A(\_MAC/_MULT/MULT/S[1][1][6] ), .B(
        \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[6] ), .Z(
        \_MAC/_MULT/AX_[6] ) );
  XOR \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/FA_IF2.FAINST[5].FA_/U2  ( 
        .A(\_MAC/_MULT/MULT/S[1][1][5] ), .B(
        \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[5] ), .Z(
        \_MAC/_MULT/AX_[5] ) );
  XOR \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/FA_IF2.FAINST[4].FA_/U2  ( 
        .A(\_MAC/_MULT/MULT/S[1][1][4] ), .B(
        \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[4] ), .Z(
        \_MAC/_MULT/AX_[4] ) );
  XOR \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/FA_IF2.FAINST[3].FA_/U2  ( 
        .A(\_MAC/_MULT/MULT/S[1][1][3] ), .B(n312), .Z(\_MAC/_MULT/AX_[3] ) );
  XOR \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/FA_IF2.FAINST[2].FA_/U2  ( 
        .A(\_MAC/_MULT/MULT/S[1][1][2] ), .B(n311), .Z(\_MAC/_MULT/AX_[2] ) );
  XOR \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/FA_IF2.FAINST[1].FA_/U2  ( 
        .A(\_MAC/_MULT/MULT/S[1][1][1] ), .B(n310), .Z(\_MAC/_MULT/AX_[1] ) );
  XOR \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/FA_IF2.FAINST[0].FA_/U2  ( 
        .A(\_MAC/_MULT/MULT/S[1][1][0] ), .B(n309), .Z(\_MAC/_MULT/AX_[0] ) );
  MUX U11 ( .IN0(n81), .IN1(n94), .SEL(n83), .F(n67) );
  MUX U12 ( .IN0(n123), .IN1(n125), .SEL(n124), .F(n61) );
  MUX U13 ( .IN0(n197), .IN1(n9), .SEL(n196), .F(n184) );
  IV U14 ( .A(n195), .Z(n9) );
  MUX U15 ( .IN0(n64), .IN1(\_MAC/_MULT/MULT/S[1][1][0] ), .SEL(n309), .F(n50)
         );
  XOR U16 ( .A(n228), .B(n229), .Z(n223) );
  MUX U17 ( .IN0(n42), .IN1(n44), .SEL(n43), .F(n34) );
  MUX U18 ( .IN0(n142), .IN1(n145), .SEL(n143), .F(n110) );
  MUX U19 ( .IN0(n10), .IN1(n57), .SEL(n56), .F(n42) );
  IV U20 ( .A(n55), .Z(n10) );
  MUX U21 ( .IN0(n206), .IN1(n224), .SEL(n208), .F(n191) );
  XOR U22 ( .A(n230), .B(n216), .Z(n221) );
  MUX U23 ( .IN0(n50), .IN1(\_MAC/_MULT/MULT/S[1][1][1] ), .SEL(n310), .F(n40)
         );
  MUX U24 ( .IN0(n11), .IN1(n47), .SEL(n48), .F(n38) );
  IV U25 ( .A(n49), .Z(n11) );
  XNOR U26 ( .A(n149), .B(n150), .Z(n118) );
  MUX U27 ( .IN0(n261), .IN1(n12), .SEL(n262), .F(n240) );
  IV U28 ( .A(n263), .Z(n12) );
  XOR U29 ( .A(n48), .B(n49), .Z(n44) );
  XOR U30 ( .A(n194), .B(n184), .Z(n187) );
  MUX U31 ( .IN0(n40), .IN1(\_MAC/_MULT/MULT/S[1][1][2] ), .SEL(n311), .F(n13)
         );
  IV U32 ( .A(n13), .Z(n30) );
  MUX U33 ( .IN0(n14), .IN1(n191), .SEL(n192), .F(n180) );
  IV U34 ( .A(n193), .Z(n14) );
  MUX U35 ( .IN0(n131), .IN1(n134), .SEL(n132), .F(n126) );
  XNOR U36 ( .A(n140), .B(n113), .Z(n119) );
  XOR U37 ( .A(n269), .B(n270), .Z(n263) );
  XOR U38 ( .A(n210), .B(n196), .Z(n202) );
  XOR U39 ( .A(n30), .B(n38), .Z(n31) );
  MUX U40 ( .IN0(n17), .IN1(n178), .SEL(n177), .F(n170) );
  MUX U41 ( .IN0(n120), .IN1(n118), .SEL(n119), .F(n15) );
  IV U42 ( .A(n15), .Z(n103) );
  MUX U43 ( .IN0(n16), .IN1(n61), .SEL(n62), .F(n47) );
  IV U44 ( .A(n63), .Z(n16) );
  XOR U45 ( .A(n66), .B(n53), .Z(n56) );
  XOR U46 ( .A(n251), .B(n237), .Z(n242) );
  MUX U47 ( .IN0(n186), .IN1(n188), .SEL(n187), .F(n17) );
  IV U48 ( .A(n17), .Z(n176) );
  MUX U49 ( .IN0(n18), .IN1(\_MAC/_MULT/MULT/S[1][1][3] ), .SEL(n312), .F(
        \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[4] ) );
  IV U50 ( .A(n30), .Z(n18) );
  MUX U51 ( .IN0(n19), .IN1(n180), .SEL(n181), .F(n169) );
  IV U52 ( .A(n182), .Z(n19) );
  AND U53 ( .A(n20), .B(n21), .Z(n317) );
  XOR U54 ( .A(\_MAC/_MULT/AX__[3] ), .B(\_MAC/_MULT/AX_[3] ), .Z(n21) );
  AND U55 ( .A(n20), .B(n22), .Z(n316) );
  XOR U56 ( .A(\_MAC/_MULT/AX__[4] ), .B(\_MAC/_MULT/AX_[4] ), .Z(n22) );
  AND U57 ( .A(n20), .B(n23), .Z(n315) );
  XOR U58 ( .A(\_MAC/_MULT/AX__[5] ), .B(\_MAC/_MULT/AX_[5] ), .Z(n23) );
  AND U59 ( .A(n20), .B(n24), .Z(n314) );
  XOR U60 ( .A(\_MAC/_MULT/AX__[6] ), .B(\_MAC/_MULT/AX_[6] ), .Z(n24) );
  AND U61 ( .A(n20), .B(n25), .Z(n320) );
  XOR U62 ( .A(\_MAC/_MULT/AX__[0] ), .B(\_MAC/_MULT/AX_[0] ), .Z(n25) );
  AND U63 ( .A(n20), .B(n26), .Z(n319) );
  XOR U64 ( .A(\_MAC/_MULT/AX__[1] ), .B(\_MAC/_MULT/AX_[1] ), .Z(n26) );
  AND U65 ( .A(n20), .B(n27), .Z(n318) );
  XOR U66 ( .A(\_MAC/_MULT/AX__[2] ), .B(\_MAC/_MULT/AX_[2] ), .Z(n27) );
  AND U67 ( .A(n20), .B(n28), .Z(n313) );
  XOR U68 ( .A(\_MAC/_MULT/AX__[7] ), .B(\_MAC/_MULT/AX_[7] ), .Z(n28) );
  XNOR U69 ( .A(n29), .B(g_input[7]), .Z(n20) );
  AND U70 ( .A(\_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[6] ), .B(
        \_MAC/_MULT/MULT/S[1][1][6] ), .Z(
        \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[7] ) );
  AND U71 ( .A(\_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[5] ), .B(
        \_MAC/_MULT/MULT/S[1][1][5] ), .Z(
        \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[6] ) );
  AND U72 ( .A(\_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[4] ), .B(
        \_MAC/_MULT/MULT/S[1][1][4] ), .Z(
        \_MAC/_MULT/MULT/col[1].row[0]._SHIFT_ADD/_ADD/C[5] ) );
  XOR U73 ( .A(n31), .B(n32), .Z(n312) );
  XOR U74 ( .A(n33), .B(n34), .Z(n32) );
  AND U75 ( .A(n35), .B(n36), .Z(n33) );
  NAND U76 ( .A(n37), .B(n38), .Z(n36) );
  NANDN U77 ( .B(n39), .A(n34), .Z(n35) );
  XNOR U78 ( .A(n41), .B(n40), .Z(n311) );
  XNOR U79 ( .A(n39), .B(n34), .Z(n41) );
  XNOR U80 ( .A(n38), .B(n37), .Z(n39) );
  NANDN U81 ( .B(n45), .A(n46), .Z(n37) );
  XNOR U82 ( .A(n51), .B(n50), .Z(n310) );
  XNOR U83 ( .A(n44), .B(n43), .Z(n51) );
  XOR U84 ( .A(n42), .B(n52), .Z(n43) );
  NOR U85 ( .A(n53), .B(n54), .Z(n52) );
  NAND U86 ( .A(n58), .B(n46), .Z(n49) );
  XNOR U87 ( .A(n47), .B(n59), .Z(n48) );
  ANDN U88 ( .A(n60), .B(n45), .Z(n59) );
  XNOR U89 ( .A(n65), .B(n64), .Z(n309) );
  XNOR U90 ( .A(n57), .B(n56), .Z(n65) );
  XNOR U91 ( .A(n67), .B(n68), .Z(n53) );
  AND U92 ( .A(n69), .B(n70), .Z(n68) );
  XNOR U93 ( .A(n71), .B(n67), .Z(n70) );
  XOR U94 ( .A(n72), .B(n54), .Z(n66) );
  OR U95 ( .A(n45), .B(n73), .Z(n54) );
  IV U96 ( .A(n55), .Z(n72) );
  XNOR U97 ( .A(n74), .B(n75), .Z(n55) );
  AND U98 ( .A(n76), .B(n77), .Z(n75) );
  XOR U99 ( .A(n69), .B(n78), .Z(n77) );
  XNOR U100 ( .A(n71), .B(n74), .Z(n78) );
  NANDN U101 ( .B(n73), .A(n58), .Z(n71) );
  XOR U102 ( .A(n67), .B(n79), .Z(n69) );
  NOR U103 ( .A(n45), .B(n80), .Z(n79) );
  XNOR U104 ( .A(n84), .B(n81), .Z(n83) );
  XOR U105 ( .A(n85), .B(n86), .Z(n76) );
  XNOR U106 ( .A(n87), .B(n74), .Z(n86) );
  XOR U107 ( .A(n88), .B(n89), .Z(n74) );
  AND U108 ( .A(n90), .B(n91), .Z(n89) );
  XOR U109 ( .A(n82), .B(n92), .Z(n91) );
  XNOR U110 ( .A(n84), .B(n88), .Z(n92) );
  NANDN U111 ( .B(n73), .A(n93), .Z(n84) );
  XOR U112 ( .A(n81), .B(n94), .Z(n82) );
  ANDN U113 ( .A(n58), .B(n80), .Z(n94) );
  XOR U114 ( .A(n95), .B(n96), .Z(n81) );
  AND U115 ( .A(n97), .B(n98), .Z(n96) );
  XNOR U116 ( .A(n99), .B(n95), .Z(n98) );
  XOR U117 ( .A(n100), .B(n101), .Z(n90) );
  XNOR U118 ( .A(n102), .B(n88), .Z(n101) );
  XOR U119 ( .A(n103), .B(n104), .Z(n88) );
  AND U120 ( .A(n105), .B(n106), .Z(n104) );
  XOR U121 ( .A(n97), .B(n107), .Z(n106) );
  XNOR U122 ( .A(n99), .B(n103), .Z(n107) );
  OR U123 ( .A(n108), .B(n73), .Z(n99) );
  XOR U124 ( .A(n95), .B(n109), .Z(n97) );
  ANDN U125 ( .A(n93), .B(n80), .Z(n109) );
  XOR U126 ( .A(n110), .B(n111), .Z(n95) );
  ANDN U127 ( .A(n112), .B(n113), .Z(n111) );
  XNOR U128 ( .A(n114), .B(n110), .Z(n112) );
  XOR U129 ( .A(n115), .B(n116), .Z(n105) );
  XNOR U130 ( .A(n117), .B(n103), .Z(n116) );
  XNOR U131 ( .A(n121), .B(n63), .Z(n57) );
  NAND U132 ( .A(n93), .B(n46), .Z(n63) );
  IV U133 ( .A(n62), .Z(n121) );
  XNOR U134 ( .A(n61), .B(n122), .Z(n62) );
  AND U135 ( .A(n60), .B(n58), .Z(n122) );
  XNOR U136 ( .A(n87), .B(n123), .Z(n124) );
  NANDN U137 ( .B(n108), .A(n46), .Z(n87) );
  XOR U138 ( .A(n123), .B(n125), .Z(n85) );
  AND U139 ( .A(n60), .B(n93), .Z(n125) );
  XOR U140 ( .A(n126), .B(n127), .Z(n123) );
  AND U141 ( .A(n100), .B(n128), .Z(n127) );
  XNOR U142 ( .A(n102), .B(n126), .Z(n128) );
  NAND U143 ( .A(n46), .B(n129), .Z(n102) );
  XOR U144 ( .A(n126), .B(n130), .Z(n100) );
  ANDN U145 ( .A(n60), .B(n108), .Z(n130) );
  XNOR U146 ( .A(n117), .B(n131), .Z(n132) );
  NAND U147 ( .A(n46), .B(n133), .Z(n117) );
  XOR U148 ( .A(n131), .B(n134), .Z(n115) );
  AND U149 ( .A(n129), .B(n60), .Z(n134) );
  XOR U150 ( .A(n135), .B(n136), .Z(n131) );
  ANDN U151 ( .A(n137), .B(n138), .Z(n136) );
  XNOR U152 ( .A(n139), .B(n135), .Z(n137) );
  XOR U153 ( .A(n120), .B(n119), .Z(n64) );
  XNOR U154 ( .A(n110), .B(n141), .Z(n113) );
  NOR U155 ( .A(n80), .B(n108), .Z(n141) );
  XOR U156 ( .A(n144), .B(n142), .Z(n143) );
  ANDN U157 ( .A(n129), .B(n80), .Z(n144) );
  ANDN U158 ( .A(n133), .B(n73), .Z(n145) );
  XOR U159 ( .A(n146), .B(n147), .Z(n142) );
  ANDN U160 ( .A(n148), .B(n149), .Z(n147) );
  XNOR U161 ( .A(n150), .B(n146), .Z(n148) );
  XOR U162 ( .A(n151), .B(n114), .Z(n140) );
  NANDN U163 ( .B(n73), .A(n129), .Z(n114) );
  IV U164 ( .A(n118), .Z(n151) );
  NANDN U165 ( .B(n73), .A(n152), .Z(n150) );
  XNOR U166 ( .A(n146), .B(n153), .Z(n149) );
  ANDN U167 ( .A(n133), .B(n80), .Z(n153) );
  ANDN U168 ( .A(n154), .B(n155), .Z(n146) );
  NAND U169 ( .A(n156), .B(n73), .Z(n154) );
  XOR U170 ( .A(n157), .B(e_input[1]), .Z(n73) );
  NANDN U171 ( .B(n29), .A(n158), .Z(n157) );
  XOR U172 ( .A(e_input[1]), .B(\_MAC/_MULT/X_[1] ), .Z(n158) );
  NANDN U173 ( .B(n80), .A(n152), .Z(n156) );
  XOR U174 ( .A(n159), .B(e_input[0]), .Z(n80) );
  NANDN U175 ( .B(n29), .A(n160), .Z(n159) );
  XOR U176 ( .A(e_input[0]), .B(\_MAC/_MULT/X_[0] ), .Z(n160) );
  XNOR U177 ( .A(n138), .B(n139), .Z(n120) );
  NAND U178 ( .A(n46), .B(n152), .Z(n139) );
  XNOR U179 ( .A(n135), .B(n161), .Z(n138) );
  AND U180 ( .A(n133), .B(n60), .Z(n161) );
  ANDN U181 ( .A(n162), .B(n155), .Z(n135) );
  NANDN U182 ( .B(n46), .A(n163), .Z(n162) );
  NAND U183 ( .A(n152), .B(n60), .Z(n163) );
  XNOR U184 ( .A(n164), .B(e_input[2]), .Z(n60) );
  NANDN U185 ( .B(n29), .A(n165), .Z(n164) );
  XOR U186 ( .A(e_input[2]), .B(\_MAC/_MULT/X_[2] ), .Z(n165) );
  XNOR U187 ( .A(n166), .B(e_input[3]), .Z(n46) );
  NANDN U188 ( .B(n29), .A(n167), .Z(n166) );
  XOR U189 ( .A(e_input[3]), .B(\_MAC/_MULT/X_[3] ), .Z(n167) );
  XOR U190 ( .A(n168), .B(n169), .Z(\_MAC/_MULT/MULT/S[1][1][7] ) );
  XOR U191 ( .A(n170), .B(n171), .Z(n168) );
  AND U192 ( .A(n172), .B(n173), .Z(n171) );
  NAND U193 ( .A(n174), .B(n169), .Z(n173) );
  OR U194 ( .A(n175), .B(n170), .Z(n172) );
  XNOR U195 ( .A(n175), .B(n170), .Z(\_MAC/_MULT/MULT/S[1][1][6] ) );
  XNOR U196 ( .A(n169), .B(n174), .Z(n175) );
  NANDN U197 ( .B(n45), .A(n179), .Z(n174) );
  XNOR U198 ( .A(n178), .B(n177), .Z(\_MAC/_MULT/MULT/S[1][1][5] ) );
  XOR U199 ( .A(n176), .B(n183), .Z(n177) );
  NOR U200 ( .A(n184), .B(n185), .Z(n183) );
  XNOR U201 ( .A(n181), .B(n182), .Z(n178) );
  NAND U202 ( .A(n179), .B(n58), .Z(n182) );
  XNOR U203 ( .A(n180), .B(n189), .Z(n181) );
  ANDN U204 ( .A(n190), .B(n45), .Z(n189) );
  XNOR U205 ( .A(n188), .B(n187), .Z(\_MAC/_MULT/MULT/S[1][1][4] ) );
  XOR U206 ( .A(n198), .B(n185), .Z(n194) );
  NANDN U207 ( .B(n45), .A(n199), .Z(n185) );
  IV U208 ( .A(n186), .Z(n198) );
  XOR U209 ( .A(n200), .B(n201), .Z(n186) );
  AND U210 ( .A(n202), .B(n203), .Z(n201) );
  XOR U211 ( .A(n200), .B(n204), .Z(n203) );
  XNOR U212 ( .A(n192), .B(n193), .Z(n188) );
  NAND U213 ( .A(n179), .B(n93), .Z(n193) );
  XNOR U214 ( .A(n191), .B(n205), .Z(n192) );
  AND U215 ( .A(n58), .B(n190), .Z(n205) );
  XNOR U216 ( .A(n209), .B(n206), .Z(n208) );
  XNOR U217 ( .A(n204), .B(n202), .Z(\_MAC/_MULT/MULT/S[1][1][3] ) );
  XNOR U218 ( .A(n195), .B(n211), .Z(n196) );
  ANDN U219 ( .A(n212), .B(n45), .Z(n211) );
  NAND U220 ( .A(\_MAC/_MULT/A_[7] ), .B(g_input[7]), .Z(n45) );
  XOR U221 ( .A(n213), .B(n214), .Z(n195) );
  ANDN U222 ( .A(n215), .B(n216), .Z(n214) );
  XNOR U223 ( .A(n217), .B(n213), .Z(n215) );
  XOR U224 ( .A(n218), .B(n197), .Z(n210) );
  NAND U225 ( .A(n199), .B(n58), .Z(n197) );
  IV U226 ( .A(n200), .Z(n218) );
  XOR U227 ( .A(n219), .B(n220), .Z(n200) );
  AND U228 ( .A(n221), .B(n222), .Z(n220) );
  XNOR U229 ( .A(n219), .B(n223), .Z(n222) );
  XOR U230 ( .A(n207), .B(n209), .Z(n204) );
  NANDN U231 ( .B(n108), .A(n179), .Z(n209) );
  XOR U232 ( .A(n206), .B(n224), .Z(n207) );
  AND U233 ( .A(n93), .B(n190), .Z(n224) );
  XOR U234 ( .A(n225), .B(n226), .Z(n206) );
  ANDN U235 ( .A(n227), .B(n228), .Z(n226) );
  XNOR U236 ( .A(n229), .B(n225), .Z(n227) );
  XOR U237 ( .A(n223), .B(n221), .Z(\_MAC/_MULT/MULT/S[1][1][2] ) );
  XNOR U238 ( .A(n213), .B(n231), .Z(n216) );
  AND U239 ( .A(n58), .B(n212), .Z(n231) );
  XNOR U240 ( .A(n232), .B(g_input[6]), .Z(n58) );
  NAND U241 ( .A(n233), .B(g_input[7]), .Z(n232) );
  XOR U242 ( .A(g_input[6]), .B(\_MAC/_MULT/A_[6] ), .Z(n233) );
  XOR U243 ( .A(n234), .B(n235), .Z(n213) );
  ANDN U244 ( .A(n236), .B(n237), .Z(n235) );
  XNOR U245 ( .A(n238), .B(n234), .Z(n236) );
  XOR U246 ( .A(n239), .B(n217), .Z(n230) );
  NAND U247 ( .A(n199), .B(n93), .Z(n217) );
  IV U248 ( .A(n219), .Z(n239) );
  XOR U249 ( .A(n240), .B(n241), .Z(n219) );
  AND U250 ( .A(n242), .B(n243), .Z(n241) );
  XNOR U251 ( .A(n240), .B(n244), .Z(n243) );
  NAND U252 ( .A(n179), .B(n129), .Z(n229) );
  XNOR U253 ( .A(n225), .B(n245), .Z(n228) );
  ANDN U254 ( .A(n190), .B(n108), .Z(n245) );
  XOR U255 ( .A(n246), .B(n247), .Z(n225) );
  ANDN U256 ( .A(n248), .B(n249), .Z(n247) );
  XNOR U257 ( .A(n250), .B(n246), .Z(n248) );
  XOR U258 ( .A(n244), .B(n242), .Z(\_MAC/_MULT/MULT/S[1][1][1] ) );
  XNOR U259 ( .A(n234), .B(n252), .Z(n237) );
  AND U260 ( .A(n93), .B(n212), .Z(n252) );
  XNOR U261 ( .A(n253), .B(g_input[5]), .Z(n93) );
  NAND U262 ( .A(n254), .B(g_input[7]), .Z(n253) );
  XOR U263 ( .A(g_input[5]), .B(\_MAC/_MULT/A_[5] ), .Z(n254) );
  XOR U264 ( .A(n255), .B(n256), .Z(n234) );
  ANDN U265 ( .A(n257), .B(n258), .Z(n256) );
  XNOR U266 ( .A(n259), .B(n255), .Z(n257) );
  XOR U267 ( .A(n260), .B(n238), .Z(n251) );
  NANDN U268 ( .B(n108), .A(n199), .Z(n238) );
  IV U269 ( .A(n240), .Z(n260) );
  XNOR U270 ( .A(n264), .B(n250), .Z(n244) );
  NAND U271 ( .A(n179), .B(n133), .Z(n250) );
  IV U272 ( .A(n249), .Z(n264) );
  XNOR U273 ( .A(n246), .B(n265), .Z(n249) );
  AND U274 ( .A(n129), .B(n190), .Z(n265) );
  XOR U275 ( .A(n266), .B(n267), .Z(n246) );
  ANDN U276 ( .A(n268), .B(n269), .Z(n267) );
  XNOR U277 ( .A(n270), .B(n266), .Z(n268) );
  XOR U278 ( .A(n263), .B(n262), .Z(\_MAC/_MULT/MULT/S[1][1][0] ) );
  XNOR U279 ( .A(n271), .B(n272), .Z(n262) );
  IV U280 ( .A(n258), .Z(n272) );
  XNOR U281 ( .A(n255), .B(n273), .Z(n258) );
  ANDN U282 ( .A(n212), .B(n108), .Z(n273) );
  XOR U283 ( .A(n274), .B(g_input[4]), .Z(n108) );
  NAND U284 ( .A(n275), .B(g_input[7]), .Z(n274) );
  XOR U285 ( .A(g_input[4]), .B(\_MAC/_MULT/A_[4] ), .Z(n275) );
  XOR U286 ( .A(n276), .B(n277), .Z(n255) );
  AND U287 ( .A(n278), .B(n279), .Z(n277) );
  XOR U288 ( .A(n280), .B(n276), .Z(n279) );
  AND U289 ( .A(n129), .B(n212), .Z(n280) );
  XOR U290 ( .A(n281), .B(n276), .Z(n278) );
  AND U291 ( .A(n133), .B(n199), .Z(n281) );
  XOR U292 ( .A(n282), .B(n283), .Z(n276) );
  ANDN U293 ( .A(n284), .B(n285), .Z(n283) );
  XNOR U294 ( .A(n286), .B(n282), .Z(n284) );
  XOR U295 ( .A(n287), .B(n259), .Z(n271) );
  NAND U296 ( .A(n199), .B(n129), .Z(n259) );
  XNOR U297 ( .A(n288), .B(g_input[3]), .Z(n129) );
  NAND U298 ( .A(n289), .B(g_input[7]), .Z(n288) );
  XOR U299 ( .A(g_input[3]), .B(\_MAC/_MULT/A_[3] ), .Z(n289) );
  IV U300 ( .A(n261), .Z(n287) );
  XOR U301 ( .A(n290), .B(n286), .Z(n261) );
  NAND U302 ( .A(n199), .B(n152), .Z(n286) );
  IV U303 ( .A(n285), .Z(n290) );
  XNOR U304 ( .A(n282), .B(n291), .Z(n285) );
  AND U305 ( .A(n133), .B(n212), .Z(n291) );
  ANDN U306 ( .A(n292), .B(n155), .Z(n282) );
  NANDN U307 ( .B(n199), .A(n293), .Z(n292) );
  NAND U308 ( .A(n152), .B(n212), .Z(n293) );
  XNOR U309 ( .A(n294), .B(e_input[4]), .Z(n212) );
  NANDN U310 ( .B(n29), .A(n295), .Z(n294) );
  XOR U311 ( .A(e_input[4]), .B(\_MAC/_MULT/X_[4] ), .Z(n295) );
  XNOR U312 ( .A(n296), .B(e_input[5]), .Z(n199) );
  NANDN U313 ( .B(n29), .A(n297), .Z(n296) );
  XOR U314 ( .A(e_input[5]), .B(\_MAC/_MULT/X_[5] ), .Z(n297) );
  NAND U315 ( .A(n179), .B(n152), .Z(n270) );
  XNOR U316 ( .A(n266), .B(n298), .Z(n269) );
  AND U317 ( .A(n133), .B(n190), .Z(n298) );
  XNOR U318 ( .A(n299), .B(g_input[2]), .Z(n133) );
  NAND U319 ( .A(n300), .B(g_input[7]), .Z(n299) );
  XOR U320 ( .A(g_input[2]), .B(\_MAC/_MULT/A_[2] ), .Z(n300) );
  ANDN U321 ( .A(n301), .B(n155), .Z(n266) );
  XOR U322 ( .A(n302), .B(g_input[0]), .Z(n155) );
  NAND U323 ( .A(n303), .B(g_input[7]), .Z(n302) );
  XOR U324 ( .A(g_input[0]), .B(\_MAC/_MULT/A_[0] ), .Z(n303) );
  NANDN U325 ( .B(n179), .A(n304), .Z(n301) );
  NAND U326 ( .A(n152), .B(n190), .Z(n304) );
  XNOR U327 ( .A(n305), .B(e_input[6]), .Z(n190) );
  NANDN U328 ( .B(n29), .A(n306), .Z(n305) );
  XOR U329 ( .A(e_input[6]), .B(\_MAC/_MULT/X_[6] ), .Z(n306) );
  IV U330 ( .A(e_input[7]), .Z(n29) );
  XNOR U331 ( .A(n307), .B(g_input[1]), .Z(n152) );
  NAND U332 ( .A(n308), .B(g_input[7]), .Z(n307) );
  XOR U333 ( .A(g_input[1]), .B(\_MAC/_MULT/A_[1] ), .Z(n308) );
  AND U334 ( .A(\_MAC/_MULT/X_[7] ), .B(e_input[7]), .Z(n179) );
endmodule


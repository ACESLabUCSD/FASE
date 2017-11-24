
module MAC_TG_N8 ( clk, rst, g_input, e_input, o );
  input [7:0] g_input;
  input [7:0] e_input;
  output [7:0] o;
  input clk, rst;
  wire   \_MAC/_MULT/X__[0] , \_MAC/_MULT/A__[0] , n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349;
  wire   [7:0] o_reg;
  assign \_MAC/_MULT/X__[0]  = e_input[0];
  assign \_MAC/_MULT/A__[0]  = g_input[0];

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
  MUX U11 ( .IN0(g_input[1]), .IN1(n9), .SEL(g_input[7]), .F(n280) );
  IV U12 ( .A(n340), .Z(n9) );
  MUX U13 ( .IN0(g_input[2]), .IN1(n335), .SEL(g_input[7]), .F(n257) );
  MUX U14 ( .IN0(n297), .IN1(n307), .SEL(n299), .F(n154) );
  MUX U15 ( .IN0(n205), .IN1(n219), .SEL(n207), .F(n181) );
  NANDN U16 ( .B(n91), .A(n120), .Z(n119) );
  MUX U17 ( .IN0(n10), .IN1(n149), .SEL(n150), .F(n110) );
  IV U18 ( .A(n151), .Z(n10) );
  XNOR U19 ( .A(n136), .B(n108), .Z(n109) );
  MUX U20 ( .IN0(n80), .IN1(n11), .SEL(n32), .F(n75) );
  IV U21 ( .A(n57), .Z(n11) );
  MUX U22 ( .IN0(n241), .IN1(n258), .SEL(n243), .F(n220) );
  MUX U23 ( .IN0(n235), .IN1(n250), .SEL(n237), .F(n214) );
  XOR U24 ( .A(n301), .B(n300), .Z(n306) );
  MUX U25 ( .IN0(n12), .IN1(n92), .SEL(n93), .F(n62) );
  IV U26 ( .A(n94), .Z(n12) );
  MUX U27 ( .IN0(n13), .IN1(n194), .SEL(n189), .F(n148) );
  IV U28 ( .A(n188), .Z(n13) );
  MUX U29 ( .IN0(n107), .IN1(n83), .SEL(n32), .F(n14) );
  IV U30 ( .A(n14), .Z(n102) );
  MUX U31 ( .IN0(e_input[1]), .IN1(n15), .SEL(e_input[7]), .F(n198) );
  IV U32 ( .A(n290), .Z(n15) );
  MUX U33 ( .IN0(e_input[3]), .IN1(n285), .SEL(e_input[7]), .F(n146) );
  XNOR U34 ( .A(n113), .B(n92), .Z(n93) );
  MUX U35 ( .IN0(n16), .IN1(n186), .SEL(n176), .F(n149) );
  IV U36 ( .A(n175), .Z(n16) );
  MUX U37 ( .IN0(o_reg[5]), .IN1(n46), .SEL(n47), .F(n26) );
  MUX U38 ( .IN0(n136), .IN1(n17), .SEL(n32), .F(n133) );
  IV U39 ( .A(n109), .Z(n17) );
  MUX U40 ( .IN0(e_input[2]), .IN1(n284), .SEL(e_input[7]), .F(n180) );
  XOR U41 ( .A(n194), .B(n195), .Z(n189) );
  XOR U42 ( .A(n114), .B(n126), .Z(n152) );
  MUX U43 ( .IN0(o_reg[6]), .IN1(n26), .SEL(n27), .F(n23) );
  XOR U44 ( .A(n172), .B(n134), .Z(n170) );
  MUX U45 ( .IN0(n18), .IN1(n264), .SEL(n193), .F(n245) );
  IV U46 ( .A(n192), .Z(n18) );
  MUX U47 ( .IN0(n214), .IN1(n230), .SEL(n216), .F(n203) );
  MUX U48 ( .IN0(e_input[6]), .IN1(n343), .SEL(e_input[7]), .F(n69) );
  NANDN U49 ( .B(n143), .A(n179), .Z(n178) );
  XOR U50 ( .A(n159), .B(n158), .Z(n291) );
  MUX U51 ( .IN0(n19), .IN1(n110), .SEL(n111), .F(n85) );
  IV U52 ( .A(n112), .Z(n19) );
  MUX U53 ( .IN0(o_reg[1]), .IN1(n134), .SEL(n135), .F(n20) );
  IV U54 ( .A(n20), .Z(n103) );
  MUX U55 ( .IN0(o_reg[7]), .IN1(n23), .SEL(n24), .F(n22) );
  XOR U56 ( .A(n21), .B(n22), .Z(o[7]) );
  XNOR U57 ( .A(o_reg[7]), .B(n25), .Z(n21) );
  XNOR U58 ( .A(o_reg[7]), .B(n24), .Z(o[6]) );
  XOR U59 ( .A(n23), .B(n25), .Z(n24) );
  XNOR U60 ( .A(n27), .B(o_reg[6]), .Z(o[5]) );
  XNOR U61 ( .A(n28), .B(n29), .Z(n27) );
  ANDN U62 ( .A(n25), .B(n30), .Z(n29) );
  NANDN U63 ( .B(n31), .A(n32), .Z(n25) );
  ANDN U64 ( .A(n33), .B(n30), .Z(n31) );
  NAND U65 ( .A(n34), .B(n35), .Z(n30) );
  OR U66 ( .A(n36), .B(n37), .Z(n35) );
  AND U67 ( .A(n38), .B(n39), .Z(n34) );
  NANDN U68 ( .B(n40), .A(n41), .Z(n39) );
  OR U69 ( .A(n42), .B(n43), .Z(n38) );
  ANDN U70 ( .A(n44), .B(n45), .Z(n33) );
  IV U71 ( .A(n26), .Z(n28) );
  XNOR U72 ( .A(n47), .B(o_reg[5]), .Z(o[4]) );
  XNOR U73 ( .A(n48), .B(n46), .Z(n47) );
  XOR U74 ( .A(n49), .B(n50), .Z(n46) );
  ANDN U75 ( .A(n51), .B(n52), .Z(n50) );
  XOR U76 ( .A(o_reg[4]), .B(n49), .Z(n51) );
  XNOR U77 ( .A(n53), .B(n54), .Z(n48) );
  AND U78 ( .A(n32), .B(n55), .Z(n54) );
  XOR U79 ( .A(n44), .B(n53), .Z(n55) );
  XOR U80 ( .A(n53), .B(n45), .Z(n44) );
  NANDN U81 ( .B(n56), .A(n57), .Z(n45) );
  XNOR U82 ( .A(n43), .B(n42), .Z(n53) );
  NANDN U83 ( .B(n58), .A(n59), .Z(n42) );
  AND U84 ( .A(n60), .B(n61), .Z(n43) );
  XNOR U85 ( .A(n62), .B(n63), .Z(n61) );
  ANDN U86 ( .A(n64), .B(n65), .Z(n63) );
  XNOR U87 ( .A(n62), .B(n66), .Z(n64) );
  XNOR U88 ( .A(n36), .B(n67), .Z(n60) );
  AND U89 ( .A(n37), .B(n68), .Z(n67) );
  NANDN U90 ( .B(n40), .A(n69), .Z(n68) );
  NANDN U91 ( .B(n70), .A(n71), .Z(n37) );
  OR U92 ( .A(n72), .B(n73), .Z(n71) );
  NAND U93 ( .A(n41), .B(n74), .Z(n36) );
  XNOR U94 ( .A(n52), .B(o_reg[4]), .Z(o[3]) );
  XNOR U95 ( .A(n75), .B(n49), .Z(n52) );
  XOR U96 ( .A(n76), .B(n77), .Z(n49) );
  ANDN U97 ( .A(n78), .B(n79), .Z(n77) );
  XOR U98 ( .A(o_reg[3]), .B(n76), .Z(n78) );
  XOR U99 ( .A(n81), .B(n56), .Z(n57) );
  NANDN U100 ( .B(n82), .A(n83), .Z(n56) );
  IV U101 ( .A(n80), .Z(n81) );
  XNOR U102 ( .A(n59), .B(n58), .Z(n80) );
  NAND U103 ( .A(n84), .B(n85), .Z(n58) );
  XOR U104 ( .A(n66), .B(n65), .Z(n59) );
  XOR U105 ( .A(n62), .B(n86), .Z(n65) );
  AND U106 ( .A(n87), .B(n88), .Z(n86) );
  NANDN U107 ( .B(n40), .A(n89), .Z(n88) );
  NANDN U108 ( .B(n90), .A(n91), .Z(n87) );
  XOR U109 ( .A(n73), .B(n72), .Z(n66) );
  ANDN U110 ( .A(n95), .B(n96), .Z(n72) );
  XOR U111 ( .A(n70), .B(n97), .Z(n73) );
  AND U112 ( .A(n74), .B(n69), .Z(n97) );
  NANDN U113 ( .B(n98), .A(n99), .Z(n70) );
  OR U114 ( .A(n100), .B(n101), .Z(n99) );
  XNOR U115 ( .A(n79), .B(o_reg[3]), .Z(o[2]) );
  XNOR U116 ( .A(n102), .B(n76), .Z(n79) );
  XNOR U117 ( .A(n103), .B(n104), .Z(n76) );
  ANDN U118 ( .A(n105), .B(n106), .Z(n104) );
  XNOR U119 ( .A(o_reg[2]), .B(n103), .Z(n105) );
  XOR U120 ( .A(n107), .B(n82), .Z(n83) );
  NANDN U121 ( .B(n108), .A(n109), .Z(n82) );
  XNOR U122 ( .A(n84), .B(n85), .Z(n107) );
  XOR U123 ( .A(n94), .B(n93), .Z(n84) );
  XOR U124 ( .A(n114), .B(n115), .Z(n92) );
  AND U125 ( .A(n116), .B(n117), .Z(n115) );
  XNOR U126 ( .A(n114), .B(n118), .Z(n117) );
  XNOR U127 ( .A(n119), .B(n90), .Z(n113) );
  NAND U128 ( .A(n89), .B(n74), .Z(n90) );
  NANDN U129 ( .B(n40), .A(n121), .Z(n120) );
  XOR U130 ( .A(n122), .B(n123), .Z(n91) );
  AND U131 ( .A(n124), .B(n125), .Z(n123) );
  XNOR U132 ( .A(n126), .B(n122), .Z(n125) );
  XOR U133 ( .A(n101), .B(n100), .Z(n94) );
  ANDN U134 ( .A(n127), .B(n96), .Z(n100) );
  XOR U135 ( .A(n98), .B(n128), .Z(n101) );
  AND U136 ( .A(n69), .B(n95), .Z(n128) );
  NANDN U137 ( .B(n129), .A(n130), .Z(n98) );
  NANDN U138 ( .B(n131), .A(n132), .Z(n130) );
  XNOR U139 ( .A(n106), .B(o_reg[2]), .Z(o[1]) );
  XOR U140 ( .A(n133), .B(n103), .Z(n106) );
  NANDN U141 ( .B(n137), .A(n138), .Z(n108) );
  XOR U142 ( .A(n112), .B(n111), .Z(n136) );
  XOR U143 ( .A(n110), .B(n139), .Z(n111) );
  AND U144 ( .A(n140), .B(n141), .Z(n139) );
  NANDN U145 ( .B(n142), .A(n143), .Z(n141) );
  AND U146 ( .A(n144), .B(n145), .Z(n140) );
  NANDN U147 ( .B(n40), .A(n146), .Z(n145) );
  NAND U148 ( .A(n147), .B(n148), .Z(n144) );
  XOR U149 ( .A(n118), .B(n116), .Z(n112) );
  XNOR U150 ( .A(n152), .B(n124), .Z(n116) );
  XOR U151 ( .A(n122), .B(n153), .Z(n124) );
  AND U152 ( .A(n74), .B(n121), .Z(n153) );
  XOR U153 ( .A(n154), .B(n155), .Z(n122) );
  AND U154 ( .A(n156), .B(n157), .Z(n155) );
  XNOR U155 ( .A(n158), .B(n154), .Z(n157) );
  NAND U156 ( .A(n95), .B(n89), .Z(n126) );
  XOR U157 ( .A(n159), .B(n160), .Z(n114) );
  AND U158 ( .A(n161), .B(n162), .Z(n160) );
  XNOR U159 ( .A(n159), .B(n163), .Z(n162) );
  XNOR U160 ( .A(n131), .B(n132), .Z(n118) );
  OR U161 ( .A(n164), .B(n96), .Z(n132) );
  XOR U162 ( .A(n129), .B(n165), .Z(n131) );
  AND U163 ( .A(n69), .B(n127), .Z(n165) );
  NANDN U164 ( .B(n166), .A(n167), .Z(n129) );
  NANDN U165 ( .B(n168), .A(n169), .Z(n167) );
  XNOR U166 ( .A(n135), .B(o_reg[1]), .Z(o[0]) );
  XOR U167 ( .A(n170), .B(n171), .Z(n135) );
  ANDN U168 ( .A(o_reg[0]), .B(n138), .Z(n134) );
  NAND U169 ( .A(n173), .B(n32), .Z(n172) );
  XOR U170 ( .A(e_input[7]), .B(g_input[7]), .Z(n32) );
  XNOR U171 ( .A(n137), .B(n174), .Z(n173) );
  XOR U172 ( .A(n174), .B(n138), .Z(n137) );
  XNOR U173 ( .A(n175), .B(n176), .Z(n138) );
  IV U174 ( .A(n171), .Z(n174) );
  XOR U175 ( .A(n151), .B(n150), .Z(n171) );
  XOR U176 ( .A(n177), .B(n147), .Z(n150) );
  XNOR U177 ( .A(n178), .B(n142), .Z(n147) );
  NAND U178 ( .A(n146), .B(n74), .Z(n142) );
  NANDN U179 ( .B(n40), .A(n180), .Z(n179) );
  XOR U180 ( .A(n181), .B(n182), .Z(n143) );
  ANDN U181 ( .A(n183), .B(n184), .Z(n182) );
  XNOR U182 ( .A(n185), .B(n181), .Z(n183) );
  XNOR U183 ( .A(n148), .B(n149), .Z(n177) );
  XOR U184 ( .A(n187), .B(n188), .Z(n176) );
  XNOR U185 ( .A(n189), .B(n186), .Z(n187) );
  XOR U186 ( .A(n190), .B(n191), .Z(n175) );
  XOR U187 ( .A(n192), .B(n193), .Z(n186) );
  AND U188 ( .A(n196), .B(n197), .Z(n195) );
  NANDN U189 ( .B(n40), .A(n198), .Z(n197) );
  NAND U190 ( .A(n199), .B(n200), .Z(n40) );
  AND U191 ( .A(n201), .B(g_input[7]), .Z(n199) );
  NANDN U192 ( .B(n202), .A(n203), .Z(n196) );
  XNOR U193 ( .A(n184), .B(n185), .Z(n188) );
  NAND U194 ( .A(n95), .B(n146), .Z(n185) );
  XNOR U195 ( .A(n181), .B(n204), .Z(n184) );
  AND U196 ( .A(n180), .B(n74), .Z(n204) );
  XNOR U197 ( .A(n208), .B(n205), .Z(n207) );
  XOR U198 ( .A(n209), .B(n210), .Z(n194) );
  AND U199 ( .A(n211), .B(n212), .Z(n210) );
  XOR U200 ( .A(n203), .B(n213), .Z(n212) );
  XNOR U201 ( .A(n202), .B(n209), .Z(n213) );
  NAND U202 ( .A(n74), .B(n198), .Z(n202) );
  XNOR U203 ( .A(n217), .B(n214), .Z(n216) );
  XOR U204 ( .A(n206), .B(n218), .Z(n211) );
  XNOR U205 ( .A(n208), .B(n209), .Z(n218) );
  NAND U206 ( .A(n127), .B(n146), .Z(n208) );
  XOR U207 ( .A(n205), .B(n219), .Z(n206) );
  AND U208 ( .A(n180), .B(n95), .Z(n219) );
  XOR U209 ( .A(n220), .B(n221), .Z(n205) );
  AND U210 ( .A(n222), .B(n223), .Z(n221) );
  XNOR U211 ( .A(n224), .B(n220), .Z(n223) );
  XOR U212 ( .A(n225), .B(n226), .Z(n209) );
  AND U213 ( .A(n227), .B(n228), .Z(n226) );
  XOR U214 ( .A(n215), .B(n229), .Z(n228) );
  XNOR U215 ( .A(n217), .B(n225), .Z(n229) );
  NAND U216 ( .A(n95), .B(n198), .Z(n217) );
  XOR U217 ( .A(n214), .B(n230), .Z(n215) );
  AND U218 ( .A(n74), .B(\_MAC/_MULT/X__[0] ), .Z(n230) );
  XNOR U219 ( .A(n231), .B(g_input[6]), .Z(n74) );
  NAND U220 ( .A(n232), .B(g_input[7]), .Z(n231) );
  XNOR U221 ( .A(n200), .B(g_input[6]), .Z(n232) );
  XOR U222 ( .A(n201), .B(g_input[6]), .Z(n200) );
  NOR U223 ( .A(n233), .B(n234), .Z(n201) );
  XNOR U224 ( .A(n238), .B(n235), .Z(n237) );
  XOR U225 ( .A(n222), .B(n239), .Z(n227) );
  XNOR U226 ( .A(n224), .B(n225), .Z(n239) );
  NANDN U227 ( .B(n164), .A(n146), .Z(n224) );
  XOR U228 ( .A(n220), .B(n240), .Z(n222) );
  AND U229 ( .A(n180), .B(n127), .Z(n240) );
  XNOR U230 ( .A(n244), .B(n241), .Z(n243) );
  XOR U231 ( .A(n245), .B(n246), .Z(n225) );
  AND U232 ( .A(n247), .B(n248), .Z(n246) );
  XOR U233 ( .A(n236), .B(n249), .Z(n248) );
  XNOR U234 ( .A(n238), .B(n245), .Z(n249) );
  NAND U235 ( .A(n127), .B(n198), .Z(n238) );
  XOR U236 ( .A(n235), .B(n250), .Z(n236) );
  AND U237 ( .A(\_MAC/_MULT/X__[0] ), .B(n95), .Z(n250) );
  XOR U238 ( .A(n251), .B(n252), .Z(n235) );
  AND U239 ( .A(n253), .B(n254), .Z(n252) );
  XNOR U240 ( .A(n255), .B(n251), .Z(n253) );
  XOR U241 ( .A(n242), .B(n256), .Z(n247) );
  XNOR U242 ( .A(n244), .B(n245), .Z(n256) );
  NAND U243 ( .A(n146), .B(n257), .Z(n244) );
  XOR U244 ( .A(n241), .B(n258), .Z(n242) );
  ANDN U245 ( .A(n180), .B(n164), .Z(n258) );
  XOR U246 ( .A(n259), .B(n260), .Z(n241) );
  ANDN U247 ( .A(n261), .B(n262), .Z(n260) );
  XNOR U248 ( .A(n263), .B(n259), .Z(n261) );
  XNOR U249 ( .A(n265), .B(n266), .Z(n193) );
  IV U250 ( .A(n254), .Z(n266) );
  XOR U251 ( .A(n251), .B(n267), .Z(n254) );
  AND U252 ( .A(\_MAC/_MULT/X__[0] ), .B(n127), .Z(n267) );
  XOR U253 ( .A(n268), .B(n269), .Z(n251) );
  AND U254 ( .A(n270), .B(n271), .Z(n269) );
  XOR U255 ( .A(n272), .B(n268), .Z(n271) );
  ANDN U256 ( .A(\_MAC/_MULT/X__[0] ), .B(n164), .Z(n272) );
  XOR U257 ( .A(n273), .B(n268), .Z(n270) );
  AND U258 ( .A(n198), .B(n257), .Z(n273) );
  XOR U259 ( .A(n274), .B(n275), .Z(n268) );
  AND U260 ( .A(n276), .B(n277), .Z(n275) );
  XNOR U261 ( .A(n278), .B(n274), .Z(n276) );
  XNOR U262 ( .A(n279), .B(n255), .Z(n265) );
  NANDN U263 ( .B(n164), .A(n198), .Z(n255) );
  IV U264 ( .A(n264), .Z(n279) );
  XNOR U265 ( .A(n262), .B(n263), .Z(n192) );
  NAND U266 ( .A(n146), .B(n280), .Z(n263) );
  XNOR U267 ( .A(n259), .B(n281), .Z(n262) );
  AND U268 ( .A(n257), .B(n180), .Z(n281) );
  AND U269 ( .A(n282), .B(\_MAC/_MULT/A__[0] ), .Z(n259) );
  NANDN U270 ( .B(n146), .A(n283), .Z(n282) );
  NAND U271 ( .A(n280), .B(n180), .Z(n283) );
  XOR U272 ( .A(n286), .B(n278), .Z(n264) );
  NAND U273 ( .A(n198), .B(n280), .Z(n278) );
  IV U274 ( .A(n277), .Z(n286) );
  XOR U275 ( .A(n274), .B(n287), .Z(n277) );
  AND U276 ( .A(n257), .B(\_MAC/_MULT/X__[0] ), .Z(n287) );
  AND U277 ( .A(n288), .B(\_MAC/_MULT/A__[0] ), .Z(n274) );
  NANDN U278 ( .B(n198), .A(n289), .Z(n288) );
  NAND U279 ( .A(n280), .B(\_MAC/_MULT/X__[0] ), .Z(n289) );
  XOR U280 ( .A(n163), .B(n161), .Z(n151) );
  XNOR U281 ( .A(n291), .B(n156), .Z(n161) );
  XOR U282 ( .A(n154), .B(n292), .Z(n156) );
  AND U283 ( .A(n121), .B(n95), .Z(n292) );
  XNOR U284 ( .A(n293), .B(g_input[5]), .Z(n95) );
  NAND U285 ( .A(n294), .B(g_input[7]), .Z(n293) );
  XOR U286 ( .A(n233), .B(g_input[5]), .Z(n294) );
  XOR U287 ( .A(n234), .B(g_input[5]), .Z(n233) );
  OR U288 ( .A(n295), .B(n296), .Z(n234) );
  XNOR U289 ( .A(n300), .B(n297), .Z(n299) );
  NAND U290 ( .A(n127), .B(n89), .Z(n158) );
  XOR U291 ( .A(n301), .B(n302), .Z(n159) );
  AND U292 ( .A(n191), .B(n303), .Z(n302) );
  XNOR U293 ( .A(n301), .B(n190), .Z(n303) );
  XNOR U294 ( .A(n304), .B(n305), .Z(n190) );
  XNOR U295 ( .A(n306), .B(n298), .Z(n191) );
  XOR U296 ( .A(n297), .B(n307), .Z(n298) );
  AND U297 ( .A(n121), .B(n127), .Z(n307) );
  XNOR U298 ( .A(n308), .B(g_input[4]), .Z(n127) );
  NAND U299 ( .A(n309), .B(g_input[7]), .Z(n308) );
  XOR U300 ( .A(n295), .B(g_input[4]), .Z(n309) );
  XOR U301 ( .A(n296), .B(g_input[4]), .Z(n295) );
  OR U302 ( .A(n310), .B(n311), .Z(n296) );
  XOR U303 ( .A(n312), .B(n313), .Z(n297) );
  AND U304 ( .A(n314), .B(n315), .Z(n313) );
  XOR U305 ( .A(n316), .B(n312), .Z(n315) );
  ANDN U306 ( .A(n121), .B(n164), .Z(n316) );
  XOR U307 ( .A(n317), .B(n312), .Z(n314) );
  AND U308 ( .A(n257), .B(n89), .Z(n317) );
  XOR U309 ( .A(n318), .B(n319), .Z(n312) );
  AND U310 ( .A(n320), .B(n321), .Z(n319) );
  XNOR U311 ( .A(n322), .B(n318), .Z(n321) );
  NANDN U312 ( .B(n164), .A(n89), .Z(n300) );
  XNOR U313 ( .A(n320), .B(n322), .Z(n301) );
  NAND U314 ( .A(n89), .B(n280), .Z(n322) );
  XOR U315 ( .A(n318), .B(n323), .Z(n320) );
  AND U316 ( .A(n257), .B(n121), .Z(n323) );
  AND U317 ( .A(n324), .B(\_MAC/_MULT/A__[0] ), .Z(n318) );
  NANDN U318 ( .B(n89), .A(n325), .Z(n324) );
  NAND U319 ( .A(n280), .B(n121), .Z(n325) );
  XNOR U320 ( .A(n326), .B(e_input[4]), .Z(n121) );
  NAND U321 ( .A(n327), .B(e_input[7]), .Z(n326) );
  XOR U322 ( .A(n328), .B(e_input[4]), .Z(n327) );
  XNOR U323 ( .A(n329), .B(e_input[5]), .Z(n89) );
  NAND U324 ( .A(n330), .B(e_input[7]), .Z(n329) );
  XOR U325 ( .A(n331), .B(e_input[5]), .Z(n330) );
  XNOR U326 ( .A(n168), .B(n169), .Z(n163) );
  NANDN U327 ( .B(n96), .A(n257), .Z(n169) );
  XOR U328 ( .A(n166), .B(n332), .Z(n168) );
  ANDN U329 ( .A(n69), .B(n164), .Z(n332) );
  XOR U330 ( .A(n333), .B(g_input[3]), .Z(n164) );
  NAND U331 ( .A(n334), .B(g_input[7]), .Z(n333) );
  XOR U332 ( .A(n310), .B(g_input[3]), .Z(n334) );
  XOR U333 ( .A(n311), .B(g_input[3]), .Z(n310) );
  OR U334 ( .A(n335), .B(n336), .Z(n311) );
  NANDN U335 ( .B(n337), .A(n338), .Z(n166) );
  NANDN U336 ( .B(n304), .A(n305), .Z(n338) );
  NANDN U337 ( .B(n96), .A(n280), .Z(n305) );
  XOR U338 ( .A(n337), .B(n339), .Z(n304) );
  AND U339 ( .A(n257), .B(n69), .Z(n339) );
  XOR U340 ( .A(n336), .B(g_input[2]), .Z(n335) );
  NANDN U341 ( .B(\_MAC/_MULT/A__[0] ), .A(n340), .Z(n336) );
  NAND U342 ( .A(n341), .B(\_MAC/_MULT/A__[0] ), .Z(n337) );
  NAND U343 ( .A(n96), .B(n342), .Z(n341) );
  NAND U344 ( .A(n280), .B(n69), .Z(n342) );
  XNOR U345 ( .A(\_MAC/_MULT/A__[0] ), .B(g_input[1]), .Z(n340) );
  IV U346 ( .A(n41), .Z(n96) );
  ANDN U347 ( .A(n344), .B(n343), .Z(n41) );
  XOR U348 ( .A(n345), .B(e_input[6]), .Z(n343) );
  ANDN U349 ( .A(e_input[7]), .B(n345), .Z(n344) );
  OR U350 ( .A(n331), .B(n346), .Z(n345) );
  XOR U351 ( .A(n346), .B(e_input[5]), .Z(n331) );
  OR U352 ( .A(n328), .B(n347), .Z(n346) );
  XOR U353 ( .A(n347), .B(e_input[4]), .Z(n328) );
  OR U354 ( .A(n285), .B(n348), .Z(n347) );
  XOR U355 ( .A(n348), .B(e_input[3]), .Z(n285) );
  OR U356 ( .A(n284), .B(n349), .Z(n348) );
  XOR U357 ( .A(n349), .B(e_input[2]), .Z(n284) );
  NANDN U358 ( .B(\_MAC/_MULT/X__[0] ), .A(n290), .Z(n349) );
  XNOR U359 ( .A(\_MAC/_MULT/X__[0] ), .B(e_input[1]), .Z(n290) );
endmodule


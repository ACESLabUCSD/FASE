
module MAC_TG_N8 ( clk, rst, g_input, e_input, o );
  input [7:0] g_input;
  input [7:0] e_input;
  output [7:0] o;
  input clk, rst;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292;
  wire   [7:0] o_reg;

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
  MUX U11 ( .IN0(n254), .IN1(n259), .SEL(n255), .F(n250) );
  MUX U12 ( .IN0(n264), .IN1(n9), .SEL(n265), .F(n130) );
  IV U13 ( .A(n266), .Z(n9) );
  MUX U14 ( .IN0(n190), .IN1(n200), .SEL(n192), .F(n172) );
  MUX U15 ( .IN0(n84), .IN1(n106), .SEL(n85), .F(n60) );
  MUX U16 ( .IN0(n168), .IN1(n10), .SEL(n169), .F(n152) );
  IV U17 ( .A(n170), .Z(n10) );
  MUX U18 ( .IN0(n39), .IN1(n11), .SEL(n40), .F(n26) );
  IV U19 ( .A(n41), .Z(n11) );
  MUX U20 ( .IN0(o_reg[3]), .IN1(n88), .SEL(n89), .F(n66) );
  MUX U21 ( .IN0(n238), .IN1(n245), .SEL(n239), .F(n223) );
  MUX U22 ( .IN0(n250), .IN1(n253), .SEL(n251), .F(n233) );
  MUX U23 ( .IN0(n107), .IN1(n139), .SEL(n108), .F(n84) );
  MUX U24 ( .IN0(n130), .IN1(n12), .SEL(n131), .F(n97) );
  IV U25 ( .A(n132), .Z(n12) );
  MUX U26 ( .IN0(n164), .IN1(n182), .SEL(n165), .F(n148) );
  MUX U27 ( .IN0(n268), .IN1(n13), .SEL(n180), .F(n134) );
  IV U28 ( .A(n179), .Z(n13) );
  XNOR U29 ( .A(n189), .B(n172), .Z(n175) );
  MUX U30 ( .IN0(n56), .IN1(n14), .SEL(n57), .F(n39) );
  IV U31 ( .A(n58), .Z(n14) );
  MUX U32 ( .IN0(n15), .IN1(n90), .SEL(n91), .F(n65) );
  IV U33 ( .A(n92), .Z(n15) );
  MUX U34 ( .IN0(n17), .IN1(o_reg[2]), .SEL(n112), .F(n88) );
  MUX U35 ( .IN0(o_reg[6]), .IN1(n36), .SEL(n37), .F(n21) );
  MUX U36 ( .IN0(n233), .IN1(n16), .SEL(n234), .F(n217) );
  IV U37 ( .A(n235), .Z(n16) );
  MUX U38 ( .IN0(n207), .IN1(n222), .SEL(n209), .F(n183) );
  XNOR U39 ( .A(n256), .B(n257), .Z(n242) );
  MUX U40 ( .IN0(n60), .IN1(n83), .SEL(n61), .F(n42) );
  XNOR U41 ( .A(n71), .B(n54), .Z(n57) );
  XNOR U42 ( .A(n262), .B(n131), .Z(n137) );
  XNOR U43 ( .A(n90), .B(n120), .Z(n113) );
  MUX U44 ( .IN0(n145), .IN1(o_reg[1]), .SEL(n146), .F(n17) );
  IV U45 ( .A(n17), .Z(n111) );
  XOR U46 ( .A(n36), .B(n29), .Z(n38) );
  MUX U47 ( .IN0(n277), .IN1(n285), .SEL(n278), .F(n271) );
  MUX U48 ( .IN0(n217), .IN1(n232), .SEL(n219), .F(n201) );
  MUX U49 ( .IN0(n183), .IN1(n206), .SEL(n185), .F(n164) );
  XNOR U50 ( .A(n240), .B(n241), .Z(n187) );
  XNOR U51 ( .A(n128), .B(n98), .Z(n104) );
  MUX U52 ( .IN0(n157), .IN1(n171), .SEL(n159), .F(n116) );
  XOR U53 ( .A(n179), .B(n180), .Z(n170) );
  MUX U54 ( .IN0(n42), .IN1(n59), .SEL(n43), .F(n34) );
  XOR U55 ( .A(n138), .B(n137), .Z(n156) );
  XOR U56 ( .A(n48), .B(n46), .Z(n52) );
  MUX U57 ( .IN0(n223), .IN1(n237), .SEL(n225), .F(n207) );
  MUX U58 ( .IN0(n97), .IN1(n18), .SEL(n98), .F(n72) );
  IV U59 ( .A(n99), .Z(n18) );
  MUX U60 ( .IN0(n19), .IN1(n289), .SEL(n282), .F(n140) );
  IV U61 ( .A(n283), .Z(n19) );
  MUX U62 ( .IN0(n201), .IN1(n216), .SEL(n203), .F(n190) );
  XNOR U63 ( .A(n248), .B(n234), .Z(n188) );
  XNOR U64 ( .A(n269), .B(n265), .Z(n180) );
  MUX U65 ( .IN0(n174), .IN1(n20), .SEL(n175), .F(n157) );
  IV U66 ( .A(n176), .Z(n20) );
  MUX U67 ( .IN0(n148), .IN1(n163), .SEL(n149), .F(n120) );
  XOR U68 ( .A(n41), .B(n40), .Z(n47) );
  XOR U69 ( .A(n58), .B(n57), .Z(n64) );
  XOR U70 ( .A(n82), .B(n81), .Z(n92) );
  XOR U71 ( .A(n105), .B(n104), .Z(n126) );
  XNOR U72 ( .A(n161), .B(n155), .Z(n146) );
  MUX U73 ( .IN0(o_reg[7]), .IN1(n21), .SEL(n22), .F(o[7]) );
  XNOR U74 ( .A(n22), .B(o_reg[7]), .Z(o[6]) );
  XNOR U75 ( .A(n23), .B(n24), .Z(n22) );
  XOR U76 ( .A(n25), .B(n26), .Z(n24) );
  AND U77 ( .A(n27), .B(n28), .Z(n25) );
  OR U78 ( .A(n29), .B(n30), .Z(n28) );
  AND U79 ( .A(n31), .B(n32), .Z(n27) );
  NAND U80 ( .A(n33), .B(n34), .Z(n32) );
  NANDN U81 ( .B(n35), .A(n26), .Z(n31) );
  XNOR U82 ( .A(n21), .B(n34), .Z(n23) );
  XNOR U83 ( .A(o_reg[6]), .B(n37), .Z(o[5]) );
  XNOR U84 ( .A(n38), .B(n30), .Z(n37) );
  XNOR U85 ( .A(n35), .B(n26), .Z(n30) );
  XNOR U86 ( .A(n34), .B(n33), .Z(n35) );
  NAND U87 ( .A(e_input[7]), .B(g_input[7]), .Z(n33) );
  XNOR U88 ( .A(n45), .B(n42), .Z(n43) );
  OR U89 ( .A(n46), .B(n47), .Z(n29) );
  XOR U90 ( .A(n48), .B(n49), .Z(n36) );
  AND U91 ( .A(n50), .B(n51), .Z(n49) );
  XOR U92 ( .A(o_reg[5]), .B(n48), .Z(n51) );
  XOR U93 ( .A(o_reg[5]), .B(n50), .Z(o[4]) );
  XOR U94 ( .A(n52), .B(n47), .Z(n50) );
  XOR U95 ( .A(n39), .B(n53), .Z(n40) );
  ANDN U96 ( .A(n54), .B(n55), .Z(n53) );
  XNOR U97 ( .A(n44), .B(n45), .Z(n41) );
  NAND U98 ( .A(g_input[6]), .B(e_input[7]), .Z(n45) );
  XNOR U99 ( .A(n42), .B(n59), .Z(n44) );
  AND U100 ( .A(g_input[7]), .B(e_input[6]), .Z(n59) );
  XNOR U101 ( .A(n63), .B(n60), .Z(n61) );
  NANDN U102 ( .B(n64), .A(n65), .Z(n46) );
  XOR U103 ( .A(n66), .B(n67), .Z(n48) );
  AND U104 ( .A(n68), .B(n69), .Z(n67) );
  XOR U105 ( .A(o_reg[4]), .B(n66), .Z(n69) );
  XOR U106 ( .A(o_reg[4]), .B(n68), .Z(o[3]) );
  XOR U107 ( .A(n70), .B(n64), .Z(n68) );
  XOR U108 ( .A(n72), .B(n73), .Z(n54) );
  AND U109 ( .A(n74), .B(n75), .Z(n73) );
  XNOR U110 ( .A(n76), .B(n72), .Z(n74) );
  XNOR U111 ( .A(n77), .B(n55), .Z(n71) );
  NAND U112 ( .A(e_input[5]), .B(g_input[7]), .Z(n55) );
  IV U113 ( .A(n56), .Z(n77) );
  XOR U114 ( .A(n78), .B(n79), .Z(n56) );
  AND U115 ( .A(n80), .B(n81), .Z(n79) );
  XNOR U116 ( .A(n78), .B(n82), .Z(n80) );
  XNOR U117 ( .A(n62), .B(n63), .Z(n58) );
  NAND U118 ( .A(g_input[5]), .B(e_input[7]), .Z(n63) );
  XNOR U119 ( .A(n60), .B(n83), .Z(n62) );
  AND U120 ( .A(e_input[6]), .B(g_input[6]), .Z(n83) );
  XNOR U121 ( .A(n87), .B(n84), .Z(n85) );
  XNOR U122 ( .A(n65), .B(n66), .Z(n70) );
  XNOR U123 ( .A(n89), .B(o_reg[3]), .Z(o[2]) );
  XOR U124 ( .A(n93), .B(n92), .Z(n89) );
  XOR U125 ( .A(n94), .B(n95), .Z(n81) );
  IV U126 ( .A(n75), .Z(n95) );
  XOR U127 ( .A(n72), .B(n96), .Z(n75) );
  AND U128 ( .A(g_input[7]), .B(e_input[4]), .Z(n96) );
  XNOR U129 ( .A(n100), .B(n76), .Z(n94) );
  NAND U130 ( .A(e_input[5]), .B(g_input[6]), .Z(n76) );
  IV U131 ( .A(n78), .Z(n100) );
  XOR U132 ( .A(n101), .B(n102), .Z(n78) );
  AND U133 ( .A(n103), .B(n104), .Z(n102) );
  XNOR U134 ( .A(n101), .B(n105), .Z(n103) );
  XNOR U135 ( .A(n86), .B(n87), .Z(n82) );
  NAND U136 ( .A(g_input[4]), .B(e_input[7]), .Z(n87) );
  XNOR U137 ( .A(n84), .B(n106), .Z(n86) );
  AND U138 ( .A(e_input[6]), .B(g_input[5]), .Z(n106) );
  XNOR U139 ( .A(n110), .B(n107), .Z(n108) );
  XNOR U140 ( .A(n91), .B(n88), .Z(n93) );
  XNOR U141 ( .A(n113), .B(n114), .Z(n91) );
  XOR U142 ( .A(n115), .B(n116), .Z(n114) );
  AND U143 ( .A(n117), .B(n118), .Z(n115) );
  NAND U144 ( .A(n119), .B(n120), .Z(n118) );
  NANDN U145 ( .B(n121), .A(n116), .Z(n117) );
  XOR U146 ( .A(n122), .B(n123), .Z(n90) );
  ANDN U147 ( .A(n124), .B(n125), .Z(n123) );
  XNOR U148 ( .A(n122), .B(n126), .Z(n124) );
  XOR U149 ( .A(o_reg[2]), .B(n112), .Z(o[1]) );
  XOR U150 ( .A(n127), .B(n126), .Z(n112) );
  XOR U151 ( .A(n97), .B(n129), .Z(n98) );
  AND U152 ( .A(g_input[6]), .B(e_input[4]), .Z(n129) );
  XNOR U153 ( .A(n133), .B(n99), .Z(n128) );
  NAND U154 ( .A(e_input[5]), .B(g_input[5]), .Z(n99) );
  IV U155 ( .A(n101), .Z(n133) );
  XOR U156 ( .A(n134), .B(n135), .Z(n101) );
  AND U157 ( .A(n136), .B(n137), .Z(n135) );
  XNOR U158 ( .A(n134), .B(n138), .Z(n136) );
  XNOR U159 ( .A(n109), .B(n110), .Z(n105) );
  NAND U160 ( .A(g_input[3]), .B(e_input[7]), .Z(n110) );
  XNOR U161 ( .A(n107), .B(n139), .Z(n109) );
  AND U162 ( .A(e_input[6]), .B(g_input[4]), .Z(n139) );
  XOR U163 ( .A(n140), .B(n141), .Z(n107) );
  ANDN U164 ( .A(n142), .B(n143), .Z(n141) );
  XNOR U165 ( .A(n144), .B(n140), .Z(n142) );
  XNOR U166 ( .A(n125), .B(n111), .Z(n127) );
  XOR U167 ( .A(n147), .B(n121), .Z(n125) );
  XNOR U168 ( .A(n120), .B(n119), .Z(n121) );
  NAND U169 ( .A(g_input[7]), .B(e_input[3]), .Z(n119) );
  XNOR U170 ( .A(n151), .B(n148), .Z(n149) );
  XNOR U171 ( .A(n116), .B(n122), .Z(n147) );
  XOR U172 ( .A(n152), .B(n153), .Z(n122) );
  AND U173 ( .A(n154), .B(n155), .Z(n153) );
  XNOR U174 ( .A(n156), .B(n152), .Z(n154) );
  XNOR U175 ( .A(n157), .B(n160), .Z(n159) );
  XOR U176 ( .A(o_reg[1]), .B(n146), .Z(o[0]) );
  XOR U177 ( .A(n162), .B(n160), .Z(n155) );
  XNOR U178 ( .A(n150), .B(n151), .Z(n160) );
  NAND U179 ( .A(e_input[3]), .B(g_input[6]), .Z(n151) );
  XNOR U180 ( .A(n148), .B(n163), .Z(n150) );
  AND U181 ( .A(g_input[7]), .B(e_input[2]), .Z(n163) );
  XNOR U182 ( .A(n167), .B(n164), .Z(n165) );
  XNOR U183 ( .A(n158), .B(n152), .Z(n162) );
  XOR U184 ( .A(n157), .B(n171), .Z(n158) );
  ANDN U185 ( .A(n172), .B(n173), .Z(n171) );
  XNOR U186 ( .A(n156), .B(n177), .Z(n161) );
  IV U187 ( .A(n145), .Z(n177) );
  AND U188 ( .A(n178), .B(o_reg[0]), .Z(n145) );
  XNOR U189 ( .A(n169), .B(n170), .Z(n178) );
  XOR U190 ( .A(n181), .B(n176), .Z(n169) );
  XNOR U191 ( .A(n166), .B(n167), .Z(n176) );
  NAND U192 ( .A(e_input[3]), .B(g_input[5]), .Z(n167) );
  XNOR U193 ( .A(n164), .B(n182), .Z(n166) );
  AND U194 ( .A(g_input[6]), .B(e_input[2]), .Z(n182) );
  XNOR U195 ( .A(n186), .B(n183), .Z(n185) );
  XNOR U196 ( .A(n175), .B(n168), .Z(n181) );
  XOR U197 ( .A(n187), .B(n188), .Z(n168) );
  XNOR U198 ( .A(n193), .B(n190), .Z(n192) );
  XNOR U199 ( .A(n194), .B(n173), .Z(n189) );
  NAND U200 ( .A(e_input[1]), .B(g_input[7]), .Z(n173) );
  IV U201 ( .A(n174), .Z(n194) );
  XOR U202 ( .A(n195), .B(n196), .Z(n174) );
  AND U203 ( .A(n197), .B(n198), .Z(n196) );
  XOR U204 ( .A(n191), .B(n199), .Z(n198) );
  XNOR U205 ( .A(n193), .B(n195), .Z(n199) );
  NAND U206 ( .A(e_input[1]), .B(g_input[6]), .Z(n193) );
  XOR U207 ( .A(n190), .B(n200), .Z(n191) );
  AND U208 ( .A(g_input[7]), .B(e_input[0]), .Z(n200) );
  XNOR U209 ( .A(n204), .B(n201), .Z(n203) );
  XOR U210 ( .A(n184), .B(n205), .Z(n197) );
  XNOR U211 ( .A(n186), .B(n195), .Z(n205) );
  NAND U212 ( .A(e_input[3]), .B(g_input[4]), .Z(n186) );
  XOR U213 ( .A(n183), .B(n206), .Z(n184) );
  AND U214 ( .A(g_input[5]), .B(e_input[2]), .Z(n206) );
  XNOR U215 ( .A(n210), .B(n207), .Z(n209) );
  XOR U216 ( .A(n211), .B(n212), .Z(n195) );
  AND U217 ( .A(n213), .B(n214), .Z(n212) );
  XOR U218 ( .A(n202), .B(n215), .Z(n214) );
  XNOR U219 ( .A(n204), .B(n211), .Z(n215) );
  NAND U220 ( .A(e_input[1]), .B(g_input[5]), .Z(n204) );
  XOR U221 ( .A(n201), .B(n216), .Z(n202) );
  AND U222 ( .A(g_input[6]), .B(e_input[0]), .Z(n216) );
  XNOR U223 ( .A(n220), .B(n217), .Z(n219) );
  XOR U224 ( .A(n208), .B(n221), .Z(n213) );
  XNOR U225 ( .A(n210), .B(n211), .Z(n221) );
  NAND U226 ( .A(e_input[3]), .B(g_input[3]), .Z(n210) );
  XOR U227 ( .A(n207), .B(n222), .Z(n208) );
  AND U228 ( .A(g_input[4]), .B(e_input[2]), .Z(n222) );
  XNOR U229 ( .A(n226), .B(n223), .Z(n225) );
  XOR U230 ( .A(n227), .B(n228), .Z(n211) );
  AND U231 ( .A(n229), .B(n230), .Z(n228) );
  XOR U232 ( .A(n218), .B(n231), .Z(n230) );
  XNOR U233 ( .A(n220), .B(n227), .Z(n231) );
  NAND U234 ( .A(e_input[1]), .B(g_input[4]), .Z(n220) );
  XOR U235 ( .A(n217), .B(n232), .Z(n218) );
  AND U236 ( .A(g_input[5]), .B(e_input[0]), .Z(n232) );
  XOR U237 ( .A(n224), .B(n236), .Z(n229) );
  XNOR U238 ( .A(n226), .B(n227), .Z(n236) );
  NAND U239 ( .A(e_input[3]), .B(g_input[2]), .Z(n226) );
  XOR U240 ( .A(n223), .B(n237), .Z(n224) );
  AND U241 ( .A(g_input[3]), .B(e_input[2]), .Z(n237) );
  XNOR U242 ( .A(n241), .B(n238), .Z(n239) );
  XOR U243 ( .A(n242), .B(n243), .Z(n227) );
  AND U244 ( .A(n188), .B(n244), .Z(n243) );
  XOR U245 ( .A(n242), .B(n187), .Z(n244) );
  NAND U246 ( .A(e_input[3]), .B(g_input[1]), .Z(n241) );
  XOR U247 ( .A(n238), .B(n245), .Z(n240) );
  AND U248 ( .A(g_input[2]), .B(e_input[2]), .Z(n245) );
  AND U249 ( .A(n246), .B(g_input[0]), .Z(n238) );
  NANDN U250 ( .B(e_input[3]), .A(n247), .Z(n246) );
  NAND U251 ( .A(g_input[1]), .B(e_input[2]), .Z(n247) );
  XOR U252 ( .A(n233), .B(n249), .Z(n234) );
  AND U253 ( .A(g_input[4]), .B(e_input[0]), .Z(n249) );
  XOR U254 ( .A(n252), .B(n250), .Z(n251) );
  AND U255 ( .A(g_input[3]), .B(e_input[0]), .Z(n252) );
  AND U256 ( .A(g_input[2]), .B(e_input[1]), .Z(n253) );
  XNOR U257 ( .A(n257), .B(n254), .Z(n255) );
  XNOR U258 ( .A(n258), .B(n235), .Z(n248) );
  NAND U259 ( .A(e_input[1]), .B(g_input[3]), .Z(n235) );
  IV U260 ( .A(n242), .Z(n258) );
  NAND U261 ( .A(e_input[1]), .B(g_input[1]), .Z(n257) );
  XOR U262 ( .A(n254), .B(n259), .Z(n256) );
  AND U263 ( .A(g_input[2]), .B(e_input[0]), .Z(n259) );
  AND U264 ( .A(n260), .B(g_input[0]), .Z(n254) );
  NANDN U265 ( .B(e_input[1]), .A(n261), .Z(n260) );
  NAND U266 ( .A(g_input[1]), .B(e_input[0]), .Z(n261) );
  XOR U267 ( .A(n130), .B(n263), .Z(n131) );
  AND U268 ( .A(g_input[5]), .B(e_input[4]), .Z(n263) );
  XNOR U269 ( .A(n267), .B(n132), .Z(n262) );
  NAND U270 ( .A(e_input[5]), .B(g_input[4]), .Z(n132) );
  IV U271 ( .A(n134), .Z(n267) );
  XOR U272 ( .A(n264), .B(n270), .Z(n265) );
  AND U273 ( .A(g_input[4]), .B(e_input[4]), .Z(n270) );
  XOR U274 ( .A(n271), .B(n272), .Z(n264) );
  AND U275 ( .A(n273), .B(n274), .Z(n272) );
  XOR U276 ( .A(n275), .B(n271), .Z(n274) );
  AND U277 ( .A(g_input[3]), .B(e_input[4]), .Z(n275) );
  XOR U278 ( .A(n276), .B(n271), .Z(n273) );
  AND U279 ( .A(g_input[2]), .B(e_input[5]), .Z(n276) );
  XNOR U280 ( .A(n280), .B(n277), .Z(n278) );
  XNOR U281 ( .A(n281), .B(n266), .Z(n269) );
  NAND U282 ( .A(e_input[5]), .B(g_input[3]), .Z(n266) );
  IV U283 ( .A(n268), .Z(n281) );
  XNOR U284 ( .A(n282), .B(n283), .Z(n179) );
  XOR U285 ( .A(n284), .B(n280), .Z(n268) );
  NAND U286 ( .A(e_input[5]), .B(g_input[1]), .Z(n280) );
  IV U287 ( .A(n279), .Z(n284) );
  XOR U288 ( .A(n277), .B(n285), .Z(n279) );
  AND U289 ( .A(g_input[2]), .B(e_input[4]), .Z(n285) );
  AND U290 ( .A(n286), .B(g_input[0]), .Z(n277) );
  NANDN U291 ( .B(e_input[5]), .A(n287), .Z(n286) );
  NAND U292 ( .A(g_input[1]), .B(e_input[4]), .Z(n287) );
  XNOR U293 ( .A(n143), .B(n144), .Z(n138) );
  NAND U294 ( .A(g_input[2]), .B(e_input[7]), .Z(n144) );
  XNOR U295 ( .A(n140), .B(n288), .Z(n143) );
  AND U296 ( .A(e_input[6]), .B(g_input[3]), .Z(n288) );
  XNOR U297 ( .A(n289), .B(n290), .Z(n282) );
  AND U298 ( .A(e_input[6]), .B(g_input[2]), .Z(n290) );
  NAND U299 ( .A(g_input[1]), .B(e_input[7]), .Z(n283) );
  AND U300 ( .A(n291), .B(g_input[0]), .Z(n289) );
  NANDN U301 ( .B(e_input[7]), .A(n292), .Z(n291) );
  NAND U302 ( .A(e_input[6]), .B(g_input[1]), .Z(n292) );
endmodule


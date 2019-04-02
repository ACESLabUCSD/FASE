/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP2
// Date      : Tue Apr  2 05:23:06 2019
/////////////////////////////////////////////////////////////


module MULT_full_TG_N8 ( clk, rst, g_input, e_input, o );
  input [7:0] g_input;
  input [7:0] e_input;
  output [15:0] o;
  input clk, rst;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283;

  MUX U1 ( .IN0(n192), .IN1(n202), .SEL(n193), .F(n177) );
  MUX U2 ( .IN0(n1), .IN1(n279), .SEL(n248), .F(n108) );
  IV U3 ( .A(n249), .Z(n1) );
  MUX U4 ( .IN0(n2), .IN1(n159), .SEL(n158), .F(n196) );
  IV U5 ( .A(n207), .Z(n2) );
  XOR U6 ( .A(n173), .B(n185), .Z(n174) );
  MUX U7 ( .IN0(n25), .IN1(n3), .SEL(n24), .F(n142) );
  IV U8 ( .A(n148), .Z(n3) );
  XNOR U9 ( .A(n245), .B(n244), .Z(n250) );
  MUX U10 ( .IN0(n162), .IN1(n130), .SEL(n131), .F(n115) );
  MUX U11 ( .IN0(n203), .IN1(n209), .SEL(n204), .F(n192) );
  MUX U12 ( .IN0(n108), .IN1(n278), .SEL(n109), .F(n87) );
  MUX U13 ( .IN0(n4), .IN1(n160), .SEL(n161), .F(n207) );
  IV U14 ( .A(n221), .Z(n4) );
  XOR U15 ( .A(n186), .B(n198), .Z(n189) );
  MUX U16 ( .IN0(n138), .IN1(n5), .SEL(n139), .F(n162) );
  IV U17 ( .A(n171), .Z(n5) );
  MUX U18 ( .IN0(n64), .IN1(n66), .SEL(n65), .F(n6) );
  IV U19 ( .A(n6), .Z(n52) );
  XOR U20 ( .A(n276), .B(n275), .Z(n152) );
  MUX U21 ( .IN0(n7), .IN1(n128), .SEL(n19), .F(n121) );
  IV U22 ( .A(n18), .Z(n7) );
  MUX U23 ( .IN0(n127), .IN1(n8), .SEL(n126), .F(n118) );
  IV U24 ( .A(n125), .Z(n8) );
  MUX U25 ( .IN0(n199), .IN1(n201), .SEL(n200), .F(n186) );
  MUX U26 ( .IN0(n177), .IN1(n191), .SEL(n178), .F(n164) );
  MUX U27 ( .IN0(n230), .IN1(n9), .SEL(n31), .F(n221) );
  IV U28 ( .A(n30), .Z(n9) );
  XOR U29 ( .A(n283), .B(n281), .Z(n263) );
  MUX U30 ( .IN0(n10), .IN1(n154), .SEL(n26), .F(n148) );
  IV U31 ( .A(n27), .Z(n10) );
  XNOR U32 ( .A(n181), .B(n175), .Z(n184) );
  XNOR U33 ( .A(n80), .B(n77), .Z(n94) );
  MUX U34 ( .IN0(n121), .IN1(n123), .SEL(n122), .F(n11) );
  IV U35 ( .A(n11), .Z(n91) );
  MUX U36 ( .IN0(n68), .IN1(n86), .SEL(n69), .F(n55) );
  MUX U37 ( .IN0(n260), .IN1(n12), .SEL(n261), .F(n252) );
  IV U38 ( .A(n262), .Z(n12) );
  MUX U39 ( .IN0(n13), .IN1(n196), .SEL(n151), .F(n181) );
  IV U40 ( .A(n150), .Z(n13) );
  MUX U41 ( .IN0(n175), .IN1(n173), .SEL(n174), .F(n14) );
  IV U42 ( .A(n14), .Z(n169) );
  MUX U43 ( .IN0(n87), .IN1(n107), .SEL(n88), .F(n68) );
  XNOR U44 ( .A(n237), .B(n234), .Z(n236) );
  MUX U45 ( .IN0(n22), .IN1(n142), .SEL(n23), .F(n134) );
  XNOR U46 ( .A(n101), .B(n100), .Z(n238) );
  MUX U47 ( .IN0(n15), .IN1(n54), .SEL(n53), .F(n48) );
  IV U48 ( .A(n52), .Z(n15) );
  XOR U49 ( .A(n91), .B(n118), .Z(n112) );
  MUX U50 ( .IN0(n224), .IN1(n16), .SEL(n225), .F(n216) );
  IV U51 ( .A(n226), .Z(n16) );
  XNOR U52 ( .A(n277), .B(n274), .Z(n276) );
  MUX U53 ( .IN0(n257), .IN1(n140), .SEL(n141), .F(n245) );
  MUX U54 ( .IN0(n164), .IN1(n176), .SEL(n165), .F(n125) );
  XNOR U55 ( .A(n171), .B(n170), .Z(n172) );
  XOR U56 ( .A(n72), .B(n62), .Z(n65) );
  XOR U57 ( .A(n236), .B(n235), .Z(n33) );
  XOR U58 ( .A(n159), .B(n154), .Z(n157) );
  MUX U59 ( .IN0(n93), .IN1(n17), .SEL(n92), .F(n60) );
  IV U60 ( .A(n91), .Z(n17) );
  MUX U61 ( .IN0(n55), .IN1(n67), .SEL(n56), .F(n37) );
  XOR U62 ( .A(n18), .B(n19), .Z(o[9]) );
  XNOR U63 ( .A(n20), .B(n21), .Z(o[8]) );
  XNOR U64 ( .A(n22), .B(n23), .Z(o[7]) );
  XNOR U65 ( .A(n24), .B(n25), .Z(o[6]) );
  XNOR U66 ( .A(n26), .B(n27), .Z(o[5]) );
  XNOR U67 ( .A(n28), .B(n29), .Z(o[4]) );
  XOR U68 ( .A(n30), .B(n31), .Z(o[3]) );
  XNOR U69 ( .A(n32), .B(n33), .Z(o[2]) );
  XOR U70 ( .A(n34), .B(n35), .Z(o[1]) );
  XNOR U71 ( .A(n36), .B(n37), .Z(o[15]) );
  XOR U72 ( .A(n38), .B(n39), .Z(n36) );
  AND U73 ( .A(n40), .B(n41), .Z(n39) );
  OR U74 ( .A(n42), .B(n43), .Z(n41) );
  AND U75 ( .A(n44), .B(n45), .Z(n40) );
  NANDN U76 ( .B(n46), .A(n37), .Z(n45) );
  OR U77 ( .A(n47), .B(n48), .Z(n44) );
  NANDN U78 ( .B(n49), .A(n43), .Z(n38) );
  XNOR U79 ( .A(n42), .B(n43), .Z(o[14]) );
  OR U80 ( .A(n50), .B(n51), .Z(n43) );
  XOR U81 ( .A(n47), .B(n49), .Z(n42) );
  IV U82 ( .A(n48), .Z(n49) );
  XOR U83 ( .A(n37), .B(n46), .Z(n47) );
  AND U84 ( .A(g_input[7]), .B(e_input[7]), .Z(n46) );
  XNOR U85 ( .A(n55), .B(n58), .Z(n56) );
  XOR U86 ( .A(n50), .B(n51), .Z(o[13]) );
  NAND U87 ( .A(n59), .B(n60), .Z(n51) );
  XOR U88 ( .A(n54), .B(n53), .Z(n50) );
  XOR U89 ( .A(n52), .B(n61), .Z(n53) );
  NOR U90 ( .A(n62), .B(n63), .Z(n61) );
  XNOR U91 ( .A(n57), .B(n58), .Z(n54) );
  NAND U92 ( .A(e_input[7]), .B(g_input[6]), .Z(n58) );
  XNOR U93 ( .A(n55), .B(n67), .Z(n57) );
  AND U94 ( .A(e_input[6]), .B(g_input[7]), .Z(n67) );
  XNOR U95 ( .A(n68), .B(n71), .Z(n69) );
  XOR U96 ( .A(n60), .B(n59), .Z(o[12]) );
  XNOR U97 ( .A(n66), .B(n65), .Z(n59) );
  XOR U98 ( .A(n73), .B(n74), .Z(n62) );
  AND U99 ( .A(n75), .B(n76), .Z(n74) );
  XOR U100 ( .A(n73), .B(n77), .Z(n76) );
  XOR U101 ( .A(n78), .B(n63), .Z(n72) );
  NANDN U102 ( .B(n79), .A(g_input[7]), .Z(n63) );
  IV U103 ( .A(n64), .Z(n78) );
  XOR U104 ( .A(n80), .B(n81), .Z(n64) );
  ANDN U105 ( .A(n82), .B(n83), .Z(n81) );
  IV U106 ( .A(n84), .Z(n83) );
  XOR U107 ( .A(n85), .B(n80), .Z(n82) );
  XNOR U108 ( .A(n70), .B(n71), .Z(n66) );
  NAND U109 ( .A(e_input[7]), .B(g_input[5]), .Z(n71) );
  XNOR U110 ( .A(n68), .B(n86), .Z(n70) );
  AND U111 ( .A(g_input[6]), .B(e_input[6]), .Z(n86) );
  XNOR U112 ( .A(n87), .B(n90), .Z(n88) );
  XNOR U113 ( .A(n92), .B(n93), .Z(o[11]) );
  XNOR U114 ( .A(n85), .B(n84), .Z(n93) );
  XNOR U115 ( .A(n94), .B(n75), .Z(n84) );
  XNOR U116 ( .A(n73), .B(n95), .Z(n75) );
  AND U117 ( .A(e_input[4]), .B(g_input[7]), .Z(n95) );
  XOR U118 ( .A(n96), .B(n97), .Z(n73) );
  AND U119 ( .A(n98), .B(n99), .Z(n97) );
  XOR U120 ( .A(n96), .B(n100), .Z(n99) );
  NANDN U121 ( .B(n79), .A(g_input[6]), .Z(n77) );
  XOR U122 ( .A(n101), .B(n102), .Z(n80) );
  ANDN U123 ( .A(n103), .B(n104), .Z(n102) );
  IV U124 ( .A(n105), .Z(n104) );
  XOR U125 ( .A(n106), .B(n101), .Z(n103) );
  XNOR U126 ( .A(n89), .B(n90), .Z(n85) );
  NAND U127 ( .A(e_input[7]), .B(g_input[4]), .Z(n90) );
  XNOR U128 ( .A(n87), .B(n107), .Z(n89) );
  AND U129 ( .A(g_input[5]), .B(e_input[6]), .Z(n107) );
  XNOR U130 ( .A(n108), .B(n111), .Z(n109) );
  XOR U131 ( .A(n112), .B(n113), .Z(n92) );
  XOR U132 ( .A(n114), .B(n115), .Z(n113) );
  AND U133 ( .A(n116), .B(n117), .Z(n114) );
  NANDN U134 ( .B(n118), .A(n119), .Z(n117) );
  NANDN U135 ( .B(n120), .A(n115), .Z(n116) );
  XOR U136 ( .A(n123), .B(n122), .Z(o[10]) );
  XNOR U137 ( .A(n124), .B(n120), .Z(n122) );
  XOR U138 ( .A(n118), .B(n119), .Z(n120) );
  NAND U139 ( .A(e_input[3]), .B(g_input[7]), .Z(n119) );
  XNOR U140 ( .A(n115), .B(n121), .Z(n124) );
  XOR U141 ( .A(n129), .B(n130), .Z(n19) );
  XNOR U142 ( .A(n131), .B(n128), .Z(n129) );
  XOR U143 ( .A(n132), .B(n133), .Z(n18) );
  XOR U144 ( .A(n134), .B(n135), .Z(n128) );
  ANDN U145 ( .A(n136), .B(n21), .Z(n135) );
  XNOR U146 ( .A(n137), .B(n138), .Z(n21) );
  XNOR U147 ( .A(n139), .B(n134), .Z(n137) );
  XOR U148 ( .A(n20), .B(n134), .Z(n136) );
  XNOR U149 ( .A(n140), .B(n141), .Z(n20) );
  XNOR U150 ( .A(n143), .B(n144), .Z(n23) );
  XNOR U151 ( .A(n145), .B(n142), .Z(n143) );
  XOR U152 ( .A(n146), .B(n147), .Z(n22) );
  XNOR U153 ( .A(n149), .B(n150), .Z(n24) );
  XOR U154 ( .A(n151), .B(n148), .Z(n149) );
  XNOR U155 ( .A(n152), .B(n153), .Z(n25) );
  XOR U156 ( .A(n155), .B(n156), .Z(n27) );
  XNOR U157 ( .A(n157), .B(n158), .Z(n26) );
  NANDN U158 ( .B(n29), .A(n28), .Z(n154) );
  XOR U159 ( .A(n160), .B(n161), .Z(n28) );
  NAND U160 ( .A(g_input[0]), .B(e_input[4]), .Z(n29) );
  XOR U161 ( .A(n126), .B(n127), .Z(n130) );
  NAND U162 ( .A(g_input[6]), .B(e_input[3]), .Z(n127) );
  XNOR U163 ( .A(n125), .B(n163), .Z(n126) );
  AND U164 ( .A(e_input[2]), .B(g_input[7]), .Z(n163) );
  XNOR U165 ( .A(n164), .B(n167), .Z(n165) );
  XOR U166 ( .A(n162), .B(n168), .Z(n131) );
  ANDN U167 ( .A(n169), .B(n170), .Z(n168) );
  XOR U168 ( .A(n172), .B(n169), .Z(n139) );
  NAND U169 ( .A(e_input[1]), .B(g_input[7]), .Z(n170) );
  XOR U170 ( .A(n166), .B(n167), .Z(n138) );
  NAND U171 ( .A(g_input[5]), .B(e_input[3]), .Z(n167) );
  XNOR U172 ( .A(n164), .B(n176), .Z(n166) );
  AND U173 ( .A(e_input[2]), .B(g_input[6]), .Z(n176) );
  XNOR U174 ( .A(n177), .B(n180), .Z(n178) );
  XOR U175 ( .A(n181), .B(n182), .Z(n171) );
  ANDN U176 ( .A(n183), .B(n145), .Z(n182) );
  XNOR U177 ( .A(n184), .B(n174), .Z(n145) );
  AND U178 ( .A(e_input[0]), .B(g_input[7]), .Z(n185) );
  XOR U179 ( .A(n186), .B(n187), .Z(n173) );
  ANDN U180 ( .A(n188), .B(n189), .Z(n187) );
  XOR U181 ( .A(n186), .B(n190), .Z(n188) );
  NAND U182 ( .A(e_input[1]), .B(g_input[6]), .Z(n175) );
  XNOR U183 ( .A(n144), .B(n181), .Z(n183) );
  XOR U184 ( .A(n179), .B(n180), .Z(n144) );
  NAND U185 ( .A(g_input[4]), .B(e_input[3]), .Z(n180) );
  XNOR U186 ( .A(n177), .B(n191), .Z(n179) );
  AND U187 ( .A(e_input[2]), .B(g_input[5]), .Z(n191) );
  XNOR U188 ( .A(n192), .B(n195), .Z(n193) );
  XNOR U189 ( .A(n197), .B(n189), .Z(n151) );
  AND U190 ( .A(e_input[0]), .B(g_input[6]), .Z(n198) );
  XNOR U191 ( .A(n196), .B(n190), .Z(n197) );
  NAND U192 ( .A(e_input[1]), .B(g_input[5]), .Z(n190) );
  XOR U193 ( .A(n194), .B(n195), .Z(n150) );
  NAND U194 ( .A(e_input[3]), .B(g_input[3]), .Z(n195) );
  XNOR U195 ( .A(n192), .B(n202), .Z(n194) );
  AND U196 ( .A(e_input[2]), .B(g_input[4]), .Z(n202) );
  XNOR U197 ( .A(n203), .B(n206), .Z(n204) );
  XNOR U198 ( .A(n205), .B(n206), .Z(n159) );
  NANDN U199 ( .B(n208), .A(e_input[3]), .Z(n206) );
  XNOR U200 ( .A(n203), .B(n209), .Z(n205) );
  AND U201 ( .A(e_input[2]), .B(g_input[3]), .Z(n209) );
  NAND U202 ( .A(n210), .B(n211), .Z(n203) );
  OR U203 ( .A(n212), .B(n213), .Z(n210) );
  XNOR U204 ( .A(n214), .B(n200), .Z(n158) );
  XNOR U205 ( .A(n199), .B(n215), .Z(n200) );
  AND U206 ( .A(e_input[0]), .B(g_input[5]), .Z(n215) );
  XOR U207 ( .A(n216), .B(n217), .Z(n199) );
  AND U208 ( .A(n218), .B(n219), .Z(n217) );
  XOR U209 ( .A(n216), .B(n220), .Z(n219) );
  XOR U210 ( .A(n207), .B(n201), .Z(n214) );
  NAND U211 ( .A(e_input[1]), .B(g_input[4]), .Z(n201) );
  XNOR U212 ( .A(n222), .B(n218), .Z(n161) );
  XNOR U213 ( .A(n216), .B(n223), .Z(n218) );
  AND U214 ( .A(e_input[0]), .B(g_input[4]), .Z(n223) );
  XNOR U215 ( .A(n221), .B(n220), .Z(n222) );
  NAND U216 ( .A(e_input[1]), .B(g_input[3]), .Z(n220) );
  XOR U217 ( .A(n213), .B(n212), .Z(n160) );
  NAND U218 ( .A(e_input[3]), .B(g_input[1]), .Z(n212) );
  XNOR U219 ( .A(n227), .B(n211), .Z(n213) );
  NANDN U220 ( .B(n228), .A(n229), .Z(n211) );
  NANDN U221 ( .B(n208), .A(e_input[2]), .Z(n227) );
  XNOR U222 ( .A(n231), .B(n225), .Z(n31) );
  XNOR U223 ( .A(n224), .B(n232), .Z(n225) );
  AND U224 ( .A(e_input[0]), .B(g_input[3]), .Z(n232) );
  AND U225 ( .A(n233), .B(n234), .Z(n224) );
  OR U226 ( .A(n235), .B(n236), .Z(n233) );
  XOR U227 ( .A(n226), .B(n230), .Z(n231) );
  AND U228 ( .A(e_input[1]), .B(g_input[2]), .Z(n226) );
  XNOR U229 ( .A(n229), .B(n228), .Z(n30) );
  NAND U230 ( .A(g_input[1]), .B(e_input[2]), .Z(n228) );
  AND U231 ( .A(e_input[3]), .B(g_input[0]), .Z(n229) );
  NANDN U232 ( .B(n32), .A(n33), .Z(n230) );
  NAND U233 ( .A(e_input[1]), .B(g_input[1]), .Z(n235) );
  OR U234 ( .A(n34), .B(n35), .Z(n234) );
  NAND U235 ( .A(e_input[1]), .B(g_input[0]), .Z(n35) );
  NAND U236 ( .A(e_input[0]), .B(g_input[1]), .Z(n34) );
  NANDN U237 ( .B(n208), .A(e_input[0]), .Z(n237) );
  NAND U238 ( .A(g_input[0]), .B(e_input[2]), .Z(n32) );
  XNOR U239 ( .A(n106), .B(n105), .Z(n123) );
  XNOR U240 ( .A(n238), .B(n98), .Z(n105) );
  XNOR U241 ( .A(n96), .B(n239), .Z(n98) );
  AND U242 ( .A(e_input[4]), .B(g_input[6]), .Z(n239) );
  XOR U243 ( .A(n240), .B(n241), .Z(n96) );
  AND U244 ( .A(n242), .B(n243), .Z(n241) );
  XOR U245 ( .A(n240), .B(n244), .Z(n243) );
  NANDN U246 ( .B(n79), .A(g_input[5]), .Z(n100) );
  XOR U247 ( .A(n245), .B(n246), .Z(n101) );
  AND U248 ( .A(n133), .B(n247), .Z(n246) );
  XOR U249 ( .A(n132), .B(n245), .Z(n247) );
  XNOR U250 ( .A(n248), .B(n249), .Z(n132) );
  XNOR U251 ( .A(n250), .B(n242), .Z(n133) );
  XNOR U252 ( .A(n240), .B(n251), .Z(n242) );
  AND U253 ( .A(e_input[4]), .B(g_input[5]), .Z(n251) );
  XOR U254 ( .A(n252), .B(n253), .Z(n240) );
  AND U255 ( .A(n254), .B(n255), .Z(n253) );
  XOR U256 ( .A(n252), .B(n256), .Z(n255) );
  NANDN U257 ( .B(n79), .A(g_input[4]), .Z(n244) );
  XNOR U258 ( .A(n258), .B(n254), .Z(n141) );
  XNOR U259 ( .A(n252), .B(n259), .Z(n254) );
  AND U260 ( .A(e_input[4]), .B(g_input[4]), .Z(n259) );
  XNOR U261 ( .A(n257), .B(n256), .Z(n258) );
  NANDN U262 ( .B(n79), .A(g_input[3]), .Z(n256) );
  XOR U263 ( .A(n263), .B(n264), .Z(n140) );
  XNOR U264 ( .A(n265), .B(n266), .Z(n257) );
  NANDN U265 ( .B(n267), .A(n268), .Z(n265) );
  XNOR U266 ( .A(n266), .B(n146), .Z(n268) );
  XOR U267 ( .A(n269), .B(n270), .Z(n146) );
  IV U268 ( .A(n147), .Z(n267) );
  XNOR U269 ( .A(n271), .B(n261), .Z(n147) );
  XNOR U270 ( .A(n260), .B(n272), .Z(n261) );
  AND U271 ( .A(e_input[4]), .B(g_input[3]), .Z(n272) );
  AND U272 ( .A(n273), .B(n274), .Z(n260) );
  OR U273 ( .A(n275), .B(n276), .Z(n273) );
  XOR U274 ( .A(n262), .B(n266), .Z(n271) );
  NANDN U275 ( .B(n153), .A(n152), .Z(n266) );
  NANDN U276 ( .B(n79), .A(g_input[1]), .Z(n275) );
  OR U277 ( .A(n155), .B(n156), .Z(n274) );
  NAND U278 ( .A(g_input[1]), .B(e_input[4]), .Z(n156) );
  NANDN U279 ( .B(n79), .A(g_input[0]), .Z(n155) );
  IV U280 ( .A(e_input[5]), .Z(n79) );
  NANDN U281 ( .B(n208), .A(e_input[4]), .Z(n277) );
  NAND U282 ( .A(g_input[0]), .B(e_input[6]), .Z(n153) );
  AND U283 ( .A(g_input[2]), .B(e_input[5]), .Z(n262) );
  XNOR U284 ( .A(n110), .B(n111), .Z(n106) );
  NAND U285 ( .A(e_input[7]), .B(g_input[3]), .Z(n111) );
  XNOR U286 ( .A(n108), .B(n278), .Z(n110) );
  AND U287 ( .A(g_input[4]), .B(e_input[6]), .Z(n278) );
  XNOR U288 ( .A(n279), .B(n280), .Z(n248) );
  AND U289 ( .A(g_input[3]), .B(e_input[6]), .Z(n280) );
  NANDN U290 ( .B(n208), .A(e_input[7]), .Z(n249) );
  NAND U291 ( .A(n281), .B(n282), .Z(n279) );
  NANDN U292 ( .B(n264), .A(n263), .Z(n282) );
  NANDN U293 ( .B(n208), .A(e_input[6]), .Z(n283) );
  IV U294 ( .A(g_input[2]), .Z(n208) );
  NAND U295 ( .A(e_input[7]), .B(g_input[1]), .Z(n264) );
  OR U296 ( .A(n269), .B(n270), .Z(n281) );
  NAND U297 ( .A(e_input[6]), .B(g_input[1]), .Z(n270) );
  NAND U298 ( .A(g_input[0]), .B(e_input[7]), .Z(n269) );
  AND U299 ( .A(e_input[0]), .B(g_input[0]), .Z(o[0]) );
endmodule


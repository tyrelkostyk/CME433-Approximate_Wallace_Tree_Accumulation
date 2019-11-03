module eight_bit_array_multiplier(A, B, S);
input [7:0] A, B;
output [15:0] S

wire [7:0] s1, s2, s3, s4, s5, s6, s7;
wire [6:0] c;

assign S[0] = A & B;

array_level_one lvl_1(.A(A[1:0]), .B(B), .S(s1), .C(c[0]));

assign S[1] = s1[0];

array_levels lvl_2(.A(A[2]), .B(B), .Sin(s1[7:1]), .Cin(c[0]), .S(s2), .C(c[1]));

assign S[2] = s2[0];

array_levels lvl_3(.A(A[3]), .B(B), .Sin(s2[7:1]), .Cin(c[1]), .S(s3), .C(c[2]));

assign S[3] = s3[0];

array_levels lvl_4(.A(A[4]), .B(B), .Sin(s3[7:1]), .Cin(c[2]), .S(s4), .C(c[3]));

assign S[4] = s4[0];

array_levels lvl_5(.A(A[5]), .B(B), .Sin(s4[7:1]), .Cin(c[3]), .S(s5), .C(c[4]));

assign S[5] = s5[0];

array_levels lvl_6(.A(A[6]), .B(B), .Sin(s5[7:1]), .Cin(c[4]), .S(s6), .C(c[5]));

assign S[6] = s6[0];

array_levels lvl_7(.A(A[7]), .B(B), .Sin(s6[7:1]), .Cin(c[5]), .S(s7), .C(c[6]));

assign S[7] = s7[0];

assign S[8] = s7[1];

assign S[9] = s7[2];

assign S[10] = s7[3];

assign S[11] = s7[4];

assign S[12] = s7[5];

assign S[13] = s7[6];

assign S[14] = s7[7];

assign S[15] = c[6];

endmodule

module eight_bit_wallace_tree_top(
	input clk,
	input [7:0] A_in, B_in,
	output reg [15:0] S_out,
	output [12:0] L_12,
	output [10:0] L_23,
	output [8:0]  L_34,
	output [6:0]  L_45,
	output [4:0]  L_56,
	output [2:0]  L_67
);

reg [7:0] A, B;
wire [15:0] S;

always @( posedge clk ) begin
	A = A_in;
	B = B_in;
	S_out = S;
end

// wire [12:0] L_12;
// wire [10:0] L_23;
// wire [8:0]  L_34;
// wire [6:0]  L_45;
// wire [4:0]  L_56;
// wire [2:0]  L_67;

eight_bit_wallace_tree_reduc_layer_1 L1 (
	.A(A),
	.B(B),
	.w16385_in_L2(L_12[12]),

	.w1_o(S[0]),
	.w2_o(S[1]),
	.w16385_o(S[14]),
	.w32768_o(S[15]),

	.w4_o(L_12[0]),
	.w8_o(L_12[1]),
	.w16_o(L_12[2]),
	.w32_o(L_12[3]),
	.w64_o(L_12[4]),
	.w128_o(L_12[5]),
	.w256_o(L_12[6]),
	.w512_o(L_12[7]),
	.w1024_o(L_12[8]),
	.w2048_o(L_12[9]),
	.w4096_o(L_12[10]),
	.w8192_o(L_12[11])
);


eight_bit_wallace_tree_reduc_layer_2 L2 (
	.A(A[5:0]),
	.B(B[7:2]),
	.w8192_in_L3(L_23[10]),

	.w4_in(L_12[0]),
	.w8_in(L_12[1]),
	.w16_in(L_12[2]),
	.w32_in(L_12[3]),
	.w64_in(L_12[4]),
	.w128_in(L_12[5]),
	.w256_in(L_12[6]),
	.w512_in(L_12[7]),
	.w1024_in(L_12[8]),
	.w2048_in(L_12[9]),
	.w4096_in(L_12[10]),
	.w8192_in(L_12[11]),

	.w4_o(S[2]),
	.w8192_o(S[13]),
	.w16385_o_L1(L_12[12]),

	.w8_o(L_23[0]),
	.w16_o(L_23[1]),
	.w32_o(L_23[2]),
	.w64_o(L_23[3]),
	.w128_o(L_23[4]),
	.w256_o(L_23[5]),
	.w512_o(L_23[6]),
	.w1024_o(L_23[7]),
	.w2048_o(L_23[8]),
	.w4096_o(L_23[9])
);

eight_bit_wallace_tree_reduc_layer_3 L3 (
	.A(A[4:0]),
	.B(B[7:3]),
	.w4096_in_L4(L_34[8]),

	.w8_in(L_23[0]),
	.w16_in(L_23[1]),
	.w32_in(L_23[2]),
	.w64_in(L_23[3]),
	.w128_in(L_23[4]),
	.w256_in(L_23[5]),
	.w512_in(L_23[6]),
	.w1024_in(L_23[7]),
	.w2048_in(L_23[8]),
	.w4096_in(L_23[9]),


	.w8_o(S[3]),
	.w4096_o(S[12]),
	.w8192_o_L2(L_23[10]),


	.w16_o(L_34[0]),
	.w32_o(L_34[1]),
	.w64_o(L_34[2]),
	.w128_o(L_34[3]),
	.w256_o(L_34[4]),
	.w512_o(L_34[5]),
	.w1024_o(L_34[6]),
	.w2048_o(L_34[7])
);

eight_bit_wallace_tree_reduc_layer_4 L4 (
	.A(A[3:0]),
	.B(B[7:4]),
	.w2048_in_L5(L_45[6]),

	.w16_in(L_34[0]),
	.w32_in(L_34[1]),
	.w64_in(L_34[2]),
	.w128_in(L_34[3]),
	.w256_in(L_34[4]),
	.w512_in(L_34[5]),
	.w1024_in(L_34[6]),
	.w2048_in(L_34[7]),


	.w16_o(S[4]),
	.w2048_o(S[11]),
	.w4096_o_L3(L_34[8]),


	.w32_o(L_45[0]),
	.w64_o(L_45[1]),
	.w128_o(L_45[2]),
	.w256_o(L_45[3]),
	.w512_o(L_45[4]),
	.w1024_o(L_45[5])
);

eight_bit_wallace_tree_reduc_layer_5 L5 (
	.A(A[2:0]),
	.B(B[7:5]),
	.w1024_in_L6(L_56[4]),

	.w32_in(L_45[0]),
	.w64_in(L_45[1]),
	.w128_in(L_45[2]),
	.w256_in(L_45[3]),
	.w512_in(L_45[4]),
	.w1024_in(L_45[5]),


	.w32_o(S[5]),
	.w1024_o(S[10]),
	.w2048_o_L4(L_45[6]),


	.w64_o(L_56[0]),
	.w128_o(L_56[1]),
	.w256_o(L_56[2]),
	.w512_o(L_56[3])
);

eight_bit_wallace_tree_reduc_layer_6 L6 (
	.A(A[1:0]),
	.B(B[7:6]),
	.w512_in_L7(L_67[2]),

	.w64_in(L_56[0]),
	.w128_in(L_56[1]),
	.w256_in(L_56[2]),
	.w512_in(L_56[3]),


	.w64_o(S[6]),
	.w512_o(S[9]),
	.w1024_o_L5(L_56[4]),


	.w128_o(L_67[0]),
	.w256_o(L_67[1])
);

eight_bit_wallace_tree_reduc_layer_7 L7 (
	.A(A[0]),
	.B(B[7]),

	.w128_in(L_67[0]),
	.w256_in(L_67[1]),


	.w128_o(S[7]),
	.w256_o(S[8]),
	.w512_o_L6(L_67[2])
);

endmodule
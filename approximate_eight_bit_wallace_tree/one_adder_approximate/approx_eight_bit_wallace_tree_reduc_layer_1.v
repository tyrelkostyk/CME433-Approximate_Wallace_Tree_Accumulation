module one_approx_eight_bit_wallace_tree_reduc_layer_1 (
	input [7:0] A, B,												// 8-bit input integers
	input w16385_in_L2,											// 1-bit propogated input from layer 2
	output w1_o, w2_o, w16385_o, w32768_o,	// 1-bit direct output sums (2^15=32,768)
	output w4_o, w8_o, w16_o, w32_o, w64_o, w128_o, w256_o,	w512_o, w1024_o, w2048_o, w4096_o, w8192_o // 1-bit adder outputs (to subsequent layers)
);

wire w4_c, w8_c, w16_c, w32_c, w64_c, w128_c, w256_c, w512_c, w1024_c, w2048_c, w4096_c, w8192_c, w16385_c;


// WEIGHT 1 (2^0) //

assign w1_o = A[0] & B[0];

// WEIGHT 2 (2^1) //

one_bit_half_adder HA_w2 (
	.A( A[0] & B[1] ),
	.B( A[1] & B[0] ),
	.S( w2_o ),
	.C( w4_c )
);

// WEIGHT 4 (2^2) //

approximate_full_adder FA_w4 (
	.A( A[1] & B[1] ),
	.B( A[2] & B[0] ),
	.Cin( w4_c ),
	.S( w4_o ),
	.Cout( w8_c )
);

// WEIGHT 8 (2^3) //

one_bit_full_adder FA_w8 (
	.A( A[2] & B[1] ),
	.B( A[3] & B[0] ),
	.Cin( w8_c ),
	.S( w8_o ),
	.Cout( w16_c )
);

// WEIGHT 16 (2^4) //

one_bit_full_adder FA_w16 (
	.A( A[3] & B[1] ),
	.B( A[4] & B[0] ),
	.Cin( w16_c ),
	.S( w16_o ),
	.Cout( w32_c )
);

// WEIGHT 32 (2^5) //

one_bit_full_adder FA_w32 (
	.A( A[4] & B[1] ),
	.B( A[5] & B[0] ),
	.Cin( w32_c ),
	.S( w32_o ),
	.Cout( w64_c )
);

// WEIGHT 64 (2^6) //

one_bit_full_adder FA_w64 (
	.A( A[5] & B[1] ),
	.B( A[6] & B[0] ),
	.Cin( w64_c ),
	.S( w64_o ),
	.Cout( w128_c )
);

// WEIGHT 128 (2^7) //

one_bit_full_adder FA_w128 (
	.A( A[6] & B[1] ),
	.B( A[7] & B[0] ),
	.Cin( w128_c ),
	.S( w128_o ),
	.Cout( w256_c )
);

// WEIGHT 256 (2^8) //

one_bit_full_adder FA_w256 (
	.A( A[6] & B[2] ),
	.B( A[7] & B[1] ),
	.Cin( w256_c ),
	.S( w256_o ),
	.Cout( w512_c )
);

// WEIGHT 512 (2^9) //

one_bit_full_adder FA_w512 (
	.A( A[6] & B[3] ),
	.B( A[7] & B[2] ),
	.Cin( w512_c ),
	.S( w512_o ),
	.Cout( w1024_c )
);

// WEIGHT 1024 (2^10) //

one_bit_full_adder FA_w1024 (
	.A( A[6] & B[4] ),
	.B( A[7] & B[3] ),
	.Cin( w1024_c ),
	.S( w1024_o ),
	.Cout( w2048_c )
);

// WEIGHT 2048 (2^11) //

approximate_full_adder FA_w2048 (
	.A( A[6] & B[5] ),
	.B( A[7] & B[4] ),
	.Cin( w2048_c ),
	.S( w2048_o ),
	.Cout( w4096_c )
);

// WEIGHT 4096 (2^12) //

one_bit_full_adder FA_w4096 (
	.A( A[6] & B[6] ),
	.B( A[7] & B[5] ),
	.Cin( w4096_c ),
	.S( w4096_o ),
	.Cout( w8192_c )
);

// WEIGHT 8192 (2^13) //

one_bit_full_adder FA_w8192 (
	.A( A[6] & B[7] ),
	.B( A[7] & B[6] ),
	.Cin( w8192_c ),
	.S( w8192_o ),
	.Cout( w16385_c )
);

// WEIGHT 16385 (2^14) //

one_bit_full_adder FA_w16385 (
	.A( A[7] & B[7] ),
	.B( w16385_c ),
	.Cin( w16385_in_L2 ),
	.S( w16385_o ),
	.Cout( w32768_o )
);


endmodule

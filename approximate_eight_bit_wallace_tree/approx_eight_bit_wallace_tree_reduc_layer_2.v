module approx_eight_bit_wallace_tree_reduc_layer_1 (
	input [7:0] A, B,													// 8-bit input integers
	input w16385_p,														// 1-bit propogated input
	output w1, w2, w16385, w32768,						// 1-bit direct output sums (2^15=32,768)
	output w4, w8, w16, w32, w64, w128, w256,	// 1-bit adder outputs (to subsequent layers)
	output w512, w1024, w2048, w4096, w8192
);

wire w4_c, w8_c, w16_c, w32_c, w64_c, w128_c, w256_c, w512_c, w1024_c, w2048_c, w4096_c, w8192_c, w16385_c;

// WEIGHT 1 (2^0) //

assign w1 = A[0] & B[0];

// WEIGHT 2 (2^1) //

approximate_half_adder HA_w2 (
	.A( A[0] & B[1] ),
	.B( A[1] & B[0] ),
	.S( w2 ),
	.C( w4_c )
);

// WEIGHT 4 (2^2) //

approximate_full_adder FA_w4 (
	.A( A[1] & B[1] ),
	.B( A[2] & B[0] ),
	.Cin( w4_c ),
	.S( w4 ),
	.Cout( w8_c )
);

// WEIGHT 8 (2^3) //

approximate_full_adder FA_w8 (
	.A( A[2] & B[1] ),
	.B( A[3] & B[0] ),
	.Cin( w8_c ),
	.S( w8 ),
	.Cout( w16_c )
);

// WEIGHT 16 (2^4) //

approximate_full_adder FA_w16 (
	.A( A[3] & B[1] ),
	.B( A[4] & B[0] ),
	.Cin( w16_c ),
	.S( w16 ),
	.Cout( w32_c )
);

// WEIGHT 32 (2^5) //

approximate_full_adder FA_w32 (
	.A( A[4] & B[1] ),
	.B( A[5] & B[0] ),
	.Cin( w32_c ),
	.S( w32 ),
	.Cout( w64_c )
);

// WEIGHT 64 (2^6) //

approximate_full_adder FA_w64 (
	.A( A[5] & B[1] ),
	.B( A[6] & B[0] ),
	.Cin( w64_c ),
	.S( w64 ),
	.Cout( w128_c )
);

// WEIGHT 128 (2^7) //

approximate_full_adder FA_w128 (
	.A( A[6] & B[1] ),
	.B( A[7] & B[0] ),
	.Cin( w128_c ),
	.S( w128 ),
	.Cout( w256_c )
);

// WEIGHT 256 (2^8) //

approximate_full_adder FA_w256 (
	.A( A[6] & B[2] ),
	.B( A[7] & B[1] ),
	.Cin( w256_c ),
	.S( w256 ),
	.Cout( w512_c )
);

// WEIGHT 512 (2^9) //

approximate_full_adder FA_w512 (
	.A( A[6] & B[3] ),
	.B( A[7] & B[2] ),
	.Cin( w512_c ),
	.S( w512 ),
	.Cout( w1024_c )
);

// WEIGHT 1024 (2^10) //

approximate_full_adder FA_w1024 (
	.A( A[6] & B[4] ),
	.B( A[7] & B[3] ),
	.Cin( w1024_c ),
	.S( w1024 ),
	.Cout( w2048_c )
);

// WEIGHT 2048 (2^11) //

approximate_full_adder FA_w2048 (
	.A( A[6] & B[5] ),
	.B( A[7] & B[4] ),
	.Cin( w2048_c ),
	.S( w2048 ),
	.Cout( w4096_c )
);

// WEIGHT 4096 (2^12) //

approximate_full_adder FA_w4096 (
	.A( A[6] & B[6] ),
	.B( A[7] & B[5] ),
	.Cin( w4096_c ),
	.S( w4096 ),
	.Cout( w8192_c )
);

// WEIGHT 8192 (2^13) //

approximate_full_adder FA_w8192 (
	.A( A[6] & B[7] ),
	.B( A[7] & B[6] ),
	.Cin( w8192_c ),
	.S( w8192 ),
	.Cout( w16385_c )
);

// WEIGHT 16385 (2^14) //

approximate_full_adder FA_w16385 (
	.A( A[7] & B[7] ),
	.B( w16385_c ),
	.Cin( w16385_p ),
	.S( w16385 ),
	.Cout( w32768 )
);


endmodule

module eight_bit_wallace_tree_reduc_layer_4 (
	input [3:0] A,											// reduced 8-bit input integers
	input [7:4] B,
	input w2048_in_L5,									// 1-bit back propogated input from layer 5
	input w16_in, w32_in, w64_in, w128_in, w256_in, w512_in, w1024_in, w2048_in,	// 1-bit adder inputs (from layer 3)
	output w4096_o_L3,									// 1-bit propogated output to layer 2
	output w16_o, w2048_o,							// 1-bit direct output sums (2^15=32,768)
	output w32_o, w64_o, w128_o, w256_o,	w512_o, w1024_o	// 1-bit adder outputs (to layer 3)
);

wire w32_c, w64_c, w128_c, w256_c, w512_c, w1024_c, w2048_c;


// WEIGHT 16 (2^4) //

one_bit_half_adder HA_w16 (
	.A( w16_in ),
	.B( A[0] & B[4] ),
	.S( w16_o ),
	.C( w32_c )
);

// WEIGHT 32 (2^5) //

one_bit_full_adder FA_w32 (
	.A( w16_in ),
	.B( A[1] & B[4] ),
	.Cin( w32_c ),
	.S( w32_o ),
	.Cout( w64_c )
);

// WEIGHT 64 (2^6) //

one_bit_full_adder FA_w64 (
	.A( w64_in ),
	.B( A[2] & B[4] ),
	.Cin( w64_c ),
	.S( w64_o ),
	.Cout( w128_c )
);

// WEIGHT 128 (2^7) //

one_bit_full_adder FA_w128 (
	.A( w128_in ),
	.B( A[3] & B[4] ),
	.Cin( w128_c ),
	.S( w128_o ),
	.Cout( w256_c )
);

// WEIGHT 256 (2^8) //

one_bit_full_adder FA_w256 (
	.A( w256_in ),
	.B( A[3] & B[5] ),
	.Cin( w256_c ),
	.S( w256_o ),
	.Cout( w512_c )
);

// WEIGHT 512 (2^9) //

one_bit_full_adder FA_w512 (
	.A( w512_in ),
	.B( A[3] & B[6] ),
	.Cin( w512_c ),
	.S( w512_o ),
	.Cout( w1024_c )
);

// WEIGHT 1024 (2^10) //

one_bit_full_adder FA_w1024 (
	.A( w1024_in ),
	.B( A[3] & B[7] ),
	.Cin( w1024_c ),
	.S( w1024_o ),
	.Cout( w2048_c )
);

// WEIGHT 2048 (2^11) //

one_bit_full_adder FA_w2048 (
	.A( w2048_in ),
	.B( w2048_c ),
	.Cin( w2048_in_L5 ),
	.S( w2048_o ),
	.Cout( w4096_o_L3 )
);


endmodule

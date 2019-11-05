module approx_eight_bit_wallace_tree_reduc_layer_5 (
	input [2:0] A,											// reduced 8-bit input integers
	input [7:5] B,
	input w1024_in_L6,
	input w32_in, w64_in, w128_in, w256_in, w512_in, w1024_in,    	// 1-bit adder inputs
	output w2048_o_L4,									// 1-bit propogated output to layer 4
	output w32_o, w1024_o,								// 1-bit direct output sums
	output w64_o, w128_o, w256_o, w512_o               // 1-bit adder outputs
);

wire w64_c, w128_c, w256_c, w512_c, w1024_c;


// WEIGHT 32 (2^5) //

one_bit_half_adder HA_w32 (
	.A( w32_in ),
	.B( A[0] & B[5] ),
	.S( w32_o ),
	.C( w64_c )
);

// WEIGHT 64 (2^6) //

approximate_full_adder FA_w64 (
	.A( w64_in ),
	.B( A[1] & B[5] ),
	.S( w64_o ),
	.Cout( w128_c )
);

// WEIGHT 128 (2^7) //

approximate_full_adder FA_w128 (
	.A( w128_in ),
	.B( A[2] & B[5] ),
	.Cin( w128_c ),
	.S( w128_o ),
	.Cout( w256_c )
);

// WEIGHT 256 (2^8) //

approximate_full_adder FA_w256 (
	.A( w256_in ),
	.B( A[2] & B[6] ),
  .Cin( w256_c ),
	.S( w256_o ),
	.Cout( w512_c)
);

// WEIGHT 512 (2^9) //

approximate_full_adder FA_w512 (
	.A( w512_in ),
	.B( A[2] & B[6] ),
	.Cin( w512_c ),
	.S( w512_o ),
	.Cout( w1024_c )
);

// WEIGHT 1024 (2^10) //

approximate_full_adder FA_w1024 (
	.A( w1024_in ),
	.B( w1024_c ),
	.Cin( w1024_in_L6 ),
	.S( w1024_o ),
	.Cout( w2048_c_L4 )
);

endmodule

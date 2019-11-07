module approx_eight_bit_wallace_tree_reduc_layer_6 (
	input [1:0] A,											// reduced 8-bit input integers
	input [7:6] B,
	input w512_in_L7,
	input w64_in, w128_in, w256_in, w512_in,    	// 1-bit adder inputs
	output w1024_o_L5,									// 1-bit propogated output to layer 5
	output w64_o, w512_o,								// 1-bit direct output sums
	output w128_o, w256_o               // 1-bit adder outputs
);

wire w128_c, w256_c, w512_c;


// WEIGHT 64 (2^6) //

one_bit_half_adder HA_w64 (
	.A( w64_in ),
	.B( A[0] & B[6] ),
	.S( w64_o ),
	.C( w128_c )
);

// WEIGHT 128 (2^7) //

approximate_full_adder FA_w128 (
	.A( w128_in ),
	.B( A[1] & B[6] ),
	.Cin( w128_c ),
	.S( w128_o ),
	.Cout( w256_c )
);

// WEIGHT 256 (2^8) //

approximate_full_adder FA_w256 (
	.A( w256_in ),
	.B( A[1] & B[7] ),
  .Cin( w256_c ),
	.S( w256_o ),
	.Cout( w512_c)
);

// WEIGHT 512 (2^9) //

approximate_full_adder FA_w512 (
	.A( w512_in ),
	.B( w512_c ),
	.Cin( w512_in_L7 ),
	.S( w512_o ),
	.Cout( w1024_o_L5 )
);

endmodule

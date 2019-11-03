module eight_bit_wallace_tree_reduc_layer_7 (
	input A,											// reduced 8-bit input integers
	input B,
	input w128_in, w256_in,     	// 1-bit adder inputs (from layer 1)
	output w512_o_L6,									// 1-bit propogated output to layer 1
	output w128_o, w256_o,								// 1-bit direct output sums
);

wire w256_c;


// WEIGHT 128 (2^7) //

one_bit_half_adder HA_w128 (
	.A( w128_in ),
	.B( A & B ),
	.S( w128_o ),
	.Cout( w256_c )
);

// WEIGHT 256 (2^8) //

one_bit_half_adder HA_w256 (
	.A( w256_in ),
	.B( w256_c ),
	.S( w256_o ),
	.Cout( w512_c_L6 )
);

endmodule

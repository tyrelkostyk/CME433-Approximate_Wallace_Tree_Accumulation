`include "eight_bit_wallace_tree/eight_bit_wallace_tree.v"
`include "approximate_eight_bit_wallace_tree/first_layer_approximate/papprox_eight_bit_wallace_tree.v"
`include "approximate_eight_bit_wallace_tree/fully_approximate/approx_eight_bit_wallace_tree.v"
`include "array_multiplier/eight_bit_array_multiplier.v"

`timescale 1ns / 1ns

module testbench;

bit clk;
reg [7:0] A, B;
wire [15:0] S_tree_Fapprox, S_tree_Papprox, S_tree_Exact, S_array;

int f_Tree_FApprox, f_Tree_PApprox, f_Tree_Exact, f_Array;

always #1 clk = ~clk;

initial begin
A = 8'd0;
B = 8'd0;
end

always @( posedge clk )
A = A + 8'd1;

always @ *
if ( A == 8'd0 )
	B = B + 8'd1;


approx_eight_bit_wallace_tree Tree_FApprox (
	.A(A),
	.B(B),
	.S(S_tree_Fapprox)
);

papprox_eight_bit_wallace_tree Tree_PApprox (
	.A(A),
	.B(B),
	.S(S_tree_Papprox)
);

eight_bit_wallace_tree Tree_Exact (
	.A(A),
	.B(B),
	.S(S_tree_Exact)
);

eight_bit_array_multiplier Array_Multipler (
	.A(A),
	.B(B),
	.S(S_array)
);

initial begin
f_Tree_FApprox = $fopen("./outputs/Tree_FApprox_Results.txt", "w");
f_Tree_PApprox = $fopen("./outputs/Tree_PApprox_Results.txt", "w");
f_Tree_Exact = $fopen("./outputs/Tree_Exact_Results.txt", "w");
f_Array = $fopen("./outputs/Array_Results.txt", "w");
repeat (65025) begin
	@( posedge clk );
	$fdisplay(f_Tree_FApprox, "%0d", S_tree_Fapprox);
	$fdisplay(f_Tree_PApprox, "%0d", S_tree_Papprox);
	$fdisplay(f_Tree_Exact, "%0d", S_tree_Exact);
	$fdisplay(f_Array, "%0d", S_array);
	end

	$fclose(f_Tree_FApprox);
	$fclose(f_Tree_PApprox);
	$fclose(f_Tree_Exact);
	$fclose(f_Array);

	#100 $stop;
end

endmodule

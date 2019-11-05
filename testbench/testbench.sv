`include "eight_bit_wallace_tree/eight_bit_wallace_tree.v"

module testbench;

bit clk;
reg [7:0] A, B;

always #5 clk = ~clk;

initial begin
A = 8'd0;
B = 8'd0;
end

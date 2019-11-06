module array_levels(A, B, Sin, Cin, S, C);
input A, Cin;
input [7:0] B;
input [6:0] Sin;
output [7:0] S;
output C;

wire [7:0] x;
wire [6:0] c;

assign x[0] = A & B[0];

one_bit_half_adder ha1(.A(x[0]), .B(Sin[0]), .S(S[0]), .C(c[0]));

assign x[1] = A & B[1];

one_bit_full_adder fa1(.A(x[1]), .B(Sin[1]), .Cin(c[0]), .S(S[1]), .C(c[1]));

assign x[2] = A & B[2];

one_bit_full_adder fa2(.A(x[2]), .B(Sin[2]), .Cin(c[1]), .S(S[2]), .C(c[2]));

assign x[3] = A & B[3];

one_bit_full_adder fa3(.A(x[3]), .B(Sin[3]), .Cin(c[2]), .S(S[3]), .C(c[3]));

assign x[4] = A & B[4];

one_bit_full_adder fa4(.A(x[4]), .B(Sin[4]), .Cin(c[3]), .S(S[4]), .C(c[4]));

assign x[5] = A & B[5];

one_bit_full_adder fa5(.A(x[5]), .B(Sin[5]), .Cin(c[4]), .S(S[5]), .C(c[5]));

assign x[6] = A & B[6];

one_bit_full_adder fa6(.A(x[6]), .B(Sin[6]), .Cin(c[5]), .S(S[6]), .C(c[6]));

assign x[7] = A & B[7];

one_bit_full_adder a7(.A(x[7]), .B(Cin), .Cin(c[6]), .S(S[7]), .C(C));


endmodule

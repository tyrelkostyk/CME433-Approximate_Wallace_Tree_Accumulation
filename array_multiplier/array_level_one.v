module array_level_one(A, B, S, C);
input [1:0] A;
input [7:0] B;
output [7:0] S;
output C;

wire [6:0] x;
wire [7:0] y;
wire [6:0] c;

assign x[0] = A[0] & B[1];
assign y[0] = A[1] & B[0];

one_bit_half_adder ha1(.A(x[0]), .B(y[0]), .S(S[0]), .C(c[0]));

assign x[1] = A[0] & B[2];
assign y[1] = A[1] & B[1];

one_bit_full_adder fa1(.A(x[1]), .B(y[1]), .Cin(c[0]), .S(S[1]), .C(c[1]));

assign x[2] = A[0] & B[3];
assign y[2] = A[1] & B[2];

one_bit_full_adder fa2(.A(x[2]), .B(y[2]), .Cin(c[1]), .S(S[2]), .C(c[2]));

assign x[3] = A[0] & B[4];
assign y[3] = A[1] & B[3];

one_bit_full_adder fa3(.A(x[3]), .B(y[3]), .Cin(c[2]), .S(S[3]), .C(c[3]));

assign x[4] = A[0] & B[5];
assign y[4] = A[1] & B[4];

one_bit_full_adder fa4(.A(x[4]), .B(y[4]), .Cin(c[3]), .S(S[4]), .C(c[4]));

assign x[5] = A[0] & B[6];
assign y[5] = A[1] & B[5];

one_bit_full_adder fa5(.A(x[5]), .B(y[5]), .Cin(c[4]), .S(S[5]), .C(c[5]));

assign x[6] = A[0] & B[7];
assign y[6] = A[1] & B[6];

one_bit_full_adder fa6(.A(x[6]), .B(y[6]), .Cin(c[5]), .S(S[6]), .C(c[6]));

assign y[7] = A[1] & B[7];

one_bit_half_adder ha2(.A(c[6]), .B(y[7]), .S(S[7]), .C(C));


endmodule

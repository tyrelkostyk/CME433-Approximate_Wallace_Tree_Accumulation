module one_bit_full_adder(A, B, Cin, S, Cout);
 input A, B, Cin;
 output S, Cout;

 assign S = Cin ^ (A ^ B);
 assign Cout = (Cin & (A ^ B)) || (A & B);

endmodule

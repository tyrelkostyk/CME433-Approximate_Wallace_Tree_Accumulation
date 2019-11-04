module approximate_full_adder(A, B, Cin, S, Cout);
 input A, B, Cin;
 output S, Cout;

 wire W;

 assign W = A | B;
 assign S = Cin ^ W;
 assign Cout = W & Cin;

endmodule

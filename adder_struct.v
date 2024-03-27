`timescale 1ns / 1ps 
module full_adder( A, B, Cin, S, Cout);

 input A, B, Cin;
 output S, Cout;
 wire p,q,r;
 
 xor(p,A,B);
 xor(S,p,Cin);
 and(r,A,B);
 and(q,p,Cin);
 or(Cout,q,r);
  
endmodule

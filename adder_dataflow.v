// Dataflow establishes output relationship with inputs in the form of expressions.  

`timescale 1ns / 1ps 
module full_adder( A, B, Cin, S, Cout);

 input A, B, Cin;
 output S, Cout;
 wire x,y,z;

assign x = A ^ B ;	// even one single expression can do.
assign y = x & Cin ;
assign z = A & B ;
assign S = x ^ Cin ;
assign Cout = y | z ;
  
  
endmodule

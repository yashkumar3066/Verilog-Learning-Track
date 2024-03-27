// Behavioral includes algorithmic description. Upon an event occurance it computes o/p. Expressions, switch-case, if-else ... can be used.  

`timescale 1ns / 1ps 
module full_adder( A, B, Cin, S, Cout);

 input wire A, B, Cin;
 output reg S, Cout;

  
  always @(A or B or Cin)
  begin 
   case (A | B | Cin) 
     3'b000: begin S = 0; Cout = 0; end 
     3'b001: begin S = 1; Cout = 0; end 
     3'b010: begin S = 1; Cout = 0; end 
     3'b011: begin S = 0; Cout = 1; end 
     3'b100: begin S = 1; Cout = 0; end 
     3'b101: begin S = 0; Cout = 1; end 
     3'b110: begin S = 0; Cout = 1; end 
     3'b111: begin S = 1; Cout = 1; end 
   endcase 
  end
  
  
endmodule

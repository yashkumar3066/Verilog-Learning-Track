`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 12:01:51
// Design Name: 
// Module Name: Full_adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Full_adder_tb();
reg A, B, C;
wire [1:0]Sum;
wire Cout; 

Full_adder dut(.A(A), .B(B), .Cin(C), .S(Sum), .Cout(Cout));
initial
    begin
        A=0;
        B=0;
        C=0;
        #100 $finish;
    end
    
    always #40 A=~A;
    always #20 B=~B;
    always #10 C=~C;
           
endmodule

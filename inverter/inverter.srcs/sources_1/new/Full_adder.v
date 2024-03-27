`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 11:54:28
// Design Name: 
// Module Name: Full_adder
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


module Full_adder(
input A,B, Cin,
output [1:0]S, 
output Cout,
wire x,y,z
    );

assign x= A^B;
assign S = x^Cin;
assign z=A&B; 
assign y=z&Cin;
assign Cout = y|z;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 10:56:54
// Design Name: 
// Module Name: Inverter_tb
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


module Inverter_tb();
reg A, B;
wire x,y;
Inverter inv1(A,B,x,y);

initial
    begin
        #10 A<= 1'b0;
         B<=1'b0;
        #20 A<=1'b0;
            B<=1'b1;
        #30 A<= 1'b1;
            B<= 1'b0;
        #30 A<= 1'b1;
            B<= 1'b1;
        #10 $stop;
    end


endmodule

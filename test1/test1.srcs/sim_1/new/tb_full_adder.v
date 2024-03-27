`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2023 10:59:25
// Design Name: 
// Module Name: tb_full_adder
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


module tb_full_adder();
    

reg A,B,Cin;
wire S, Cout;
full_adder dut(A,B,Cin,S,Cout);
initial
begin
   
#10
A<=1;B<=1;Cin<=0;
#10
A<=0;B<=0;Cin<=1;
#10
$finish();
end
endmodule

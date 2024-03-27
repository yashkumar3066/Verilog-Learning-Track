`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2023 10:51:56
// Design Name: 
// Module Name: full_adder
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2023 11:21:20
// Design Name: 
// Module Name: FHA
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


module HA(
    input A,B,
    output X,Y
);

xor(X,A,B);
and(Y,A,B);
endmodule


//

module full_adder(
    input A,B,Cin,
    output S, Cout
);

wire w1,w2,w3;

HA ha1(A,B,w1,w2);
HA ha2(w1,Cin,S,w3);
or(Cout, w3,w2);

endmodule

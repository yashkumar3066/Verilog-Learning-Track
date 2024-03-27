`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2023 00:54:51
// Design Name: 
// Module Name: matrix_mul
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


module ComplexMatrixMultplier(
    input [15:0] a_real[1:0][1:0], // Real parts of complex numbers
    input [15:0] a_imag[1:0][1:0], // Imaginary parts of complex numbers
    input [15:0] b_real[1:0][1:0], // Real parts of complex numbers
    input [15:0] b_imag[1:0][1:0], // Imaginary parts of complex numbers
    output [15:0] result_real[1:0][1:0], // Real parts of complex numbers
    output [15:0] result_imag[1:0][1:0] // Imaginary parts of complex numbers
);

wire [31:0] temp_real[1:0][1:0], temp_imag[1:0][1:0];

assign temp_real[0][0] = (a_real[0][0] * b_real[0][0]) - (a_imag[0][0] * b_imag[0][0]) - (a_real[0][0] * b_imag[0][1]) - (a_imag[0][0] * b_real[0][1]);
assign temp_imag[0][0] = (a_real[0][0] * b_imag[0][1]) + (a_imag[0][0] * b_real[0][1]) + (a_real[0][0] * b_real[0][0]) - (a_imag[0][0] * b_imag[0][0]);

assign temp_real[0][1] = (a_real[0][1] * b_real[1][0]) - (a_imag[0][1] * b_imag[1][0]) - (a_real[0][1] * b_imag[1][1]) - (a_imag[0][1] * b_real[1][1]);
assign temp_imag[0][1] = (a_real[0][1] * b_imag[1][1]) + (a_imag[0][1] * b_real[1][1]) + (a_real[0][1] * b_real[1][0]) - (a_imag[0][1] * b_imag[1][0]);

assign temp_real[1][0] = (a_real[1][0] * b_real[0][0]) - (a_imag[1][0] * b_imag[0][0]) - (a_real[1][0] * b_imag[0][1]) - (a_imag[1][0] * b_real[0][1]);
assign temp_imag[1][0] = (a_real[1][0] * b_imag[0][1]) + (a_imag[1][0] * b_real[0][1]) + (a_real[1][0] * b_real[0][0]) - (a_imag[1][0] * b_imag[0][0]);

assign temp_real[1][1] = (a_real[1][1] * b_real[1][0]) - (a_imag[1][1] * b_imag[1][0]) - (a_real[1][1] * b_imag[1][1]) - (a_imag[1][1] * b_real[1][1]);
assign temp_imag[1][1] = (a_real[1][1] * b_imag[1][1]) + (a_imag[1][1] * b_real[1][1]) + (a_real[1][1] * b_real[1][0]) - (a_imag[1][1] * b_imag[1][0]);

assign result_real[0][0] = temp_real[0][0];
assign result_imag[0][0] = temp_imag[0][0];
assign result_real[0][1] = temp_real[0][1];
assign result_imag[0][1] = temp_imag[0][1];
assign result_real[1][0] = temp_real[1][0];
assign result_imag[1][0] = temp_imag[1][0];
assign result_real[1][1] = temp_real[1][1];
assign result_imag[1][1] = temp_imag[1][1];

endmodule

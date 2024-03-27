`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2023 22:16:58
// Design Name: 
// Module Name: complex_matrix_multiplier
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
module complex_matrix_multiplier(
    input clk,  // Clock signal
    input [255:0] A_real,  // Real part of Matrix A, flattened
    input [255:0] A_imag,  // Imaginary part of Matrix A, flattened
    input [255:0] B_real,  // Real part of Matrix B, flattened
    input [255:0] B_imag,  // Imaginary part of Matrix B, flattened
    output reg [255:0] C_real, // Real part of result Matrix C, flattened
    output reg [255:0] C_imag  // Imaginary part of result Matrix C, flattened
);

reg [15:0] a_real_elem, a_imag_elem, b_real_elem, b_imag_elem;
reg [31:0] temp_real, temp_imag;  // Temporary variables for holding larger products

integer i, j, k;

always @(posedge clk) begin
    for (i = 0; i < 4; i = i + 1) begin
        for (j = 0; j < 4; j = j + 1) begin
            temp_real = 0;
            temp_imag = 0;
            for (k = 0; k < 4; k = k + 1) begin
                // Extracting elements from the flattened input arrays
                a_real_elem = A_real[(i*4 + k)*16 +: 16];
                a_imag_elem = A_imag[(i*4 + k)*16 +: 16];
                b_real_elem = B_real[(k*4 + j)*16 +: 16];
                b_imag_elem = B_imag[(k*4 + j)*16 +: 16];

                // Complex multiplication (a+bi)(c+di) = (ac-bd) + (ad+bc)i
                temp_real = temp_real + (a_real_elem * b_real_elem - a_imag_elem * b_imag_elem);
                temp_imag = temp_imag + (a_real_elem * b_imag_elem + a_imag_elem * b_real_elem);
            end
            C_real[(i*4 + j)*16 +: 16] = temp_real[15:0];  // Storing lower 16 bits
            C_imag[(i*4 + j)*16 +: 16] = temp_imag[15:0];  // Storing lower 16 bits
        end
    end
end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2023 14:40:46
// Design Name: 
// Module Name: tb_fft
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

module tb_FFT();
reg aclk; // Making reg type for Inputs
reg aresetn;
reg [31:0] in_data;
reg in_valid;
reg in_last;
wire in_ready;
reg [7:0] config_data;
reg config_valid;
wire config_ready; // Wire for outputs for all Groups of Stream Signals
wire [31:0] out_data;
wire out_valid;
wire out_last;
reg out_ready;
reg [31:0] input_data [15:0]; // Creating a ROM, for the input data to the FFT IP
integer i;


top_wrapper tb_in(// Wrapper for the Top Module
.aclk(aclk),
.aresetn (aresetn),
.in_data (in_data),
.in_valid (in_valid),
.in_ready (in_ready),
.in_last (in_last),
.config_data (config_data),
.config_valid (config_valid),
.config_ready (config_ready),
.out_data (out_data),
.out_valid (out_valid),
.out_last (out_last),
.out_ready (out_ready)
);
always
begin
#5 aclk= ~aclk; // CLK with 10 unit period
end
initial begin
aclk = 0;
aresetn= 0;
in_valid = 1'b0;
in_data = 32'd0;
in_last = 1'b0;
out_ready = 1'b1; // Initializing OUT READY to 1, inorder to tell the FFT
// that outputs can be generated whenever ready
// Failure to do so leads to "back-pressure"
config_data = 8'd0;
config_valid = 1'b0;
end


initial begin
#70 // As Reset needs to be activated for atleast 2 cycles ve have given 70 units of delay
aresetn = 1;
input_data [0] = 32'b00100101100011010011000100110010;
input_data [1] = 32'b00111111001111100011111010111101;
input_data [2] = 32'b00111111011111101001100011111101;
input_data [3] = 32'b00111111000101100111100100011000;
input_data[4] =  32'b10111110010101001110011011001101;
input_data [5] = 32'b10111111010111011011001111010111;
input_data [6] = 32'b10111111011100110111100001110001;
input_data [7] = 32'b10111110110100000011111111001001;
input_data [8] = 32'b00111110110100000011111111001001;
input_data [9] = 32'b00111111011100110111100001110001;
input_data [10] =32'b00111111010111011011001111010111;
input_data [11] = 32'b00111110010101001110011011001101;
input_data [12] = 32'b10111111000101100111100100011000;
input_data [13] = 32'b10111111011111101001100011111101;
input_data [14] = 32'b10111111001111100011111010111101; // Input Data generated from python
input_data [15] = 32'b10100101100011010011000100110010;
end
initial begin // Config Data initial block
#100
config_data = 1;
#5 config_valid = 1;
#5 config_valid = 0;
end


initial begin //input Port Inital Block)
    #100
    for (i = 15; i >= 0; i = i - 1) begin
        #10
        if (i == 0) begin // Last signal needs to be generated once the last data is sent
            // In this case once we reach the 0th position we can assert
            // last signal to be 1.
            in_last = 1'b1;
        end
        in_data = input_data[i]; // Passing data stored in memory to in data port
        in_valid = 1'b1; // Once data is put on the bus make the valid HIGH.
        while (in_ready == 0) begin // Waiting for AXI Handshake, for the in ready to be 1.
            in_valid = 1'b1;
        end
    end
    #10
    in_valid = 1'b0;
    in_last = 1'b0;
    // Once all the transactions are completed assert the valid and last to 0.
end

initial begin // Output Port Initial Block
#100 // Giving delay so that all the input data can be stored in ROM
wait (out_valid == 1);
#50 out_ready = 1'b0 ;
// Adding a 300 unit delay so that all the data that needs to be sent ca
end
endmodule

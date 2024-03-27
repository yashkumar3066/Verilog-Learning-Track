`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2023 22:34:42
// Design Name: 
// Module Name: uart_tx
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

module uart_tx(
    input clk_50M,
    input [7:0] data,
    output reg tx 
);

parameter bitduration = 434; // as per your calculation for the baud rate
parameter ST_rst = 0;
parameter ST_start = 1;
parameter ST_transmit = 2;
parameter ST_stop = 3; 

reg [2:0] state = ST_rst; // it's better to specify the bit width
reg [8:0] bit_duration_counter = 0;
reg [3:0] bit_counter = 0;

always @(posedge clk_50M) begin
   if(bit_duration_counter<bitduration)
   begin
    tx<=1;
    bit_duration_counter<= bit_duration_counter + 1;
   end
   if(bit_counter<8)
    begin
        if(bit_duration_counter<bitduration)
            begin
                bit_duration_counter<=bit_duration_counter + 1;
            end
            tx<=data[bit_counter] & 1'b1;
            bit_counter<=bit_counter+1;
            bit_duration_counter<= 0;
    end
end
endmodule


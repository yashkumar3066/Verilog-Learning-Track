`timescale 1ns/1ps

`include "melay.v"

module tb_melay();
reg in,rst;
wire out;
reg clk;
melay dut(in,rst,clk,out);

always begin
    clk<=0;
    #10;
    clk<=1;
    #10;
end

initial begin
    $dumpfile("melay.vcd");
    $dumpvars;
   
    rst <= 1;
    #20 rst<=0; 
    #20 in<=0;
    #20 in<=1;
    #20 in<=0;
    #20 in<=1;
    #20 in<=0;
    #20 $finish;
end

endmodule
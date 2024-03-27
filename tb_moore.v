`timescale 1ns / 1ps
`include "seq_det_moore.v"

module tb();
reg x,clk,rst;
wire y;
seq_det_moore DET(clk,rst,x,y);

always
	begin
		clk<=0;
		#10;
		clk<=1;
		#10;
	end
initial 
	begin 
		$dumpfile("moore.vcd");
		$dumpvars;
		#300 $finish;
	end
initial
	begin
		rst<=1;
		#20 rst <= 0;
		#20 x<=1;
		#20 x<=1;
		#20 x<=0;
		#20 x<=1;
		#20 x<=0;
		#20 x<=1;
		#20 x<=1;
		#20 x<=1;
		#20 x<=0;
		#20 x<=1;
		#20 x<=1;
		#20 x<=0;
	end
endmodule
//`timescale 1ns / 1ps
`include "instr_exec.v"

module memory(input clk,r, w, input [7:0] PC, inout [7:0] data);
reg [7:0] mem[2:0];
reg [7:0] tmp_data;
initial mem[0] = 8'h55;
initial mem[1] = 8'hAA;
initial mem[2] = 8'h00;
  always @ (posedge clk) begin
    if (w)
      mem[PC] <= data;
  end

  always @ (posedge clk) begin
    if (r)
    	tmp_data <= mem[PC];
  end 
  assign data = tmp_data;
endmodule


module tb_instr_exec(input CLK, RST_N);

reg clk, rst;
wire r,w;
wire [7:0] PC;
wire [7:0] data;
memory M(clk,r,w,PC,data);
processor DUT(clk,rst,data,r,w,PC);

always
	begin
		clk <= 0;
		#5;
		clk <= 1;
		#5;
	end
	
initial 
    	begin
    		$dumpfile("xyz.vcd");
     		$dumpvars;
     		#100 $finish;
     	end

initial
        begin
            rst <= 1;
            #20 rst <= 0;
                        
        end
	
endmodule
		

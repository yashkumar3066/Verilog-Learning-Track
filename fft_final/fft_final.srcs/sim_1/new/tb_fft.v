`timescale 1ps/1ps
module testbench;
reg clk;
reg [8:0] x0,x1,x2,x3,x4,x5,x6,x7;
reg [2:0] sel;
wire [8:0] yr,yi;
fft fft(.x0(x0),.x1(x1),.x2(x2),.x3(x3),.x4(x4),.x5(x5),.x6(x6),.x7(x7),.clk(clk),.sel(sel),.yr(yr),.yi(yi));
parameter clkper = 10;
initial
   begin
   clk = 1;
   end
always
   begin
      #(clkper/2) clk = ~clk;
   end

initial
	begin
	//feed input
		assign x0=9'b000000001;//0
		assign x1=9'b000000000;//1
		assign x2=9'b000000000;//2
		assign x3=9'b000000000;//3
		assign x4=9'b000000000;//4
		assign x5=9'b000000000;//5
		assign x6=9'b000000000;//6
		assign x7=9'b000000000;//7
	//the sel pin is used to get the outputs in a particular order. Once the inputs are given, the FFT module calculates and waits for the sel pin to give inputs in a particular order. When the sel pin gives a particular input the output corresponding to that input is given as output.
		#10
		sel = 3'b000;
		#10
		sel = 3'b001;
		#10
		sel = 3'b010;
		#10
		sel = 3'b011;
		#10
		sel = 3'b100;
		#10
		sel = 3'b101;
		#10
		sel = 3'b110;
		#10
		sel = 3'b111;
   end
endmodule
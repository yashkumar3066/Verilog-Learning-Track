module seq_det_moore(input clk, rst, x, output y);

reg y;
reg [1:0] state, next_state;
parameter a = 2'b00, b=2'b01, c=2'b10, d=2'b11;

always @(posedge clk)
	begin
		if(rst) state <=a;
		else state <= next_state;
	end

always @(x,state)
	
	case(state)
	a:
		begin
			if(x) next_state = b;
			else next_state = a;
		end
	b:
		begin
			if(x) next_state = c;
			else next_state = a;
		end
	c:
		begin
			if(x) next_state=c;
			else next_state =d;
		end
	d:
		begin
			if(x) next_state =b;
			else next_state =a;
		end
	endcase
always @(state)
	
	case(state)
		a: y=0;
		b: y=0;
		c: y=0;
		d: y=1;
	endcase
endmodule

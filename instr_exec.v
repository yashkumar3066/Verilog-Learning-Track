
module processor(input clk, rst, inout [7:0] data, output r, w, output [7:0] PC);

reg [7:0] IR, R0, R1, R2, PC;
reg [7:0] tmp_data;
initial PC = 8'h00;
initial R0 = 8'h20;
initial R1 = 8'h15;
initial R2 = 8'h00;
initial IR = 8'h00;
reg [2:0] state, next_state;
reg r,w;
initial r = 0;
initial w = 0;
parameter
fetch = 3'b000, decode = 3'b001, execute_add = 3'b010, execute_sub = 3'b011, store = 3'b100;

always @(posedge clk)
	begin
		if(rst) state = fetch;
		else state = next_state;
	end
	
always @(state)

	case(state)
	fetch:	
		begin 
			w <= 0;
			r <= 1;
			next_state = decode;
		end		
	decode:
		begin
			#1
			IR <= data;
			#1
			if(IR == 8'h55) next_state = execute_add;
			else if(IR == 8'hAA) next_state = execute_sub;
			else next_state = decode;
			r <= 0;
		end
	execute_add:
		begin
			R2 <= R1 + R0;
			next_state = store;
		end
	execute_sub:
		begin
			R2 <= R1 - R0;
			next_state = store;
		end	
	store:
		begin
			tmp_data <= R2;
			w <= 0; // to write result back make w <= 1, but next instr gets corrupt
			next_state = fetch;
			PC <= PC + 1;
		end				
	endcase
assign data = !r & w ? tmp_data : 'hz;
endmodule
		

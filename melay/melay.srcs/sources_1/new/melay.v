`timescale 1ns/1ps

module melay(
input  in, rst,clk,
output out

);
//state assignment
parameter ST_zero = 1'b0;
parameter ST_one = 1'b1;
reg out;
//assign registers
reg state, next_state;
//logic of fsm
always @(posedge clk )  //state updatation
    
    if(rst)begin
       state <= ST_zero; 
    end
    else begin
        state <= next_state;
    end

always @( in, state)  //state computation and yput
  case (state)
    ST_zero:begin
        if(in)begin
            out <= 1'b1;
            next_state=ST_one;
            
        end
        else begin
            out <= 1'b0;
            next_state=state;
            end
    end
    ST_one: begin
        if(in)begin
            out <= 1'b1;
            next_state= state;
        end
        else begin
            out <= 1'b0;
            next_state = ST_zero;
        end
    end
endcase  




endmodule
// AstroTinker Bot : Task 1C : Pulse Generator and Detector
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.

This file is used to design a module which will generate a 10us pulse and detect incoming pulse signal.

Recommended Quartus Version : 20.1
The submitted project file must be 20.1 compatible as the evaluation will be done on Quartus Prime Lite 20.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

// t1c_pulse_gen_detect
//Inputs : clk_50M, reset, echo_rx
//Output : trigger, distance, pulses, state

// module declaration
module t1c_pulse_gen_detect (
    input clk_50M, reset, echo_rx,
    output reg trigger, out,
    output reg [21:0] pulses,
    output reg [1:0] state
);

initial begin
    trigger = 0; out = 0; pulses = 0; state = 0;
end


//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE//////////////////
parameter oneus =50;
parameter tenus = 500;
parameter onems = 50000;
parameter warmup = 0;
parameter triggerState = 1;
parameter reading = 2;
parameter outputStage = 3;
reg[5:0] delay_counter = 0;
reg[8:0] trigger_counter = 0;
reg[19:0] pulse_read  = 0;
reg[19:0] trigger_super_counter = 0;
 

always @(posedge clk_50M) begin
	if(reset) begin
		delay_counter <= 0;	
		trigger_counter <= 0;
		pulse_read <= 0;
		pulses = 0;
		out <=0;
		trigger_super_counter <=0;
	end
	else if(delay_counter< oneus) begin
		state = warmup;
		delay_counter <= delay_counter + 1;
		trigger_counter <=0; 
	end
	else if(trigger_counter<tenus) begin
		trigger<=1;
		trigger_counter <= trigger_counter + 1;
		state = triggerState;
	end
	else if(trigger_super_counter < onems)begin
		trigger_super_counter <= trigger_super_counter + 1 ;
		state = reading;
		if (echo_rx)begin
			trigger <= 0;
			pulse_read <= pulse_read+1;
			pulses = pulse_read;
			
			end
		end	
	else if(pulse_read == 29410) begin
			trigger<=0;
			out <= 1;
			state = outputStage;
			pulse_read = 0;
		end
	else if(trigger_super_counter == onems) begin
	trigger_counter <=0;
	trigger_super_counter <=0;
	delay_counter <=1;
		end
	end	
//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE//////////////////

endmodule
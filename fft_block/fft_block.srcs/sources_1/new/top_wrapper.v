`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2023 14:31:41
// Design Name: 
// Module Name: top_wrapper
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


module top_wrapper(
input aclk,
input aresetn,

input [31:0]in_data, // Input Data Stream
input in_valid,
input in_last,
output in_ready,

input [7:0]config_data, // Config Data Stream
input config_valid,
output config_ready,

output [31:0]out_data, // Output Data Stream
output out_valid,
output out_last,
input out_ready
);

wire [63:0]data_fft; // FFT IP takes 64bit data, so padding the upper 32-bits with 0's.
assign data_fft[63:32] = 32'd0;
assign data_fft[31:0] = in_data; // Real Data from the Input Stream

wire [63:0]out_fft; // Output of FFT is 64 bit

wire
event_frame_started,
event_tlast_unexpected,
event_tlast_missing,
event_status_channel_halt,
event_data_in_channel_halt,
event_data_out_channel_halt; // Additional Event Signals

FFT FFT(
.aclk(aclk), // input vire aclk
.aresetn(aresetn), // input vire aresetn
.s_axis_config_tdata(config_data), // input wire [70] s_axis_config_tdata
.s_axis_config_tvalid(config_valid), // input vire s_axis_config_tvalid
.s_axis_config_tready(config_ready), // output vire s_axis_config_tready
.s_axis_data_tdata(data_fft), // input vire [63: 01 s axis_data_tdata
.s_axis_data_tvalid(in_valid), // input vire s_axis_data_tvalid
.s_axis_data_tready(in_ready), // output vire s_axis_data_tready
.s_axis_data_tlast(in_last), // input vire s_axis_data_tlast
.m_axis_data_tdata(out_fft), // output vire [63: 01 m_axis_data_tdata
.m_axis_data_tvalid(out_valid), // output vire maxis_data_ tvalid
.m_axis_data_tready(out_ready), // input vire m_axis_data_tready
.m_axis_data_tlast(out_last), // output vire m_axis_data_tlast
.event_frame_started(event_frame_started), // output vire event_frame_started
.event_tlast_unexpected(event_tlast_unexpected), // output vire event_tlast_unexpected
.event_tlast_missing(event_tlast_missing), // output vire event_tlast_missing
.event_status_channel_halt(event_status_channel_halt), // output wire event_status_channel_halt
.event_data_in_channel_halt(event_data_in_channel_halt), // output vire event_data_in_channel_halt
.event_data_out_channel_halt(event_data_out_channel_halt) // output vire event_data_out_channel_halt
);

assign out_data = out_fft[31:0]; // Last 32-bits being displayed. As real part is needed.
endmodule

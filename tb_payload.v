`timescale 1ns / 1ps
`include "payload.v"
module PacketProcessor_tb;

// Parameters
localparam DATA_WIDTH = 32;
localparam MEMORY_DEPTH = 381;
localparam HEADER_WIDTH = 32;
localparam FOOTER_WIDTH = 32;

// Testbench Signals
reg tb_clock;
reg tb_resetn;
reg [DATA_WIDTH-1:0] tb_dataIn;
reg tb_validIn;
reg tb_lastIn;
wire [DATA_WIDTH-1:0] tb_dataOut;
wire tb_validOut;
wire tb_lastOut;

// Instance of PacketProcessor
PacketProcessor uut (
    .clock(tb_clock),
    .resetn(tb_resetn),
    .dataIn(tb_dataIn),
    .validIn(tb_validIn),
    .lastIn(tb_lastIn),
    .dataOut(tb_dataOut),
    .validOut(tb_validOut),
    .lastOut(tb_lastOut)
);

// Clock generation
initial begin
    tb_clock = 0;
    forever #5 tb_clock = ~tb_clock; // 100MHz Clock
end

// Test sequence
initial begin
    $dumpfile("payload.vcd");
    $dumpvars;

    // Initialize Inputs
    tb_resetn = 0;
    tb_dataIn = 0;
    tb_validIn = 0;
    tb_lastIn = 0;

    // Wait for global reset
    #100;
    tb_resetn = 1;

    // Send packets
    send_packet(10);
    send_packet(20);
    send_packet(MEMORY_DEPTH);

    // Finish testbench
    #100;
    $finish;
end

// Task to send a packet of specified length
task send_packet;
    input integer length;
    integer i;
    begin
        tb_validIn = 1;
        for (i = 0; i < length; i = i + 1) begin
            tb_dataIn = $random;
            tb_lastIn = (i == length - 1) ? 1'b1 : 1'b0;
            #10; // Wait for one clock cycle
        end
        tb_validIn = 0;
        tb_lastIn = 0;
        #20; // Wait before sending next packet
    end
endtask

// Monitor
initial begin
    $monitor("Time=%t, resetn=%b, dataIn=%h, validIn=%b, lastIn=%b, dataOut=%h, validOut=%b, lastOut=%b",
             $time, tb_resetn, tb_dataIn, tb_validIn, tb_lastIn, tb_dataOut, tb_validOut, tb_lastOut);
end

endmodule

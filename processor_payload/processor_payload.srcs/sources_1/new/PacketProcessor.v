`timescale 1ns / 1ps

module PacketProcessor(
    input clock,
    input resetn,
    input [31:0] dataIn,
    input validIn,
    input lastIn,
    output reg [31:0] dataOut,
    output reg validOut,
    output reg lastOut
);

// Define the states
localparam IDLE = 0,
           COLLECT_DATA = 1,
           SEND_HEADER = 2,
           SEND_PAYLOAD = 3,
           SEND_FOOTER = 4;

// Internal Registers and Wires
reg [2:0] state = IDLE; // State should have enough bits to encode all states
reg [15:0] sequence_number = 0;
reg [15:0] word_count = 0;
reg [31:0] memory [0:380]; // Memory to store up to 381 words
reg [31:0] header;
integer i; // Loop variable for memory initialization

// Header and Footer
wire [31:0] footer = 32'hFFFFFFFF; // Static footer with all 1's

// State transition and output logic
always @(posedge clock or negedge resetn) begin
    if (!resetn) begin
        // Synchronous reset
        state <= IDLE;
        sequence_number <= 0;
        word_count <= 0;
        validOut <= 0;
        lastOut <= 0;
        // Initialize memory to zero
        for (i = 0; i <= 380; i = i + 1) begin
            memory[i] <= 32'd0;
        end
    end else begin
        // State transitions
        case (state)
            IDLE: begin
                if (validIn) begin
                    state = COLLECT_DATA;                   
                end
            end
            COLLECT_DATA: begin
                word_count<=0;
                if (validIn) begin
                    // Store incoming data
                    memory[word_count] <= dataIn;
                    word_count <= word_count + 1;
                    if (lastIn) begin
                        // Prepare the header
                        header <= {sequence_number, word_count};
                        // Move to next state to send header
                        state = SEND_HEADER;
                    end
                end
            end
            SEND_HEADER: begin
                // Send the header
                dataOut <= header;
                validOut <= 1;
                lastOut <= 0;
                // Move to next state to send payload
                state = SEND_PAYLOAD;
                i <= 0; // Reset index to start sending payload
            end
            SEND_PAYLOAD: begin
                // Send the payload
                dataOut <= memory[i];
                validOut <= 1;
                if (i >= word_count - 1) begin
                    // All payload has been sent, prepare to send footer
                    state = SEND_FOOTER;
                    lastOut <= 0; // Footer is not the last word yet
                end else begin
                    i <= i + 1;
                end
            end
            SEND_FOOTER: begin
                // Send the footer
                dataOut <= footer;
                validOut <= 1;
                lastOut <= 1; // Footer is the last word of the packet
                // Prepare for next packet
                state = IDLE;
                sequence_number <= sequence_number + 1; // Increment sequence number for next packet
                word_count <= 0; // Reset word count for next packet
            end
        endcase
    end
end

endmodule

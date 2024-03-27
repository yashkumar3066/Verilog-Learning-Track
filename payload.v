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
reg [1:0] state, next_state;
reg [15:0] sequence_number;
reg [15:0] word_count;
reg [31:0] memory [0:380]; // Memory to store up to 381 words
reg [31:0] header;
integer i; // Loop variable for memory initialization

// Header and Footer
wire [31:0] footer = 32'hFFFFFFFF; // Static footer with all 1's

// State transition and output logic
always @(posedge clock or negedge resetn) begin
    if (!resetn) begin
        state <= IDLE;
        sequence_number <= 0;
        word_count <= 0;
        validOut <= 0;
        lastOut <= 0;
        // Initialize memory to zero
        for (i = 0; i < 381; i = i + 1) begin
            memory[i] <= 32'd0;
        end
    end else begin
        case (state)
            IDLE: begin
                if (validIn) begin
                    state <= COLLECT_DATA;
                    word_count <= 0;
                end
            end
            COLLECT_DATA: begin
                if (validIn) begin
                    // Store incoming data
                    memory[word_count] <= dataIn;
                    word_count <= word_count + 1;
                    if (lastIn) begin
                        // Prepare the header
                        header <= {sequence_number, word_count};
                        sequence_number <= sequence_number + 1;
                        state <= SEND_HEADER;
                    end
                end
            end
            SEND_HEADER: begin
                dataOut <= header;
                validOut <= 1;
                lastOut <= 0;
                state <= SEND_PAYLOAD;
                i <= 0; // Reset memory index
            end
            SEND_PAYLOAD: begin
                dataOut <= memory[i];
                validOut <= 1;
                lastOut <= 0;
                if (i >= word_count - 1) begin // Check if all words have been sent
                    state <= SEND_FOOTER;
                end else begin
                    i <= i + 1;
                end
            end
            SEND_FOOTER: begin
                dataOut <= footer;
                validOut <= 1;
                lastOut <= 1;
                state <= IDLE;
            end
            default: begin
                state <= IDLE;
            end
        endcase
    end
end

endmodule
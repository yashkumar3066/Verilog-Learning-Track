`timescale 1ns/1ps

module uart_tx_tb; // testbench module, no need for ports

    reg clk_50M; // Clock signal
    reg [7:0] data; // Data to be transmitted
    wire tx; // Transmission output

    // Instantiate the module to be tested
    uart_tx uut (
        .clk_50M(clk_50M),
        .data(data),
        .tx(tx)
    );

    // Clock process
    always begin
        #10 clk_50M = ~clk_50M; // Generating clock signal with period of 20ns assuming clk_50M is 50MHz
    end

    // Stimulus process
    initial begin
        clk_50M = 0; // Initial clock state
        data = 8'h00; // Initial data

        // Apply stimulus to inputs
        #100; // Wait for 100ns for system to stabilize
        data = 8'b01010101; // Test with a random data value, for example 0xAF
        #1000; // Wait and observe the output
        
        data = 8'h5A; // Change data to another value, e.g., 0x5A
        #1000; // Wait and observe the output

        $finish; // Stop the simulation
    end

    // You may want to add more test vectors and potentially any edge cases
    // that you believe are necessary to fully verify the functionality.

endmodule

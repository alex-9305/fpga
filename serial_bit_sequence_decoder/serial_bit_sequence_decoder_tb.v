`include "serial_bit_sequence_decoder.v"
`timescale 1us/1ns

module serial_bit_sequence_decoder_tb;
    reg in_bit = 1'b0;
    reg n_reset = 1'b0;
    reg clk = 1'b0;

    serial_bit_sequence_decoder dut
    (
        .in_bit(in_bit),
        .n_reset(n_reset),
        .clk(clk)
    );

    initial begin
        $dumpfile("serial_bit_sequence_decoder.vcd");
        $dumpvars(0, serial_bit_sequence_decoder_tb);
    end

    initial begin
        forever begin
            #10
            clk = ~clk;
        end
    end

    initial begin
        #44
        n_reset <= 1'b1;
        #45
        in_bit <= 1'b1;
        #45
        in_bit <= 1'b1;
        #45
        in_bit <= 1'b1;
        #45
        in_bit <= 1'b0;
        #45
        in_bit <= 1'b0;
        #45
        in_bit <= 1'b0;
        #45
        in_bit <= 1'b1;
        #45
        in_bit <= 1'b0;
        #45
        in_bit <= 1'b0;
        #45
        in_bit <= 1'b1;
        #12
        n_reset <= 1'b1;
        #45
        in_bit <= 1'b0;
        #45
        in_bit <= 1'b0;
        #10
        $display("Test Complete");
        $finish;
    end

endmodule
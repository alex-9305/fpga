`include "count_up_16_bit_range_check.v"
`timescale 1us/1ns

module count_up_16_bit_range_check_tb;
    reg n_rst = 1'b0;
    reg clk = 1'b0;
    reg enable = 1'b1;

    count_up_16_bit_range_check dut
    (
        .n_rst(n_rst),
        .clk(clk),
        .enable(enable)
    );

    initial begin
        $dumpfile("count_up_16_bit_range_check.vcd");
        $dumpvars(0, count_up_16_bit_range_check_tb);
    end

    initial begin
        forever begin
            #1
            clk = ~clk;
        end
    end

    initial begin
        #56
        n_rst <= 1'b1;
        #200000
        n_rst <= 1'b0;
        #22
        $display("Test Complete");
        $finish;
    end

endmodule
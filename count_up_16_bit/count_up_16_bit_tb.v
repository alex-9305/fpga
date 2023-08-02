`include "count_up_16_bit.v"
`timescale 1us/1ns

module count_up_16_bit_tb;
    reg n_rst = 1'b0;
    reg clk = 1'b0;

    count_up_16_bit dut
    (
        .n_rst(n_rst),
        .clk(clk)
    );

    initial begin
        $dumpfile("count_up_16_bit.vcd");
        $dumpvars(0, count_up_16_bit_tb);
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
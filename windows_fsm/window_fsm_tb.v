`include "window_fsm.v"
`timescale 1us/1ns

module window_fsm_tb;
    reg button_press = 1'b0;
    reg n_reset = 1'b0;
    reg clk = 1'b0;

    window_fsm dut
    (
        .button_press(button_press),
        .n_reset(n_reset),
        .clk(clk)
    );

    initial begin
        $dumpfile("window_fsm.vcd");
        $dumpvars(0, window_fsm_tb);
    end

    initial begin
        forever begin
            #10
            clk = ~clk;
        end
    end

    initial begin
        #56
        n_reset <= 1'b1;
        #14
        button_press <= 1'b1;
        #46
        button_press <= 1'b0;
        #22
        button_press <= 1'b1;
        #1
        button_press <= 1'b0;
        #10
        n_reset <= 1'b0;
        #22
        button_press <= 1'b1;
        #66
        button_press <= 1'b0;
        #10
        $display("Test Complete");
        $finish;
    end

endmodule
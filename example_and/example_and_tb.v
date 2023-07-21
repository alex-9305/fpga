`include "example_and.v"
`timescale 1us/1ns

module example_and_tb;
    reg input_1    = 1'b0;
    reg input_2   = 1'b0;
    wire and_result;

    example_and_gate dut
        (
            .input_1(input_1),
            .input_2(input_2),
            .and_result(and_result)
        );

    initial begin
        $dumpfile("example_and_test.vcd");
        $dumpvars(0, example_and_tb);
    end

    initial begin
        #10
        input_1 <= 1'b1;
        #10
        input_2 <= 1'b1;
        #10
        input_1 <= 1'b0;
        #10
        input_2 <= 1'b0;
        #20
        input_1 <= 1'b1;
        input_2 <= 1'b1;
        #10
        $display("Test Complete");
    end
endmodule


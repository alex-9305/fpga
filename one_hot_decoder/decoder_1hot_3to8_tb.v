`include "decoder_1hot_3to8.v"
`timescale 1us/1ns

module decoder_1hot_3to8_tb;
    reg in_tb [2:0] = 3'b000;

    decoder_1hot_3to8 DUT
        (
            .in(in_tb)
        );

    initial begin
        $dumpfile("decoder_1hot_3to8.vcd");
        $dumpvars(0, decoder_1hot_3to8);
    end

    initial begin
        in_tb <= 3'b000;
        #10
        in_tb <= 3'b001;
        #10
        in_tb <= 3'b010;
        #10
        in_tb <= 3'b011;
        #10
        in_tb <= 3'b100;
        #10
        in_tb <= 3'b101;
        #10
        in_tb <= 3'b110;
        #10
        in_tb <= 3'b111;
        #10
        $display("Test Complete");
    end
endmodule


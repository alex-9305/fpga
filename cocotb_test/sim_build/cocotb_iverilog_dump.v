module cocotb_iverilog_dump();
initial begin
    $dumpfile("sim_build/serial_bit_sequence_decoder.fst");
    $dumpvars(0, serial_bit_sequence_decoder);
end
endmodule

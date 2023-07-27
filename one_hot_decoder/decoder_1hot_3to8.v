module decoder_1hot_3to8
    (
        output  wire [7:0] f,
        input   wire [2:0] in
    );
    assign f =  (in == 3'b000) ? 8'b0000_0001 :
                (in == 3'b001) ? 8'b0000_0010 :
                (in == 3'b010) ? 8'b0000_0100 :
                (in == 3'b011) ? 8'b0000_1000 :
                (in == 3'b100) ? 8'b0001_0000 :
                (in == 3'b101) ? 8'b0010_0000 :
                (in == 3'b110) ? 8'b0100_0000 :
                (in == 3'b111) ? 8'b1000_0000 :
                8'bXXXX_XXXX;
endmodule
module count_up_16_bit
    (
        input wire clk, n_rst,
        output reg [15:0] count_out
    );

    always @(posedge clk or negedge n_rst) begin
        if (n_rst == 1'b0) begin
            count_out = 16'h0000;
        end else begin
            count_out <= count_out + 1'b1;
        end
    end


endmodule
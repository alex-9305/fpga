module count_up_16_bit_range_check
    (
        input wire clk, n_rst, enable,
        output reg [15:0] count_out
    );

    always @(posedge clk or negedge n_rst or posedge enable) begin
        if (enable == 1'b0) begin
            count_out <= 16'h0000;
        end else begin
            if (n_rst == 1'b0) begin
                count_out <= 16'h0000;
            end else begin
                count_out <= count_out + 1'b1;
                if (count_out >= 16'hEA60) begin
                    count_out <= 16'h0000;
                end
            end
        end
    end


endmodule
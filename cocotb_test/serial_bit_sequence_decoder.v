module serial_bit_sequence_decoder
    (
        input   wire    clk, n_reset, in_bit,
        output  reg     error_state
    );

    localparam  START = 3'b000,
                D0_IS_1 = 3'b001,
                D1_IS_1 = 3'b010,
                D0_NOT_1 = 3'b011,
                D1_NOT_1 = 3'b100,
                FAULTY_STATE = 3'b101;

    reg [2:0] current_state = START;
    reg [2:0] next_state = START;

    // current_state
    always @(clk) begin
        if (n_reset == 1'b0) begin
            current_state <= START;
        end else begin
            current_state <= next_state;
        end
    end

    // next_state
    always @(current_state, n_reset, in_bit) begin
        if (n_reset == 1'b0) begin
            next_state <= START;
        end else begin
            case(current_state)
                START:
                    if (in_bit == 1'b0) begin
                        next_state <= D0_NOT_1;
                    end else begin
                        next_state <= D0_IS_1;
                    end
                D0_IS_1:
                    if (in_bit == 1'b0) begin
                        next_state <= D1_NOT_1;
                    end else begin
                        next_state <= D1_IS_1;
                    end
                D1_IS_1:
                    if (in_bit == 1'b0) begin
                        next_state <= START;
                    end else begin
                        next_state <= START;
                    end
                D0_NOT_1:
                    next_state <= D1_NOT_1;
                D1_NOT_1:
                    next_state <= START;
                default:
                    next_state <= FAULTY_STATE;
            endcase
        end
    end

    // output
    always @(current_state, n_reset, in_bit) begin
        if (n_reset == 1'b0) begin
            error_state <= 1'b0;
        end else begin
            case(current_state)
                D1_IS_1:
                    if (in_bit == 1'b0) begin
                        error_state <= 1'b0;
                    end else begin
                        error_state <= 1'b1;
                    end
                default:
                    error_state <= 1'b0;
            endcase
        end
    end

    initial begin
        $dumpfile ("serial_bit_sequence_decoder.vcd");
        $dumpvars (0, serial_bit_sequence_decoder);
    end


endmodule
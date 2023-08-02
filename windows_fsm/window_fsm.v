module window_fsm
    (
        input   wire button_press, n_reset, clk,
        output  reg open_cw, close_ccw
    );

    localparam  STATE_CLOSED = 1'b0,
                STATE_OPENED = 1'b1;

    reg next_state = STATE_CLOSED;
    reg current_state = STATE_CLOSED;

    //next state logic
    always @(current_state, button_press) begin
        case(current_state)
            STATE_CLOSED:
                if(button_press == 1'b0) begin
                    next_state = STATE_CLOSED;
                end else begin
                    next_state = STATE_OPENED;
                end
            STATE_OPENED:
                if(button_press == 1'b0) begin
                    next_state = STATE_OPENED;
                end else begin
                    next_state = STATE_CLOSED;
                end
        endcase
    end

    //output logic
    always @(current_state, button_press) begin
        case(current_state)
            STATE_CLOSED:
                if(button_press == 1'b0) begin
                    close_ccw = 1'b0;
                    open_cw = 1'b0;
                end else begin
                    close_ccw = 1'b0;
                    open_cw = 1'b1;
                end
            STATE_OPENED:
                if(button_press == 1'b0) begin
                    open_cw = 1'b0;
                    close_ccw = 1'b0;
                end else begin
                    open_cw = 1'b0;
                    close_ccw = 1'b1;
                end
        endcase
    end

    //current state logic
    always @(posedge clk) begin
        if (n_reset == 0) begin
            current_state <= STATE_CLOSED;
        end else begin
            current_state <= next_state;
        end
    end

endmodule
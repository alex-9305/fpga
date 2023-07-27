module window_fsm
    (
        input   wire button_press, n_reset, clk,
        output  wire open_cw, close_ccw
    );

    localparam  STATE_CLOSED = 1'b0,
                STATE_OPENED = 1'b1;

    wire next_state = STATE_CLOSED;
    reg current_state = STATE_CLOSED;

    //next state logic
    assign next_state = ((current_state == STATE_CLOSED) && (button_press == 1'b0)) ? STATE_CLOSED:
                        ((current_state == STATE_CLOSED) && (button_press == 1'b1)) ? STATE_OPENED:
                        ((current_state == STATE_OPENED) && (button_press == 1'b0)) ? STATE_OPENED:
                        ((current_state == STATE_OPENED) && (button_press == 1'b1)) ? STATE_CLOSED:
                        1'bX;

    //current state logic
    always @(posedge clk) begin
        if (n_reset == 0) begin
            current_state <= STATE_CLOSED;
        end else begin
            current_state <= next_state;
        end
    end

    //output logic
    assign open_cw =    ((current_state == STATE_CLOSED) && (button_press == 1'b0)) ? 1'b0:
                        ((current_state == STATE_CLOSED) && (button_press == 1'b1)) ? 1'b1:
                        (current_state == STATE_OPENED) ? 1'b0:
                        1'bX;

    assign close_ccw =  ((current_state == STATE_OPENED) && (button_press == 1'b0)) ? 1'b0:
                        ((current_state == STATE_OPENED) && (button_press == 1'b1)) ? 1'b1:
                        (current_state == STATE_CLOSED) ? 1'b0:
                        1'bX;

endmodule
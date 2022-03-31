`timescale 1ns/100ps

module shift_pipe #(
    parameter WIDTH = 2,
    parameter DEPTH = 4
)(
    input clk,
    input rst_n,
    input valid_in,
    input [WIDTH-1:0] pipe_in,
    output [WIDTH-1:0] pipe_out
);
    logic [DEPTH*WIDTH-1:0] pipe_reg;
    always_ff @(posedge clk) begin
        if (~rst_n) begin
            pipe_reg <= '0;
        end else if (valid_in) begin
            //pipe_reg <= {pipe_reg[WIDTH+:(DEPTH*WIDTH)-WIDTH], pipe_in};
            pipe_reg <= {pipe_reg[(DEPTH - 1)*WIDTH : 0], pipe_in};
        end
    end

    assign pipe_out = pipe_reg[(WIDTH*DEPTH)-1-:WIDTH];
endmodule

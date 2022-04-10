/* Extend divfunc.v with signed support:
*   if the first bit is 1, convert number,
*   divide as unsigned, than convert back
*/


`timescale 1ns/100ps
`define PIPE_OFFSET 3


module SignedDivide #(
    parameter [32-1:0]  STAGE_LIST    = 0,
    parameter DEPTH = 20
) (
    input                      clk,
    input                      rst,

    input  [`SIZE_DATA-1:0]    a,
    input                      a_signed,
    input  [`SIZE_DATA-1:0]    b,
    input                      b_signed,
    input                      vld,


    output logic [`SIZE_DATA-1:0]    quo,
    output logic [`SIZE_DATA-1:0]    rem,
    output                     ack
);


logic [`SIZE_DATA-1:0] unsigned_a;
logic [`SIZE_DATA-1:0] unsigned_b;
//delayed with 1
logic [`SIZE_DATA-1:0] a_d;
logic [`SIZE_DATA-1:0] b_d;

logic [`SIZE_DATA-1:0] unsigned_quo;
logic [`SIZE_DATA-1:0] unsigned_rem;

logic a_negative;
logic b_negative;
logic b_zero;
logic [`SIZE_DATA-1:0] rem_div0;

logic [(DEPTH-`PIPE_OFFSET)-1:0] a_neg_shift_reg;
logic [(DEPTH-`PIPE_OFFSET)-1:0] b_neg_shift_reg;
logic [(DEPTH-`PIPE_OFFSET)-1:0] b_zero_shift_reg;

//convert a
always_ff@(posedge clk) begin
    // negative if starts with 1,
    // and is signed
    a_negative <= a_signed & a[`SIZE_DATA-1];
    a_neg_shift_reg <= {a_neg_shift_reg[(DEPTH-`PIPE_OFFSET)-2:0], a_negative};
    a_d <= a;
    if(a_negative)
        unsigned_a <= ~a_d + 1;
    else
        unsigned_a <= a_d;
end

//convert b
always_ff@(posedge clk) begin
    // negative if starts with 1,
    // and is signed
    b_negative <= b_signed & b[`SIZE_DATA-1];
    b_zero <= (b == 0);
    b_zero_shift_reg <= {b_zero_shift_reg[(DEPTH-`PIPE_OFFSET)-2:0], b_zero};
    b_neg_shift_reg <= {b_neg_shift_reg[(DEPTH-`PIPE_OFFSET)-2:0], b_negative};
    b_d <= b;
    if(b_negative)
        unsigned_b <= ~b_d + 1;
    else
        unsigned_b <= b_d;
end

//convert back quotient and remainder
always_ff@(posedge clk) begin
    if(b_zero_shift_reg[DEPTH-`PIPE_OFFSET - 1]) begin
        quo <= '1;
        rem <= rem_div0;
    end
    else if(a_neg_shift_reg[(DEPTH-`PIPE_OFFSET)-1] & b_neg_shift_reg[(DEPTH-`PIPE_OFFSET)-1]) begin
        quo <= unsigned_quo;
        rem <= ~unsigned_rem + 1;
    end
    else if(~a_neg_shift_reg[(DEPTH-`PIPE_OFFSET)-1] & b_neg_shift_reg[(DEPTH-`PIPE_OFFSET)-1]) begin
        quo <= ~unsigned_quo + 1;
        rem <= unsigned_rem;
    end
    else if(a_neg_shift_reg[(DEPTH-`PIPE_OFFSET)-1] & ~b_neg_shift_reg[(DEPTH-`PIPE_OFFSET)-1]) begin
        quo <= ~unsigned_quo + 1;
        rem <= ~unsigned_rem + 1;
    end
    else begin //both unsigned
        quo <= unsigned_quo;
        rem <= unsigned_rem;
    end
end

divfunc #(
    .XLEN(`SIZE_DATA),
    .STAGE_LIST(STAGE_LIST)
) divider (
    .clk(clk),
    .rst(rst),
    .a(unsigned_a),
    .b(unsigned_b),
    .vld(1),
    .quo(unsigned_quo),
    .rem(unsigned_rem),
    .ack(ack)
);
// save a input for setting correct remainder
// in case of divide-by-0
shift_pipe #(
    .WIDTH(`SIZE_DATA),
    .DEPTH(DEPTH-2)
) a_pipe (
    .clk(clk),
    .rst_n(~rst),
    .valid_in(1),
    .pipe_in(a),
    .pipe_out(rem_div0)
);

endmodule

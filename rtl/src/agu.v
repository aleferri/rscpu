
module agu(
    input   wire[15:0]  arg,
    input   wire[15:0]  pc,
    
    input   wire        e_arg,
    input   wire        e_pc,

    input   wire        inc_pc,

    output  wire[15:0]  adr
);

function [15:0] mask(input [15:0] sgn, input e);
    integer i;

    for (i = 0; i < 16; i++) begin
        mask[i] = sgn[i] & e;
    end
endfunction

reg[15:0] t;

always @(*) begin
    t = mask(arg, e_arg) + mask(pc, e_pc) + inc_pc;
end

assign adr = t;

endmodule
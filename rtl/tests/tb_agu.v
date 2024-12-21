
module tb_agu();

reg[15:0] arg;
reg[15:0] pc;
reg e_arg;
reg e_pc;
reg inc_pc;
wire[15:0] adr;

agu a(
    .arg(arg)
    .pc(pc)
    .e_arg(e_arg)
    .e_pc(e_pc)
    .inc_pc(inc_pc)
);

initial begin
    arg = 0;
    pc = 0;
    e_arg = 0;
    e_pc = 0;
    inc_pc = 0;
    #10 inc_pc = 1;

end

endmodule
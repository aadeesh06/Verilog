// This code is of a 2 x 1 multiplexer using cmos switch.
// For understanding of the code, it is better to see the 2 x 1 multiplexer implementation using transmission gate.

module mux_2to1(out,s, i0, i1);
    input s, i0, i1;
    output out;
    wire sbar;
    not(sbar, s);
    cmos cmos_a(out, i0, sbar, s);
    cmos cmos_b(out, i1, s, sbar);
endmodule
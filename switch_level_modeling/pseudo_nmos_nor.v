// this is code for pseudo nmos nor gate. 
// It is better to first study the pseudo nmos nor gate theoretically before going through the code
// Also learn about pullup() and pulldown() primitives in verilog.

module pseudoNor(x, y, f);
    input x, y;
    output f;
    supply0 gnd;
    nmos nx(f, gnd, x);
    nmos ny(f, gnd, y);
    pullup(f);
endmodule
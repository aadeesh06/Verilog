// code for cmos nand gate using switch level modeling
module cmos_nand(x , y ,f);
    input x, y;
    output f;
    supply1 vdd;  // Vdd = max supply voltage
    supply0 gnd;  // ground = 0
    wire a;
    pmos p1(f, vdd, x);
    pmos p2(f, vdd, y);
    nmos n1(f, a, x);
    nmos n2(a, gnd, y);
endmodule
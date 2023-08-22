//code for cmos inverter using switch level modeling
module cmos_not(x,f);
    input x; // input variable
    output f; // output variable
    supply1 vdd;  // logic high 
    supply0 gnd; // logic zero
    pmos p1(f, vdd,x);  // pmos transistor
    nmos n1(f,gnd,x); // nmos transistor
endmodule
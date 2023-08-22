`include "switch_level_modeling\cmos_nand.v"
module tran_full_adder(sum , cout, a, b, cin);
    input a, b, cin;
    output sum, cout;
    fa_sum SUM(sum , a, b, cin);
    fa_carry CARRY(cout, a, b, cin);
endmodule

module fa_carry(cout, a, b, cin);
    input a, b, cin;
    output cout;
    wire t1, t2, t3, t4, t5;
    cmos_nand n1(a, b, t1);
    cmos_nand n2(a, cin, t2);
    cmos_nand n3(b, cin, t3);
    cmos_nand n4(t1, t2, t4);
    cmos_nand n5(t4, t4, t5);
    cmos_nand n6(t5, t3, cout);
endmodule

module fa_sum(sum, a, b, cin);
    input a, b, cin;
    output sum;
    wire t1, t2;
    myxor2 x1(t1, a, b);
    myxor2 x2(sum, t1, cin);
endmodule

module myxor2(out, a, b);
    input a, b;
    output out;
    wire t1, t2, t3, t4;
    cmos_nand n7(a, a, t1);
    cmos_nand n8(b, b, t2);
    cmos_nand n9(a, t2, t3);
    cmos_nand n10(b, t1, t4);
    cmos_nand n11(t3, t4, out);
endmodule
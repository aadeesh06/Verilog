`include "switch_level_modeling\cmos_mux.v"
module cmos_mux_tb;
    reg sel, in1, in0;
    wire out;
    integer k;
    mux_2to1 m1(out, sel , in0, in1);
    initial 
    begin
        for(k = 0; k < 8; k = k + 1)
        begin
            #5 {sel , in0, in1} = k; 
            $display("Sel = %b, in1 = %b , in2 = %b", sel, in1, in0);
        end
    end
endmodule
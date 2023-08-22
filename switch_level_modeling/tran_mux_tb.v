`include "switch_level_modeling\tran_mux.v"
module tran_mux_tb;
    reg s0, s1, i0, i1, i2, i3;
    wire out;
    integer k;

    tran_mux t1(out, s0, s1, i0, i1, i2, i3);
    initial begin 
        for(k = 0; k < 64; k = k + 1)
        begin
            #5 {s0, s1, i0, i1, i2, i3} = k;
            $display("Sel: %2b In: %4b Out: %b", {s0,s1}, {i0,i1,i2,i3}, out); 
        end
    end
endmodule
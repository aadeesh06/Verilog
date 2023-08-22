`include "switch_level_modeling\switch_fa.v"
module switch_fa_tb;
    reg a, b, cin;
    wire sum ,cout;
    integer k;
    switch_full_adder fa(sum ,cout, a, b, cin);
    initial
    begin
        for(k = 0; k < 8; k = k + 1)
        begin
            #5 {a, b, cin} = k;
            $display("inputs: %3b Sum: %b, Carry: %b", {a,b,cin}, sum, cout); 
        end 
    end
endmodule
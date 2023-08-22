`include "switch_level_modeling\cmos_nand.v"
module cmos_nand_tb;
    reg in1 , in2;
    wire out;
    integer k;
    cmos_nand nand1(in1, in2, out);

    initial begin
        for(k = 0; k < 4; k = k + 1)
        begin
            #5 {in1, in2} = k; 
            // input combinations will be
            // k = 0  {in1, in2}= 00
            // k = 1  {in1, in2}= 01
            // k = 2  {in1, in2}= 10
            // k = 3  {in1, in2}= 11
            $display("time = %d in1 = %b, in2 = %b, out = %b", $time, in1, in2, out);
        end
    end
endmodule
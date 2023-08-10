`include "sequence_detector.v"
// sequence detector testbench
module sequence_detector_tb;
    reg clk, x, reset;
    wire z;
    sequence_detector SEQ(x , clk , reset, z);
    initial 
    begin
        $dumpfile("sequence_detector.vcd");
        $dumpvars(0, sequence_detector_tb);
        clk = 1'b0;
        reset = 1'b1;
        #15 reset = 1'b0;
    end
    always #5 clk = ~clk;
    initial
    begin
        #12 x = 0; #10 x = 0; #10 x = 1; #10 x = 1;
        #10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;  
        #10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
        #10 $finish;
    end
endmodule
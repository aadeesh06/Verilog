`include "serial_adder.v"
// serial adder test bench
module serial_adder_tb;
    reg reset, a , b;
    wire sum;

    serial_adder sa1(a,b,reset,sum);
    initial begin
        $dumpfile("serial_adder.vcd");
        $dumpvars(0, serial_adder_tb);

        reset = 1'b1;
        #15 reset = 1'b0;
    end
    initial
    begin
        #15 a = 0; b = 0;
        #10 a = 1; b = 1;
        #10 a = 1; b = 0;
        #10 a = 0; b = 0;
        #10 $finish;
    end
endmodule
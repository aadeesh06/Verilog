`include "pipeline_example.v"
module pipeline_tb;
    parameter N = 10;
    wire [N-1 : 0] F;
    reg [N- 1: 0] A, B, C, D;
    reg clk;
    
    //instantiating the pipeline module
    pipe_ex mypipe(F, A, B, C, D, clk);
    
    initial clk = 0;
    
    always #10 clk = ~clk;
    initial 
    begin
        #5 A = 10; B = 12; C = 6; D = 3; // F = 75
        #20 A = 10; B = 10; C = 5; D = 3; // F = 66
        #20 A = 20; B = 11; C = 1; D = 4; // F = 112
        #20 A = 15; B = 10; C = 8; D = 2; // F = 62
        #20 A = 8; B = 15; C = 5; D = 0; // F = 0; 
        #20 A = 10; B = 20; C = 5; D = 3; // F = 96
        #20 A = 10; B = 20; C = 30; D = 1; // F = 49
        #20 A = 30; B = 1; C = 2; D = 4; // F = 116  
    end
    initial 
    begin   
        $dumpfile("pipe1.vcd");
        $dumpvars(0, pipeline_tb);
        $monitor("Time: %d, F = %d,", $time, F);
        #300 $finish;

    end

endmodule
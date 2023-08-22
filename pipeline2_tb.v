`include "pipeline_example2.v"
module pipeline2_tb;
    wire [15:0] Z;
    reg [3:0] rs1, rs2, rd, func;
    reg [7:0] addr;
    reg clk1, clk2;
    integer k;

    pipe_ex2 pipe2(Z, rs1, rs2, rd, func, addr, clk1, clk2);

    initial 
    begin
        clk1 = 0; 
        clk2 = 0;
        repeat(20)   // generating two phase clock
            begin 
                #5 clk1 = 1; #5 clk1 = 0;
                #5 clk2 = 1; #5 clk2 = 0;
            end 
    end
    initial 
        for(k = 0; k < 16; k = k+1)
            pipe2.regbank[k] = k;
        /*
            1 is getting stored in register 1
            2 is getting stored in register 2
            and so on
        */

    
    initial begin 
        // Test case 1 : Result = 8
        #5 rs1 = 3; rs2 = 5; rd = 10; func = 0; addr = 125; // ADD
        // Now in register 10 we have 3 + 5 = 8 stored

        // Test case 2 : Result = 24
        #20 rs1 = 3; rs2 = 8; rd = 12; func = 2; addr = 126; // MUL
        
        // Test case 3 : Result = 3
        #20 rs1 = 10; rs2 = 5; rd = 14; func = 1;addr = 128; // SUB 
        // While accessing register 10, the value will stored will not be 
        //10 but it will be 8 as it is modified in the test case 1 statement
        // So result of test case 3 is 8 - 5 = 3;
       
       // Test case 4 : Result = 14
        #20 rs1 = 7; rs2 = 3; rd = 13; func = 11;addr = 127; // SLA
        
        // Test case 5 : Result = 3
        #20 rs1 = 10; rs2 = 5; rd = 15; func = 1;addr = 129; // SUB
        
        // Test case 6 : Result = 38
        #20 rs1 = 12; rs2 = 13; rd = 16; func = 0;addr = 130; // ADD
        
        #60  for(k = 125; k < 131; k = k + 1)
                $display("Mem[%3d] = %3d", k , pipe2.mem[k]);
    end

    initial begin 
            $dumpfile("pipe2.vcd");
            $dumpvars(0, pipeline2_tb);
            $monitor("time: %3d F = %3d", $time, Z);
            #300 $finish;
    end
endmodule
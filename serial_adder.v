// 4 - bit serial adder
module serial_adder(a , b, reset,  sum);
    input a, b;
    input reset;
    output reg sum;
    reg state; // the only state is previous carry
    parameter s0 = 0, s1 = 1;
    reg PS;
    // always @(posedge reset)
    // begin
    //     if(reset)
    //         PS <= 0;    
    //     else 
    //         PS <= NS;
    // end
    always @(*)
    begin
        if(reset)
            PS <= s0;
        else
        begin
            case(PS)
                s0 : begin
                        sum  = (a ^ b);
                        PS = (a & b) ? s1 : s0;
                    end
                s1 : begin
                        sum = ~(a ^ b);
                        PS = (a | b) ? s1 : s0;
                    end
            endcase
        end
    end
endmodule
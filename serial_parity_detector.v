module parity_gen(x,clk,z);
    //a moore machine
    // a serial parity detector which checks if the number of 1's in the incoming sequence are odd or even 
    input x, clk;
    output reg z;
    reg even_odd; // machine state
    parameter even = 1, odd = 0;
    always @(posedge clk) begin
        case(even_odd)
            even : even_odd <= x ? odd : even;
            odd : even_odd <= x ? even : odd;
            default : even_odd <= even;
        endcase
    end
    always @(even_odd)
    begin
        case (even_odd)
            even : z = 0;
            odd : z = 1;
        endcase
    end
endmodule
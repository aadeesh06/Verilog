// a overlapping sequence detector which when detects a sequence of 0110,sets the output to 1;
// it is an example of Mealy machine
module sequence_detector(
    x , clk , reset , z
);
    input x , clk, reset;
    output reg z;
    reg state[2:0];
    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;
    reg [0:1] PS, NS;
    always @(posedge clk or posedge reset)
    begin
        if(reset)
            PS <= s0;
        else 
            PS <= NS;
    end
    always @(PS,x)
    begin
        case(PS)

            s0: begin
                    z = x ? 0 : 0; // or z = 0;
                    NS = x ? s0 : s1;
                end
            s1: begin
                    z = x ? 0 : 0; // z  = 0;
                    NS = x ? s2 : s1;
                end
            s2: begin
                    z = x ? 0 : 0; //z = 0
                    NS = x ? s3 : s1;
                end
            s3: begin
                    z = x ? 0 : 1;
                    NS = x ? s0 : s1; 
                end
        endcase
    end
endmodule
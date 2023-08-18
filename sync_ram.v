module ram_v1(addr, data, clk, read, write, cs); // cs stands for chip select
    input [7:0] addr;
    input clk, read, write, cs;
    inout [7:0]data;
    reg [7:0] mem [1023: 0];
    reg [7:0] data_out;
    

    always @(posedge clk)
    begin
            if(cs && write && !read)
                mem[addr] = data; 
    end
    always @(posedge clk)
    begin
        if(cs && read && !write)
            data_out = mem[addr];
    end
    assign data = (cs && read) ? data_out : 8'bz;

endmodule
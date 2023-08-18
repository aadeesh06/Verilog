// A memory element can be regarded as a two dimensional array of storage cells.
// The below code is for modeling a synchronous ram with synchronous read and write.
module ram_v1(addr, data, clk, read, write, cs); // cs stands for chip select
    input [7:0] addr;   // address
    input clk, read, write, cs;   // clock for synchronous ram, 
    inout [7:0]data;      // data is declared as of type inout so that data can be read and written both
    reg [7:0] mem [1023: 0]; // memory array with 1024 memory words with each word being of 8 bits.
    reg [7:0] data_out;
    

    always @(posedge clk)
    begin
            if(cs && write && !read)     // when write is logic 1 and read is logic 0
                mem[addr] = data;  // data is read from the corresponding memory address "addr"
    end
    always @(posedge clk)
    begin
        if(cs && read && !write)   // when write is  logic 0 and read is logic 1
            data_out = mem[addr];   // data is written on the corresponding memory address "addr"
    end
    assign data = (cs && read) ? data_out : 8'bz;   // is chip select and read are both logic 1, then data is equal to data_out

endmodule
`timescale 1ns/1ps

module tb_top_ram (); /* this is automatically generated */

    reg clk;
    reg rst_n;
    wire [7:0] q;


top_ram top_ram1(
    .clk(clk), 
    .rst_n(rst_n), 
    .q(q)
    );
   

    // clock
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // reset
    initial begin
        rst_n = 0;
        #20
        rst_n = 1;
    end

endmodule

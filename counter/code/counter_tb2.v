`timescale 1ns/1ps
module counter_tb2 (); /* this is automatically generated */

    reg rst_n;
    reg clk;
    wire [7:0]cnt;
    counter2 inst_counter2 (
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt)
        );
    // clock  50MHz
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    // reset
    initial
    begin
        rst_n = 0;//_n是负电平复位，
        #200
        rst_n = 1;//非复位事完成工作
   
        #6000   //至少20*256 
        $stop;

    end


endmodule
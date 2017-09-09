
`timescale 1ns/1ps

module tb_check_iloveyou (); /* this is automatically generated */

    reg clk;
    reg rst_n;
    reg [7:0] cap_flow, low_flow;

    wire [7:0] out_flow;

check_iloveyou check_iloveyou(
        clk(clk),
        rst_n(rst_n),
        cap_flow(cap_flow),
        low_flow(low_flow),
        out_flow(out_flow)
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

    // (*NOTE*) replace reset, clock

	parameter [3:0] S0 = 4'd0;

	


endmodule

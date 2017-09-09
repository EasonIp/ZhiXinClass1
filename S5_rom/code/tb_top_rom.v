
`timescale 1ns/1ps

module tb_top_rom (); /* this is automatically generated */


	reg clk;   // Clock
	reg rst_n;  // Asynchronous reset active low
	wire [7:0] out_q;

	top_rom top_rom1 (
		.clk(clk), 
		.rst_n(rst_n), 
		.out_q(out_q)
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

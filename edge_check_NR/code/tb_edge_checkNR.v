
`timescale 1ns/1ps

module tb_edge_checkNR (); /* this is automatically generated */

	reg clk;    // Clock
    reg rst_n;  // Asynchronous reset active low
    reg D_signal;
    wire pos_edge; //上升沿检测
    wire neg_edge; //下降沿检测

	// clock
	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end

	// reset
	initial begin
		rst_n = 0;
		D_signal =0;
		#20
		rst_n = 1;
		#40
		D_signal =1;
		#80
		D_signal =0;
		#65
		D_signal =1;
		#75
		D_signal =0;

	end

	edge_check_NR inst_edge_check_NR (
			.clk      (clk),
			.rst_n    (rst_n),
			.D_signal (D_signal),
			.pos_edge (pos_edge),
			.neg_edge (neg_edge)
		);

	initial begin
		// do something

		repeat(100)@(posedge clk);
		$stop;
	end


endmodule

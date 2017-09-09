
`timescale 1ns/1ps

module tb_edge_check (); /* this is automatically generated */


	reg clk;   // Clock
	reg signal; 
	reg rst_n;  // Asynchronous reset active low
	wire pos_edge;
	wire neg_edge;
	// clock
	initial 
	begin
		clk = 0;
		forever #10 clk = ~clk;
	end

	// reset
	initial begin
		rst_n = 0;
		signal =0;
		#20
		rst_n = 1;

		#40
		signal =1;
		#80
		signal =0;

		#10
		signal =1;
		#95
		signal =0;


		// forever #20 signal = ~signal;
	end

	edge_check inst_edge_check
		(
			.clk      (clk),
			.signal   (signal),
			.rst_n    (rst_n),
			.pos_edge (pos_edge),
			.neg_edge (neg_edge)
		);

endmodule

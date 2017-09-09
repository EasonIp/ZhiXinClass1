module top (
	input clk,    // Clock
	input key_in, // Clock Enable
	input rst_n,
	output [1:0]led  // Asynchronous reset active low
	
);

	wire key_out;
	wire pos_edge;
	wire neg_edge;

	led inst_led (
		.clk(clk), 
		.rst_n(rst_n), 
		.pos_edge(pos_edge), 
		.neg_edge(neg_edge), 
		.led(led));

	// check_edge #(
	// 		.N(N)
	// 	) inst_check_edge (
	// 		.clk      (clk),
	// 		.rst_n    (rst_n),
	// 		.D_signal (D_signal),
	// 		.pos_edge (pos_edge),
	// 		.neg_edge (neg_edge)
	// 	);

// check_edge  inst_check_edge (
// 			.clk      (clk),
// 			.rst_n    (rst_n),
// 			.D_signal (key_out),
// 			.pos_edge (pos_edge),
// 			.neg_edge (neg_edge)
// 		);

	edge_check inst_edge_check
		(
			.clk      (clk),
			.signal   (key_out),
			.rst_n    (rst_n),
			.pos_edge (pos_edge),
			.neg_edge (neg_edge)
		);


	// filter #(
	// 		.cnt_num(5)
	// 	) inst_filter (
	// 		.clk     (clk),
	// 		.rst_n   (rst_n),
	// 		.key_in  (key_in),
	// 		.key_out (key_out)
	// 	);

		filter  inst_filter (
			.clk     (clk),
			.rst_n   (rst_n),
			.key_in  (key_in),
			.key_out (key_out)
		);




endmodule
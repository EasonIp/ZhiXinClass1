module top_key_scan (
	input clk,    // Clock
	input [3:0] row,
	input rst_n,  // Asynchronous reset active low
	// output flag,
	output [3:0]col,
	output [7:0] seg,
	output [2:0] sel
);


	
	// wire [3:0] col;
	// wire flag;
	wire [3:0] data;

	key_scan inst_key_scan (
			.clk   (clk),
			.rst_n (rst_n),
			.row   (row),
			.col   (col),
			// .flag  (flag),
			.data  (data)
		);

	// seg7 inst_seg7 (
	// 	.clk_1k(clk), 
	// 	.rst_n(rst_n),
	// 	.datain({data,data,data,data,data,data}), 
	// 	.sel(sel), 
	// 	.seg(seg)
	// 	);


	seg7 inst_seg7 (
		.clk(clk), 
		.rst_n(rst_n), 
		.data_in({data,data,data,data,data,data}), 
		.sel(sel), 
		.seg(seg));

endmodule
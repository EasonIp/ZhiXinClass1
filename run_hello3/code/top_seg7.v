module top_seg7 (clk,rst_n,seg,sel);

	input clk;   //50MHz
	input rst_n;  //  low 

	output [7:0] seg;
	output [2:0] sel;



	wire clk_1k;    // Clock
	// wire clk_1;    // Clock
	wire [23:0] data_in;
	freq freq1(
		.clk(clk),
		.rst_n(rst_n),
		.clk_1k(clk_1k)
		);
//  
	// freq #(.counter_num(24'd24999999 + 24'd24999999))
	// freq #(.counter_num(24'd249999 ))
	// freq2 (
	// 	.clk(clk),
	// 	.rst_n(rst_n),
	// 	.clk_1k(clk_1)
	// 	);


	data_gen inst_data_gen (
		.clk(clk), 
		.rst_n(rst_n),
		.data_in(data_in));

	// data_gen  data_gen(
	// 	.clk_1(clk_1),
	// 	.rst_n(rst_n),
	// 	.data_in(data_in)
	// 	);



	seg7 seg7(
		.clk_1k(clk_1k),
		.rst_n(rst_n),
		.data_in(data_in),
		.seg(seg),
		.sel(sel)
		);

endmodule
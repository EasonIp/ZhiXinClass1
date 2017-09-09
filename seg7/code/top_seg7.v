module top_seg7 (clk,rst_n,seg,sel);

	input clk;   //50MHz
	input rst_n;  //  low 

	output [7:0] seg;
	output [2:0] sel;


	wire clk_1k;    // Clock

	freq freq(
		.clk(clk),
		.rst_n(rst_n),
		.clk_1k(clk_1k)
		);
	seg7 seg7(
		.clk_1k(clk_1k),
		.rst_n(rst_n),
		.seg(seg),
		.sel(sel)
		);

endmodule
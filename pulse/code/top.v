module top (
	input clk,    // Clock
	input key_in, 
	input rst_n,  // Asynchronous reset active low
	output [7:0] seg,
	output [2:0] sel
	
);

	wire [3:0]sum;
	wire clk_1k;
	pulse inst_pulse (
			.clk    (clk),
			.key_in (key_in),
			.rst_n  (rst_n),
			.sum    (sum)
		);

	seg7 inst_seg7 (
		.clk_1k(clk_1k), 
		.rst_n(rst_n), 
		.data_in({sum,sum,sum,sum,sum,sum}),
		.sel(sel),
		.seg(seg)
		);

	freq  inst_freq (
		.clk(clk), 
		.rst_n(rst_n), 
		.clk_1k(clk_1k)
		);





endmodule
module top_calculator (
	input clk,    // Clock
	input [3:0] row,
	input rst_n,  // Asynchronous reset active low
	output beep_out,
	output [2:0] sel,
	output [7:0] seg,
	output [3:0] col
);

	wire clk_1khz;
	wire [3:0]data;
	wire [23:0]seg_data;

	freq  inst_freq (
		.clk(clk), 
		.rst_n(rst_n), 
		.clk_1k(clk_1khz)
		);


	cal inst_cal (
		.clk_1khz (clk_1khz),
		.flag     (flag),
		.rst_n    (rst_n),
		.data     (data),
		.seg_data (seg_data)
	);


	seg7_v0 inst_seg7_v0 (
			.clk     (clk),
			.rst_n   (rst_n),
			.data_in (seg_data),
			.sel     (sel),
			.seg     (seg)
		);


	key_scan  inst_key_scan (
			.clk   (clk),
			.rst_n (rst_n),
			.row   (row),
			.col   (col),
			.flag  (flag),
			.data  (data)
		);


		beep inst_beep (
			.clk      (clk),
			.rst_n    (rst_n),
			.key_in   (flag),
			.beep_out (beep_out)
		);


endmodule
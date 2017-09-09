module top (
	input clk,    // Clock

	input 	rst_n,  // Asynchronous reset active low
	input 	key_in1;
	input	key_in2;
	output 	[2:0] sel;
	output 	[7:0] seg;
	
);


	wire flag1;
	wire flag2;
	wire [7:0]data_bin;
	wire [3:0]hundreds;
	wire [3:0]tens;
	wire [3:0]ones;

// sim

	filter inst_filter1 #(.cnt_num(5))(
		.clk(clk), 
		.rst_n(rst_n), 
		.key_in(key_in1), 
		.flag(flag1));

	filter inst_filter2 #(.cnt_num(5))(
		.clk(clk), 
		.rst_n(rst_n), 
		.key_in(key_in2), 
		.flag(flag2));
	count inst_count (
			.clk      (clk),
			.rst_n    (rst_n),
			.flag1    (flag1),
			.flag2    (flag2),
			.data_bin (data_bin)
		);

	B2BCD inst_B2BCD (
		.binary_in(data_bin), 
		.hundreds(hundreds), 
		.tens(tens), 
		.ones(ones)
		);
	seg7 inst_seg7 (
		.clk(clk), 
		.rst_n(rst_n), 
		.data_in({hundreds,tens,ones,4'd0,4'd0,4'd0}), 
		.sel(sel), 
		.seg(seg)
		);

// // download

// 	filter inst_filter1 (
// 		.clk(clk), 
// 		.rst_n(rst_n), 
// 		.key_in(key_in1), 
// 		.flag(flag1));

// 	filter inst_filter2 (
// 		.clk(clk), 
// 		.rst_n(rst_n), 
// 		.key_in(key_in2), 
// 		.flag(flag2));
// 	count inst_count (
// 			.clk      (clk),
// 			.rst_n    (rst_n),
// 			.flag1    (flag1),
// 			.flag2    (flag2),
// 			.data_bin (data_bin)
// 		);

// 	B2BCD inst_B2BCD (
// 		.binary_in(data_bin), 
// 		.hundreds(hundreds), 
// 		.tens(tens), 
// 		.ones(ones)
// 		);

// 	seg7 inst_seg7 (
// 		.clk(clk), 
// 		.rst_n(rst_n), 
// 		.data_in({hundreds,tens,ones,4'd0,4'd0,4'd0}), 
// 		.sel(sel), 
// 		.seg(seg)
// 		);


endmodule
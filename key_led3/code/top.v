module top (
	input clk,    // Clock
	input [2:0]key_in, // Clock Enable
	input rst_n,
	output [3:0]led_out  // Asynchronous reset active low
	
);

	wire [2:0]sum0;
	wire [2:0]sum1;
	wire [2:0]sum2;
	// led8 #(
	// 		.counter_num(counter_num)
	// 	) inst_led8 (
	// 		.clk     (clk),
	// 		.sum     (sum),
	// 		.rst_n   (rst_n),
	// 		.led_out (led_out)
	// 	);
// key_led2 #(.cnt_num(cnt_num)) inst_key_led2 (
// 	.clk(clk), 
// 	.rst_n(rst_n), 
// 	.key_in(key_in), 
// 	.sum(sum));


key_led2 inst1_key_led2 (
	.clk(clk), 
	.rst_n(rst_n), 
	.key_in(key_in[0]), 
	.sum(sum0)
	);

key_led2 inst2_key_led2 (
	.clk(clk), 
	.rst_n(rst_n), 
	.key_in(key_in[1]), 
	.sum(sum1)
	);
key_led2 inst3_key_led2 (
	.clk(clk), 
	.rst_n(rst_n), 
	.key_in(key_in[2]), 
	.sum(sum2)
	);

	led8 inst_led8 (
			.clk     (clk),
			.sum     ({sum0[0],sum1[0],sum2[0]}),
			.rst_n   (rst_n),
			.led_out (led_out)
		);


endmodule
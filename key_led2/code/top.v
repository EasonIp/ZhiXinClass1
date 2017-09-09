module top (
	input clk,    // Clock
	input key_in, // Clock Enable
	input rst_n,
	output [3:0]led_out  // Asynchronous reset active low
	
);

	wire [2:0]sum;

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


key_led2 inst_key_led2 (
	.clk(clk), 
	.rst_n(rst_n), 
	.key_in(key_in), 
	.sum(sum)
	);

	led8 inst_led8 (
			.clk     (clk),
			.sum     (sum),
			.rst_n   (rst_n),
			.led_out (led_out)
		);


endmodule
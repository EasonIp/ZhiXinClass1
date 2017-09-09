
`timescale 1ns/1ps

module tb_pulse (); /* this is automatically generated */

	reg clk;    // Clock
	reg key_in;  //独立按键,低电平有效
	reg rst_n;  // Asynchronous reset active low
	wire [3:0]sum;

	pulse #(
			.counter_num(5)
		) inst_pulse (
			.clk    (clk),
			.key_in (key_in),
			.rst_n  (rst_n),
			.sum    (sum)
		);




	// pulse inst_pulse (
	// 		.clk    (clk),
	// 		.key_in (key_in),
	// 		.rst_n  (rst_n),
	// 		.sum    (sum)
	// 	);

	// clock
	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end

	// reset
	initial 
	begin
		rst_n = 0;
		key_in =1;
		#20
		rst_n = 1;
		#20
		key_in =0;   //按键第一次按下
		#120
		key_in =1;  //按键第一次抬起
		#60         //抬起不稳定，消抖没完成
		key_in =1;  //抬起
		#60  

		key_in =0;   //按键按下
		#40
		key_in =0;   //按键按下   两次按下
		#140         
		key_in =1;  //抬起
		#160

		#2000
		$stop;

		// repeat(2000)@(posedge clk);
		// $stop;
	end


endmodule

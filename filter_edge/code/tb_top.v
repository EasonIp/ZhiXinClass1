`timescale   1ns/1ps

module tb_top ();

	reg key_in;
	reg clk;
	reg rst_n;
	wire [1:0]led;

	top inst_top (
		.clk(clk), 
		.key_in(key_in), 
		.rst_n(rst_n), 
		.led(led));


		initial
		begin
			clk = 1;
			rst_n = 0;
			key_in = 1;
			#200
			rst_n = 1;
			#20
			key_in = 0;		//按键按下第一次
			#120
			key_in = 1;		//按键第一次抬起
			#60
			key_in = 1;
			#120
			
			key_in = 0;
			#40
			key_in = 0;		//第二次按下
			#140
			key_in = 1;
//			#160
//			
//			#200000
//			$stop;
		end
		
	always #10 clk = ~clk;


endmodule
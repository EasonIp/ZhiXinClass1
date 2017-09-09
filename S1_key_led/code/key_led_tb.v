`timescale 1ns/1ps
module key_led_tb;  //;
	
	reg clk;
	reg rst_n;
	reg key_in;
	wire [3:0]led;    // output reg
		
	key_led key_led(
		.clk(clk),
		.rst_n(rst_n),
		.key_in(key_in),
		.led(led)
		);  //;
	initial
	begin
		clk = 1;
		rst_n =0;
		key_in =1;
		#60
		#5
		rst_n = 1;
		#5
		key_in = 0;   // 1th push
		#20
		key_in =1;
		#20
		key_in =0;   // 2th push
		#20
		key_in =1;
		#5
		rst_n =0;
		#20
		$stop;  //;
	end
	always #10 clk = ~clk;
endmodule
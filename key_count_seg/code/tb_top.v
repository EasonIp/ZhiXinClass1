`timescale  1ns/1ps

module tb_top;

	reg 	clk;    // Clock
	reg 	rst_n;  // Asynchronous reset active low
	reg 	key_in1;
	reg		key_in2;
	wire 	[2:0] sel;
	wire 	[7:0] seg;

	top inst_top
		(
			.clk     (clk),
			.rst_n   (rst_n),
			.key_in1 (key_in1),
			.key_in2 (key_in2),
			.sel     (sel),
			.seg     (seg)
		);


	initial
	begin
		clk = 1;
		rst_n = 0;
		key_in1 = 1;		
		key_in2 = 1;
		#200
		rst_n = 1;
		#20
		key_in1 = 0;		//按键按下第一次
		key_in2 = 1;
		#120
		key_in1 = 1;		//按键第一次抬起
		#60
		key_in1 = 1;
		#120
		
		key_in1 = 0;
		#40
		key_in1 = 0;		//第二次按下
		#140
		key_in1 = 1;
		#160
		
		key_in2 = 0;
		#120
		key_in2 = 1;		//按键第一次抬起
		#60
		key_in2 = 1;
		#120
		
		key_in2 = 0;
		#40
		key_in2 = 0;		//第二次按下
		#140
		key_in2 = 1;
		#160


		key_in2 = 0;
		key_in1 = 0;
		#120
		key_in2 = 1;		//按键第一次抬起
		key_in1 = 1;		//按键第一次抬起
		#60
		key_in2 = 1;
		key_in1 = 1;
		#120
		
		key_in1 = 0;
		key_in2 = 0;
		#40
		key_in2 = 0;		//第二次按下
		key_in1 = 0;		//第二次按下
		#140
		key_in1 = 1;
		key_in2 = 1;
		#160
		#4000



		$stop;
		end
		
	always #10 clk = ~clk;


endmodule
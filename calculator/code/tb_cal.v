`timescale  1ns/1ps

module tb_cal;

	reg clk_1khz;    // Clock
	reg flag;
	reg rst_n;  // Asynchronous reset active low
	reg [3:0]data;
	wire[23:0]seg_data;

	cal inst_cal (
			.clk_1khz (clk_1khz),
			.flag     (flag),
			.rst_n    (rst_n),
			.data     (data),
			.seg_data (seg_data)
		);

	initial
	begin
		clk_1khz =1;
		rst_n =0;
		flag =0;
		#200  rst_n =1; 
		#20  flag= 1; data=5;
		#20  flag= 0;
		#100 flag=1;data=2;
		#20  flag= 0;
		#100 flag=1;data=13;
		#20  flag= 0;
		#100 flag=1;data=2;
		#20  flag= 0;
		#100 flag=1;data=2;
		#20  flag= 0;
		#100 flag=1;data=10;
		#20  flag = 0;
		#100 flag=1;data=11;
		#200 flag= 1; data=4;
		#20  flag= 0;
		#100 flag=1;data=0;
		#20  flag= 0;
		#100 flag=1;data=13;
		#20  flag= 0;
		#100 flag=1;data=1;
		#20  flag= 0;
		#100 flag=1;data=2;
		#20  flag= 0;
		#100 flag=1;data=10;
		#20  flag = 0;
		#201   $stop;

	end

	always #10 clk_1khz = ~ clk_1khz;


endmodule
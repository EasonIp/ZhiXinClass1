`timescale   1ns/1ps

module tb_seg_1 ();



	reg clk;   //50MHz
	reg rst_n;  //  low 

	reg [3:0]  data_in;  //输入的4位数据

	wire [2:0] sel;
	wire [7:0] seg;


	seg_1 seg_1(
		.clk(clk),
		.rst_n(rst_n),
		.data_in(data_in),
		.sel(sel),
		.seg(seg)
		);


initial
	begin
		clk =1;
		rst_n =0;
		data_in = 4'd0;
		#200
		rst_n  =1;

		#20
		data_in = 4'd15;

		#200
		$stop;
	end

always #10 clk = ~clk;

endmodule
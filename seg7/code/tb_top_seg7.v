`timescale   1ns/1ps

module tb_top_seg7 ();


	reg clk;   //50MHz
	reg rst_n;  //  low 

	wire [7:0] seg;
	wire [2:0] sel;

top_seg7 top_seg7(
	.clk(clk),
	.rst_n(rst_n),
	.seg(seg),
	.sel(sel)
	);


initial
	begin
		clk =1;
		rst_n =0;

		#20
		rst_n =1;

	end

always #10 clk = ~clk;

endmodule
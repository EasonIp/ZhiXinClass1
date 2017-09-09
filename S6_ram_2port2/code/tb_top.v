`timescale  1ns/1ps
module tb_top();
	
	reg clk0;
	reg clk1;
	reg rst_n;
	wire [7:0]q_a;
	wire [7:0]q_b;

	top top (
		.clk0(clk0),
		.clk1(clk1),
		.rst_n(rst_n),
		.q_a(q_a),
		.q_b(q_b)
		);


 initial
	begin
		clk0 =1;
		clk1 =1;
		rst_n =0;

		#20
		rst_n = 1;
	end

always  # 10  clk0 = ~clk0;
always  # 20  clk1 = ~clk1;

endmodule // tb_top
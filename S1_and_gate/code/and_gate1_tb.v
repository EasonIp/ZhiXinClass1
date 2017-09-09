`timescale 1ns/1ps
module and_gate1_tb;
	reg clk;  //50KHz
	reg rst_n;   //
	reg a;
	reg b;
	wire s;

	and_gate1 and_gate1(
		.clk(clk),
		.rst_n(rst_n),
		.a(a),
		.b(b),
		.s(s)
	);
	
	initial
		begin
			clk = 1;    //不给clk赋初值则后面的额always块不正常工作，没有时钟输出
			rst_n = 0; // rst_n in source code
			a = 0;
			b = 0;
			
			#200 
			rst_n = 1;
			a = 1;
			b =0;
			#100   //#12
			a = 1;
			b = 1;
			#100
			a = 0;
			b = 0;
			
			#2000
			$stop;  //;
			/**/
		end
	
	
always #10 clk = ~clk;  //50MHz --20ns  period/2 =10ns
endmodule
`timescale  1ns/1ps

module tb_beep;
	reg clk;
	reg rst_n;  // Asynchronous reset active low
	reg key_in;
	wire beep_out;

		// beep #(
		// 	.cnt_num1(cnt_num1)
		// ) inst_beep (
		// 	.clk      (clk),
		// 	.rst_n    (rst_n),
		// 	.key_in   (key_in),
		// 	.beep_out (beep_out)
		// );


		beep inst_beep (
			.clk      (clk),
			.rst_n    (rst_n),
			.key_in   (key_in),
			.beep_out (beep_out)
		);


initial
	begin
		clk =0;
		rst_n=0;
		key_in =1;
		#200 rst_n = 0; key_in =0;
		#500_000 key_in = 1;
		#1000 key_in = 10;

		#500_000 key_in = 1;
		#100000 $stop;

	end

endmodule
`timescale  1ns/1ps
module tb_beep_2k;

	reg clk;
	reg rst_n;
	wire beep_out;


	beep_2k inst_beep_2k (
			.clk      (clk),
			.rst_n    (rst_n),
			.beep_out (beep_out)
		);


	initial
		begin
			clk = 1;
			rst_n =1;
			#200 rst_n = 0;
			// #671088640*20*3
			#670886400  $stop;
		end

always #10 clk=~clk;
endmodule

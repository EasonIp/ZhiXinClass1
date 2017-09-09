`timescale  1ns/1ps
module tb_fre_divn();
	reg clk;
	reg rst_n;
	wire out_fre_divn;

	fre_divn u1(
		.clk(clk),
		.rst_n(rst_n),
		.out_fre_divn(out_fre_divn)
		);

    // clock
    initial begin
        clk = 1'b0;
       // clk_1hz_out <= 1'b0;
        forever #10 clk = ~clk;
    end

	initial
		begin
			rst_n <= 0;
			#40
			rst_n <= 1;

		end
endmodule // tb_fre_divn
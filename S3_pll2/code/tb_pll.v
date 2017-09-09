`timescale 1 ns / 1 ps
module tb_pll ();

	reg	  clk;
	reg	 rst_n;
	wire	  c_25M;
	wire	  c_100M;
	wire	  locked;  //显示分频出来的信号是稳定的,标明稳定的状态，不是固定的

	pll u1(
    .clk(clk),
	.rst_n(rst_n),
	.c_25M(c_25M),
	.c_100M(c_100M),
	.locked(locked)
	);

	initial
		begin
			clk   = 1;   
			rst_n = 0;
			#20
			rst_n = 1;
		end
always  #10 clk = ~clk;
	    // clock
    // initial begin
    //     clk = 1'b0;
    //    // clk_1hz_out <= 1'b0;
    //     forever #10 clk = ~clk;
    // end

endmodule // tb_my_pll
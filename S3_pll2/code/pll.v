module pll (clk,rst_n,c_25M,c_100M,locked);

	input	  clk;
	input	  rst_n;
	output 	  c_25M;
	output 	  c_100M;
	output     locked;

	mypll	pll_inst (
	.areset ( ~rst_n ),
	.inclk0 ( clk ),
	.c0 ( c_25M ),
	.c1 ( c_100M ),
	.locked ( locked )
	);


endmodule
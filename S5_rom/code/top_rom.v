module top_rom (clk, rst_n, out_q);
	input clk;   // Clock
	input rst_n;  // Asynchronous reset active low
	output [7:0] out_q;

	wire [7:0] rom_control_out;



	my_rom_bb u1 (
	.address(rom_control_out),
	.clock(clk),
	.q(out_q)
	);

	rom_control u2 (
		.clk(clk), 
		.rst_n(rst_n), 
		.rom_control_out(rom_control_out)
		);

endmodule
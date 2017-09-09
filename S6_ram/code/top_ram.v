module top_ram (clk, rst_n, q);
	input clk;    // Clock
	input rst_n;  // Asynchronous reset active low
	output [7:0] q;

	wire [7:0] data_out;
	wire [7:0] addr_out;
	wire wren;  //0 read

	ram_control ram_control1 (
		.clk(clk),
		.rst_n(rst_n),
		.data_out(data_out), 
		.addr_out(addr_out), 
		.wren(wren)
		);

	my_ram my_ram1 (
	.address(addr_out),
	.clock(clk),
	.data(data_out),
	.wren(wren),
	.q(q)
	);

endmodule


`timescale 1ns/1ps
module top(clk0,clk1,rst_n,q_a,q_b);
	input clk0;
	input clk1;
	input rst_n;
	output [7:0]q_a;
	output [7:0]q_b;

	

	wire [7:0] data_a;
	// wire [7:0] data_b;
	wire wren_a;
	wire wren_b;
	wire [9:0] address_a;
	wire [9:0] address_b;
    // reg  [7:0] data_b;

ram_control ram_control (
	.wrclk(clk0) , 
	.rdclk(clk1),
	.rst_n(rst_n),
	.data_a(data_a),
	// .data_b(data_b),
	// .data_b(8'd0),
	.address_a(address_a),
	.wren_a(wren_a),
	.wren_b(wren_b),
	.address_b(address_b)
	);


 my_ram_2port my_ram_2port(
	.address_a(address_a),
	.address_b(address_b),
	.clock_a(clk0),
	.clock_b(clk1),
	.data_a(data_a),
	// .data_b(8'd0),
	.wren_a(wren_a),
	.wren_b(wren_b),
	.q_a(q_a),
	.q_b(q_b)
	);


	// my_pll my_pll (
	// 	.areset(rst_n),
	// 	.inclk0(clk),
	// 	.c0(c0),
	// 	.c1(c1)
	// );
	// my_ram_2port my_ram_2port (
	// 	.data(data),
	// 	.rdaddress(rdaddress),
	// 	.rdclock(clk),
	// 	.wraddress(wraddress),
	// 	.wrclock(clk),
	// 	.wren(wren),
	// 	.q(q)
	// );

endmodule // top

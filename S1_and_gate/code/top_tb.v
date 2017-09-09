`timescale 1ns/1ps
module top_tb;  //;
	
	reg a;
	reg b;
	reg c;
	
	wire d;
	
	top top(
		.a(a),
		.b(b),
		.c(c),
		.d(d)
		);
	initial
		begin
		forever 
			begin
			#20  a = 0;b = 0;c = 0;
			#20  a = 0;b = 0;c = 1;
			#20  a = 0;b = 1;c = 0;
			#20  a = 0;b = 1;c = 1;
			#20  a = 1;b = 0;c = 0;
			#20  a = 1;b = 0;c = 1;
			#20  a = 1;b = 1;c = 0;
			#20  a = 1;b = 1;c = 1;
			end
		end

endmodule
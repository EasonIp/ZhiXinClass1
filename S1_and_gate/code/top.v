module top (
	input a,    // Clock
	input b, // Clock Enable
	input c,  // Asynchronous reset active low
	output d
);

	wire s;  //中间连线信号，只做连线
	

	
	and_gate u1(
	.a(a),
	.b(b),
	.s(s)
	);
	and_gate u2(
	.a(c),
	.b(s),
	.s(d)
	);


endmodule
// module top(a,b,c,d);
// 	input a;
// 	input b;
// 	input c;
	
// 	output d;
	
// 	wire s;  //中间连线信号，只做连线
	
// 	and_gate u1(
// 	.a(a),
// 	.b(b),
// 	.s(s)
// 	);
// 	and_gate u2(
// 	.a(c),
// 	.b(s),
// 	.s(d)
// 	);
	
// endmodule
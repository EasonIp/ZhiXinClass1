module and_gate (
	input a,    // Clock
	input b, // Clock Enable
	output s  // Asynchronous reset active low
	
);
	assign s = a && b;


endmodule



// module and_gate(a,b,s);
// 	input a;
// 	input b;
// 	output s;
	
// 	assign s = a && b;

// endmodule
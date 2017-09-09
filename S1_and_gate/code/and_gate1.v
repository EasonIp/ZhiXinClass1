module and_gate1 (
	input clk,    // Clock
	input  a,
	input rst_n,  // Asynchronous reset active low
	input  b,
	output reg s
);

always @ (posedge clk or negedge rst_n)
	begin
	if(!rst_n)
		begin 
			s <= 0;
		end
	else
		begin 
			s <= a && b;
		end
	end

endmodule





// module and_gate1(clk,rst_n,a,b,s);
// 	input clk;  //50KHz
// 	input rst_n;   //
// 	input a;
// 	input b;
// 	output reg s;  //
	
// 	always @ (posedge clk or negedge rst_n)
// 	begin
// 	if(!rst_n)
// 		begin 
// 			s <= 0;
// 		end
// 	else
// 		begin 
// 			s <= a && b;
// 		end
// 	end

// endmodule
`timescale 1ns/1ps
module check_iloveyou_2state_tb;

	reg clk;
	reg rst_n;
	reg [7:0] cap_flow;
	reg [7:0] low_flow;
	wire [7:0] out_flow;

	check_iloveyou_2state check_iloveyou_2state(
		.clk(clk), 
		.rst_n(rst_n), 
		.cap_flow(cap_flow), 
		.low_flow(low_flow), 
		.out_flow(out_flow)
	);
	
	initial
		begin
			clk = 1;
			rst_n = 0;
			cap_flow = "A";
			low_flow = "a";
			#200.1
			rst_n = 1;
			
			forever
				begin
					#20	cap_flow = 65 + {$random} % 26;
						low_flow = 97 + {$random} % 26;
				end
		end
		
	initial
		begin
			#20000
			$stop;
		end
		
	always #10 clk = ~clk;

endmodule 

`timescale  1ns/1ps
module tb_mux2_1_4bit ();

	reg [3:0] in1;
	reg [3:0] in2;
	reg sel;
	wire [3:0] out_mux2_1;

	mux2_1_4bit u1(
		.in1(in1),
		.in2(in2),
		.sel(sel),
		.out_mux2_1(out_mux2_1)
		);

	// initial
	// 	begin
	// 		rst_n = 0;
	// 		#20
	// 		rst_n = 1;
	// 		forever 
	// 			begin
	// 		in1 = {$random} % 2;
	// 		in2 = {$random} % 2;
	// 			end
	// 	end

	// always #10 clk <= ~clk;

	initial 
	begin 
				forever 
				begin
					#20     //此处没有20时候仿真没有波形
					in1 = {$random} % 5'b10000;
					in2 = {$random} % 5'b10000;
				end
	end

	initial 
		begin
			// in1 = {$random} % 2;
		 //    in2 = {$random} % 2; 
			sel <= 1'b0;
			#10
			sel <= 1'b1;
			#20
			sel <= 1'b0;
			#50
			sel <= 1'b1;
		end

endmodule

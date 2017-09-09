`timescale  1ns/1ps
module tb_mux2_1 ();

	reg in1;
	reg in2;
	reg sel;
	wire out_mux2_1;

	mux2_1 u1(
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
					in1 = {$random} % 2;
					in2 = {$random} % 2;
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

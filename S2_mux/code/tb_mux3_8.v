`timescale  1ns/1ps
module tb_mux3_8 ();

	reg [2:0] A_3;
	wire [7:0] Y_8;

	mux3_8 u1 (
		.A_3(A_3),
		.Y_8(Y_8)
		);

	initial 
	begin 

					#20    					
					A_3 = 3'b110;
					#20
					A_3 = 3'b100;
					forever
						begin
							#20
							A_3 = {$random} % 4'b1000;
						end
	end

	// initial 
	// 	begin
	// 		// in1 = {$random} % 2;
	// 	 //    in2 = {$random} % 2; 
	// 		sel <= 1'b0;
	// 		#10
	// 		sel <= 1'b1;
	// 		#20
	// 		sel <= 1'b0;
	// 		#50
	// 		sel <= 1'b1;
	// 	end

endmodule

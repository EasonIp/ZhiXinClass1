module mux2_1 (in1,in2,sel,out_mux2_1);


	input in1;
	input in2;
	input sel;
	output out_mux2_1;

	assign out_mux2_1 = (sel == 0)? in1 : in2;

	// always @(posedge clk or negedge rst_n) begin : proc_
	// 	if(~rst_n) begin
	// 		out_mux2_1 <= 1'bz;
	// 	end else begin
	// 		 if (sel == 0)
	// 		 	out_mux2_1 <= in1;
	// 		 else
	// 		 if(sel == 1) begin
	// 		 	out_mux2_1 <= in2;
	// 		 end
	// 		 else
	// 		 	out_mux2_1 <= 1'bz;
	// 	end
	// end

endmodule
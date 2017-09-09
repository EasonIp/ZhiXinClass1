module fre_divn (clk,rst_n,out_fre_divn);
	input clk;
	input rst_n;
	output reg out_fre_divn;

	reg [2:0] counter_l, counter_h;
	reg current_state;

	reg S0 = 1'b0,
		S1 = 1'b1;

	parameter lw = 2,
			  hw = 3;

	always @(posedge clk or negedge rst_n) 
		begin : proc_1
			if(~rst_n) 
			begin
				out_fre_divn <= 0;
				current_state <= S0;
				counter_l <= 0;
				counter_h <= 0;
			end 
			else 
			begin
				case (current_state)
					S0 :begin
						// current_state <= S0;   //空操作了，直接跳转了，跟昨天写的只有输出和操作不同，这个有条件判断，不同条件跳转不同
													// 状态，所以应该放在if条件中；             
						if(counter_l < (lw-1) )    //减一
							begin
								counter_l <= counter_l + 1;
								counter_h <= 0 ;
								out_fre_divn <= 0;
								current_state <= S0;
							end
						else 
							begin
								counter_l <= 0;
								counter_h <= 0 ;
								out_fre_divn <= 1;
								current_state <= S1;
							end
						end
					S1 : begin
							if(counter_h < (hw -1) )  //减一
								begin
									counter_h <= counter_h + 1;
									counter_l <= 0;
									out_fre_divn <= 1;
									current_state <= S1;
								end
							else
								begin
									counter_h <= 1;
									counter_l <= 0;
									out_fre_divn <= 0;
									current_state <= S0;
								end
						end
					default : 
						begin 
							current_state <= S0;
							counter_l <= 0;
							counter_h <= 0;
							out_fre_divn <= 0;
						end


				endcase
			end
				
	    end

endmodule
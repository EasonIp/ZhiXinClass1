module fre_divn2 (clk,rst_n,out_fre_divn);
	input clk;
	input rst_n;
	output reg out_fre_divn;

	reg [2:0] counter_l, counter_h;
	parameter lw = 2,
			  hw = 3;

	always @(posedge clk or negedge rst_n) 
		begin : proc_1
			if(~rst_n) 
				begin
					out_fre_divn <= 0;
					counter_l <= 0;
					counter_h <= 0;
				end

			else
				begin 
						if(counter_l < (lw - 0)) 
							begin
							    out_fre_divn <= 0;
							    counter_l <= counter_l +1;
							    counter_h <= 0;

							end
					    else 
					    	// if (counter_l == (lw - 0) )
						    begin 
						    	out_fre_divn <= 1;
								counter_l <= 0;
						    	counter_h <= 0;

						    end
					    if(counter_h < (lw + hw - 1) )
							    	begin
							    		if (counter_h < (lw - 0) )
							    		begin
							    				out_fre_divn <= 0;
							    				counter_l <= 0;
							    				counter_h <= counter_h +1;
							    		end
							    		else
							    		begin
							    		out_fre_divn <= 1;
							    		counter_l <= 0;
										counter_h <= counter_h +1;
										end
									end
									//else
						else
						// if(counter_h == (lw + hw - 1) )
							begin
								out_fre_divn <= 0;
				    			counter_l <= 0;
				    			counter_h <= 0;
							end
					
				end
		end // proc_1

// ****
		//另一种逻辑
		if(/* condition */) 
			begin
				/* lw块 */
			end
		else
			begin
				/* hw块 */
			end
// ******

// ****
		//另一种逻辑
		if(counter_l < (lw - 0)) 
			begin
				if(counter_h == 0)
					begin
						out_fre_divn <= 0;
					    counter_l <= counter_l +1;
					    counter_h <= 0;
					end
				else
					begin
						out_fre_divn <= 0;
					    counter_l <= counter_l +1;
					    counter_h <= 0;
					end
					end
				/* lw块 */
			end
		else
			begin
				/* hw块 */
			end
// ******

endmodule

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
				if(counter_l < lw) 
					begin
					    out_fre_divn <= 0;
					    counter_l <= counter_l +1;
					    counter_h <= 0;
					end
				//else 
			    else 
				    begin
				    	out_fre_divn <= 1;
				    	counter_l <= 0;
				    	counter_h <= 0;
				    end

				if(counter_h < hw)
				    	begin
				    		out_fre_divn <= 1;
				    		counter_l <= 0;
							counter_h <= counter_h +1;
						end
						//else
				else
						begin
							out_fre_divn <= 0;
			    			counter_l <= 0;
			    			counter_h <= 0;
						end

		    end	
	    end

endmodule
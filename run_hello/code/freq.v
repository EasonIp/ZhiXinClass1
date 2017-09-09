module freq (clk,rst_n,clk_1k);
	input clk;    // Clock  50Mhz
	input rst_n;  // Asynchronous reset active low
	output reg clk_1k;

	reg [15:0]counter;

	parameter [11:0]counter_num =  50_000_000 / 10_000 / 2 -1;            //‭10K  1001 1100 0011‬  =2499
	always @(posedge clk or negedge rst_n) 
	begin : proc_
		if(~rst_n) 
			begin
				 clk_1k <= 0;
				counter <= 16'd0;
			end 
		else 
			begin
				if(counter < counter_num ) 
					begin
						counter <= counter +1;

					end
				else
					begin
						counter <= 0;
						clk_1k <= ~clk_1k;
					end

			end
	end


endmodule
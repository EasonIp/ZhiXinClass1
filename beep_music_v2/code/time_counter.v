

module time_counter (clk_1M,rst_n);
	input clk_1M;    // Clock  50Mhz
	input rst_n;  // Asynchronous reset active low
	output reg time_finish;

	parameter time_of_1M = 1000_000 / 4 -1;  //1M = 1/1000_000 =1000ns     (1/0.25)=4Hz.  1M /4hz = 1000_000 /4
	reg [31:0] counter;    //定义大一点的范围，便于后面  #(.counter_num(24'd24999999 + 24'd24999999)) u1来参数传递复用模块freq

	always @(posedge clk or negedge rst_n) 
	begin : proc_1
		if(~rst_n) 
			begin
				counter <= 32'd0;
				time_finish <= 1'b0;
			end 
		else 
			begin
				if(counter < time_of_1M ) 
					begin
						counter <= counter +1;

					end
				else
					begin
						counter <= 0;
						time_finish <= ~time_finish;
					end

			end
	end  //proc_1


endmodule
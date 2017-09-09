module led (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
	input pos_edge,
	input neg_edge,
	output reg [1:0]led
);
	reg [31:0]cnt;


	always @(posedge clk or negedge rst_n) 
	begin : proc_
		if(~rst_n)
			begin
			 led[0] <= 1'd0;
			end
		else 
			begin
				if(pos_edge)
					led[0] = ~led[0];
				
				else
					led[0] <= led[0];
			end
	end

	always @(posedge clk or negedge rst_n) 
	begin : proc_2
		if(~rst_n)
			begin
			 led[1] <= 1'd0;
			end
		else 
			begin
				if(neg_edge)
					led[1] = ~led[1];
				else
					led[1] <= led[1];
			end
	end


endmodule
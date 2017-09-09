module count (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
	input flag1,
	input flag2,
	output reg [7:0]data_bin

);

	reg [7:0]count_num;
	reg [7:0]count_num1;
	reg [7:0]count_num2;

	parameter num_Up = 255;
	parameter num_Down = 0;

// always @(posedge clk or negedge rst_n) 
// begin : proc_
// 	if(~rst_n) begin
// 		data_bin <= 8'd0;
// 	end else begin
// 		 if(flag1) begin
// 		 	count_num <= count_num + 1;
// 		 end
// 		 else if(flag2) begin
// 		  	count_num <= count_num - 1;
// 		 end
// 		 else
// 		 	count_num <= count_num;

// 	end
// end

always @(posedge clk or negedge rst_n) 
begin : proc_1
	if(~rst_n) begin
		count_num1 <= 8'd0;
	end else begin
		 
			if(flag1)
		 	count_num1 <= count_num1 + 1;
		 	else
		 	count_num1 <= count_num1;

	end
end

always @(posedge clk or negedge rst_n) 
begin : proc_2
	if(~rst_n) begin
		count_num2 <= 8'd0;
	end else begin
		 
			 if(flag2)
			  	count_num2 <= count_num2 + 1;
			 else
			 	count_num2 <= count_num2;
		 
	end
end


always @(posedge clk or negedge rst_n) 
// always @(*)
begin : proc_3
	count_num <= count_num1 - count_num2;
	if(~rst_n) begin
		data_bin <= 0;
	end else begin
			if(count_num1 < count_num2)
				begin
				data_bin <= num_Down;
				end
			else begin
					if(count_num >=num_Up)
				 	data_bin <= num_Up;
				 	else 
				 	data_bin <= count_num;
				end
		end
end

endmodule
module data_gen (clk_1,rst_n,data_in);

	input clk_1;    // Clock
	input rst_n;  // Asynchronous reset active low
	
	// reg [23:0] data_in = 24'b0000_0001_0010_0011_0100_0101;
	output reg [23:0] data_in;

	// reg [3:0] temp;
	// reg [23:0] data_in_temmp;

always @ (posedge clk_1 or negedge rst_n)
	begin
		if(~rst_n) 
			begin
				// data_in_temmp <= data_in;
				// // seg <= 8'd0;
				data_in <= 24'b0000_0001_0010_0011_0100_0101;
			end 
		else 
			begin
				// data_in <= {data_in[3:0],data_in[23:4]};  //右移
				data_in <= {data_in[19:0],data_in[23:20]};  //左移，比较容易看
			end
	end

endmodule



//另一种写法



// parameter [31:0]cnt_num = 32'd24999999;
// reg [31:0]cnt;

// always @(posedge clk or negedge rst_n) 
// 	begin : proc_
// 		if(~rst_n) 
// 		begin
// 			cnt <= 0;
// 		end 
// 		else 
// 		begin
// 			cnt <= cnt + 1;
// 		end
// 	end


// assign flag = (cnt == cnt_num)? 1'b1: 1'b0;

// always @(posedge clk or negedge rst_n)
// 	begin
// 		if(~rst_n) 
// 			begin
// 				// data_in_temmp <= data_in;
// 				// // seg <= 8'd0;
// 				data_in <= 24'h012345;
// 			end 
// 		else 
// 			begin
// 				if(flag)
// 					begin
// 						data_in <= {data_in[19:0],data_in[23:20]};  //左移，比较容易看
// 					end
// 				else
// 					begin
// 						data_in <= data_in;
// 					end
// 			end
// 	end

// endmodule
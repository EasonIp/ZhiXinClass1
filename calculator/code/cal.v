module cal(
	input clk_1khz,    // Clock
	input flag,
	input rst_n,  // Asynchronous reset active low
	input [3:0]data,
	output reg[23:0]seg_data
	
);

	//输入的两个数字
	reg [23:0]sum1;
	reg [23:0]sum2;
	reg [3:0] op_signal;   //存放操作符
	reg [3:0]current_stage;
	parameter [3:0]S0 = 4'd0;
	parameter [3:0]S1 = 4'd1;
	parameter [3:0]S2 = 4'd2;
	parameter [3:0]S3 = 4'd3;
	// parameter [3:0]S31 = 4'd4;
	// parameter [3:0]S32 = 4'd5;
	// parameter [3:0]S33 = 4'd6;
	// parameter [3:0]S34 = 4'd7;
	reg [23:0] seg_data_r;


	always @(posedge clk_1khz or negedge rst_n)
	begin : proc_1
		if(~rst_n) 
			begin
				seg_data_r <= 0;
				sum1 <= 0;
				sum2 <= 0;
				op_signal <= 0;
				current_stage <= S0;
			end 
		else 
		begin
			 case(current_stage)
			 	S0	:	begin
							seg_data_r <= 0;
							sum1 <= 0;
							sum2 <= 0;
							op_signal <= 0;
							current_stage <= S1;
			 			end
			 	S1	:	begin                  //检测得到第一个数据
			 				if(flag) 
				 				begin
					 				if(data == 4'd10)
						 				begin
						 					sum1 <= 0;
											sum2 <= 0;
						 					current_stage <= S3;
						 					seg_data_r <= sum1;
						 				end
						 			else if( data == 4'd11)
						 				begin
						 					seg_data_r <= sum1;
						 					current_stage <= S0;
						 				end
						 			else if((data >=4'd11) && (data <= 4'd15))
						 			// else if( (data == 4'd12) | (data == 4'd13) | (data == 4'd14)| (data == 4'd15))
						 				begin
						 					sum1 <= sum1;
						 					op_signal <= data;
						 					current_stage <= S2;
						 					seg_data_r <= sum1;
						 				end
						 			else 
							 			begin
							 				if(sum1 > 999999) 
								 				begin
								 					sum1 <= 0;
								 					current_stage <= S1;
								 					seg_data_r <= sum1;
								 				end
							 				else
							 					begin
							 						sum1 <= sum1* 10 + data;
							 						current_stage <= S1;
							 						seg_data_r <= sum1;
							 					end
							 			end
				 				end
				 			else
				 				begin
				 					sum1 <= sum1;
				 					current_stage <= current_stage;
				 					seg_data_r <= sum1;
				 				end
			 			end
			 	S2	:	begin             //检测得到第二个数据
								
			 				if(flag)
				 				begin
									if(data == 4'd10)
						 				begin
											sum2 <= sum2;
						 					current_stage <= S3;
						 					seg_data_r <= sum2;
						 				end
						 			else if( data == 4'd11)
						 				begin
						 					seg_data_r <= sum2;
						 					current_stage <= S0;
						 				end
						 			else if((data >=4'd11) && (data <= 4'd15))
						 			// else if( (data == 4'd12) | (data == 4'd13) | (data == 4'd14)| (data == 4'd15))
						 				begin
						 					op_signal <= data;
						 					current_stage <= S2;
						 					seg_data_r <= sum2;
						 				end
						 			else 
							 			begin
							 				if(sum2 > 999999) 
								 				begin
								 					sum2 <= 0;
								 					current_stage <= S2;
								 					seg_data_r <= sum2;
								 				end
							 				else
							 					begin
							 						sum2 <= sum2* 10 + data;
							 						current_stage <= S2;
							 						seg_data_r <= sum2;
							 					end
							 			end
							 	end
						 	else
						 		begin
						 			sum2 <= sum2;
						 			current_stage <= current_stage;
						 			seg_data_r <= sum2;
						 		end
			 			end
			 	S3	:	begin            // 检测到等号后操作
			 				if(!flag)
			 					begin
			 						current_stage <= S3;
	 								if(op_signal == 4'd12) 
						 				begin
						 					seg_data_r <=sum1 + sum2;
						 				end
					 				else if(op_signal == 4'd13)
					 					begin
					 						seg_data_r <=sum1 - sum2;
					 					end
					 				else if(op_signal == 4'd14)
					 					begin
					 						seg_data_r <=sum1 * sum2;
					 					end
					 				else if(op_signal == 4'd15)
					 					begin
					 						seg_data_r <=sum1 / sum2;
					 					end
					 				else
					 					begin
					 						seg_data_r <=0;
					 					end
			 					end
			 				else
			 					begin
					 				if(data == 4'd10)
						 				begin
						 					current_stage <= S0;   
						 				end
						 			else if( (data >=4'd11) && (data < 4'd16) )
						 				begin
						 					current_stage <= S0;
						 				end
						 			else
							 			begin
							 				current_stage <=0;
							 			end
							 	end
			 			end
			 	default	:	current_stage <= S0;
			 endcase // current_stage
		end
	end



	always @(posedge clk_1khz or negedge rst_n) 
	begin : proc_2        // 二进制数sseg_data_r转BCD
		if(~rst_n)
			begin
				seg_data <= 0;
				// cs <= 4'd0;
			end 
		else 
			begin
				seg_data[23:20] <= seg_data_r/1000_00;
				seg_data[19:16] <= (seg_data_r % 100000) /10000;
				seg_data[15:12] <= (seg_data_r % 10000) /1000;
				seg_data[11:8] <= (seg_data_r % 1000) /100;
				seg_data[7:4] <= (seg_data_r % 100) /10;
				seg_data[3:0] <= seg_data_r%10;
					// case(cs)
					// 	 4'd0  :   begin seg_data[23:20] <= seg_data_r/1000_00;  cs <= cs +1;end
					// 	 4'd1  :   begin seg_data[19:16] <= (seg_data_r % 100000) /10000; cs <= cs +1;end
					// 	 4'd2  :   begin seg_data[15:12] <= (seg_data_r % 10000) /1000;  cs <= cs +1;end
					// 	 4'd3  :   begin seg_data[11:8] <= (seg_data_r % 1000) /100;  cs <= cs +1;end
					// 	 4'd4 :   begin seg_data[7:4] <= (seg_data_r % 100) /10; cs <= cs +1;end
					// 	 4'd5 :   begin seg_data[3:0] <= seg_data_r%10;  cs <= 4'd0;end
					// 	 default :   cs <= 4'd0;
					// endcase  
			end
	end


//初始状态

//  检测第一个输入的数据,放在sum1
// 输入是 三种情况的处理
// 第一个输入的结束是操作符


// 检测第二个数据，放sum2
// 输入是 三种情况的处理
// 第一个输入的结束是等号


//检测到等号时进行相应计算


//显示当前输入的数据，输出seg_data_r，六个位的操作
//判断操作的当前输入状态，输入第一个数，输入操作符，输入第二个数，输入等号，给出最后显示得输出


//判断输入是0到9还是操作符

// case(row_col)
// 				8'b1110_1110	:	data = 4'd0;
// 				8'b1110_1101	:	data = 4'd1;
// 				8'b1110_1011	:	data = 4'd2;
// 				8'b1110_0111	:	data = 4'd3;
				
// 				8'b1101_1110	:	data = 4'd4;
// 				8'b1101_1101	:	data = 4'd5;
// 				8'b1101_1011	:	data = 4'd6;
// 				8'b1101_0111	:	data = 4'd7;
				
// 				8'b1011_1110	:	data = 4'd8;
// 				8'b1011_1101	:	data = 4'd9;
// 				8'b1011_1011	:	data = 4'd10;   //  =
// 				8'b1011_0111	:	data = 4'd11;
				
// 				8'b0111_1110	:	data = 4'd12;   //  +
// 				8'b0111_1101	:	data = 4'd13;	// -
// 				8'b0111_1011	:	data = 4'd14;   // *
// 				8'b0111_0111	:	data = 4'd15;   //  /
// endcase




endmodule
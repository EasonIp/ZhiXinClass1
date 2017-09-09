module filter(clk, rst_n, key_in, flag);

	input clk;				//系统时钟50MHZ
	input rst_n;			//低电平复位有效
	input key_in;			//低电平有效的独立按键
	
	output reg flag;		//按键次数的计数
	
	reg state;				//定义的状态
	reg [24:0] count;		//定义的计数器（20ms）
	// reg flag;				//按键稳定的标志信号
	
	// parameter cnt_num = 50_000_000 / 50 - 1;   // 20ms  50hz 消抖的时间，大于10ms就可以了
	// parameter cnt_num = 50_000_000 / 25 - 1;   //消抖的时间，大于10ms就可以了
	parameter cnt_num = 50_000_000 / 50- 1;   //消抖的时间，大于10ms就可以了

//	parameter cnt_num = 5;
	
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			begin
				state <= 0;
				count <= 25'd0;
				flag <= 0;
			end	
		else	
			begin
				case(state)		//0状态表示按键按下，1状态表示按键抬起
					0	:	begin
								if(!key_in)
									begin
										if(count < cnt_num)
											begin
												count <= count + 1;
												flag <= 0;
												state <= 0;
											end
										else
											begin
												count <= 0;
												flag <= 1;
												state <= 1;
											end
									end
								else
									begin
										state <= 0;
										count <= 25'd0;
										flag <= 0;
									end
							end
							
					1	:	begin
								flag <= 0;
								if(key_in)
									begin
										if(count < cnt_num)
											begin
												count <= count + 1;
												state <= 1;
												flag <= 0;
											end	
										else
											begin
												count <= 0;
												flag <= 0;
												state <= 0;
											end
									end
								else
									begin
										count <= 0;
										flag <= 0;
										state <= 1;
									end
							end
						default	:	state <= 0;
				endcase
			end
	end
	
	// //记录按键按下的次数
	// always @ (*)
	// begin
	// 	if(!rst_n)
	// 		sum = 4'd0;
	// 	else
	// 		if(flag)
	// 			sum = sum + 1;
	// 		else
	// 			sum = sum;
	// end

endmodule

// 	input clk,rst_n;
// 	input key_in;
// 	output reg [3:0] sum;
	
// 	reg flag;
	
// 	reg [31:0] count;
	
// 	reg state;
	
// 	// `define T 50_000_000/50
// 	`define T 5
	
// 	always @ (posedge clk or negedge rst_n)
// 	begin
// 		if(!rst_n)
// 			begin
// 				flag <= 0;
// 				count <= 0;
// 				state <= 0;
// 			end
// 		else
// 			case(state)
// 				0	:	begin
// 							if(!key_in)
// 								begin
// 									if(count < `T - 1)
// 										begin
// 											count <= count + 1;
// 											flag <= 0;
// 											state <= 0;
// 										end
// 									else
// 										begin
// 											count <= 0;
// 											flag <= 1;
// 											state <= 1;
// 										end
// 								end
// //							else
// //								begin
// //									count <= 0;
// //									state <= 0;
// //									flag <= 0;
// //								end
// 						end
						
// 				1	:	begin
// 							flag <= 0;
// 							if(key_in)
// 								begin
// 									if(count < `T - 1)
// 										begin
// 											count <= count + 1;
// 											state <= 1;
// 										end
// 									else
// 										begin
// 											count <= 0;
// 											state <= 0;
// 										end
// 								end
// 							else
// 								begin
// 									count <= 0;
// //									state <= 1;
// 								end
// 						end	
// 			endcase
// 	end
	
// 	always @ (posedge clk or negedge rst_n)
// 	begin
// 		if(!rst_n)
// 			sum <= 3'd0;
// 		else
// 			begin
// 				if(flag)
// 					sum <= sum + 1'b1;
// 				else
// 					sum <= sum;
// 			end
// 	end



// endmodule 

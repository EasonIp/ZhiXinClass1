module pulse (
	input clk,    // Clock
	input 	key_in,   //独立按键,低电平有效
	input rst_n,  // Asynchronous reset active low
	output reg [3:0]sum
);

	reg state;
	reg [23:0]counter;
	reg flag;  //为1时按键稳定,按键稳定的标志信号

	parameter counter_num = 50_000_000 / 50 - 1;        // 20ms 消抖  50Hz, 减一是因为初值给0

	always @(posedge clk or negedge rst_n) 
	begin : proc_
		if(~rst_n)                        //复位给定义的reg信号给
			begin
				state <= 1'b0;
				// sum <= 4'd0;
				counter <= 24'd0;
				flag <= 1'd0;     //
			end
		else
			begin
				case (state)
					1'b0	:	
						begin
								if(!key_in)      //按键按下，低电平有效
									begin
										if(counter < counter_num) 
											begin
												counter <= counter + 1;
												flag <= 0;
												state <= 0;
											end
										else                         //消抖完成，
											begin
												counter  <=0;
												flag <= 1;
												state <= 1;     //按下的状态完成了，调到检测抬起的状态
											end

									end
								else
									begin
										state <= 1'b0;
										// sum <= 4'd0;
										counter <= 24'd0;
										flag <= 1'd0;     //
									end
						end
					1'b1	:	
						begin
							flag <= 0;     //刚进入抬起状态就先拉低

							if(key_in)      //按键抬起
								begin
									if(counter < counter_num) 
										begin
											counter <= counter + 1;
											flag <= 0;
											state <= 1;
										end
									else                         //消抖完成，
										begin
											counter  <=0;
											flag <= 0;        //	上面的flag <= 1；这里再为1会一次按键flag记两次
											state <= 0;     //按下的状态完成了，调到检测抬起的状态
										end

								end
							else
								begin
									state <= 1'b1;
									// sum <= 4'd0;
									counter <= 24'd0;
									flag <= 1'd0;     //
								end
						end

				endcase
			end
	end

always @ (*)        //sum与时钟没直接关系，用组合逻辑
begin : proc_2
	if(~rst_n) 
		begin
			sum = 4'd0;
		end 
	else 
		begin
			 if(flag) 
				 begin
				 	sum = sum +1;
				 end
			 else
			 	begin
			 		sum = sum;    //尖峰计数，不是清零，而是保持原值
			 	end
		end
end



endmodule
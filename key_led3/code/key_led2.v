module key_led2(clk, rst_n, key_in, sum);

	input clk;				//系统时钟50MHZ
	input rst_n;			//低电平复位有效
	input key_in;			//低电平有效的独立按键

	output reg [2:0] sum;		//按键次数的计数
	
	reg state;				//定义的状态
	reg [24:0] count;		//定义的计数器（20ms）
	reg flag;				//按键稳定的标志信号
	
	parameter cnt_num = 50_000_000 / 50 - 1;  //20ms  计数
	// parameter cnt_num = 5;
	
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)      //复位时对reg信号赋初值
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
	
	//记录按键按下的次数
	// always @ (*)
	always @ (posedge clk or negedge rst_n)
	// always @ (flag)
	begin
		if(!rst_n)
			sum = 3'd0;
		else
			if(flag)
				sum = sum + 1;
			else
				sum = sum;
	end

endmodule 

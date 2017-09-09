module key_scan (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
	input [3:0]row,
	output reg [3:0]col,
	output reg [3:0]data,
	output reg flag
);


	parameter  S0 = 4'd0;
	parameter  S1 = 4'd1;
	parameter  S2 = 4'd1;
	// parameter  S3 = 4'd1;

	reg [3:0]current_state;
	reg [3:0]col_r;
	reg [3:0]row_r;

	reg [31:0]cnt;
	reg cnt_flag;
	parameter cnt_num = 50_000_000 / 50 / 2 -1;

always @(posedge clk or negedge rst_n) 
	begin : proc_1
		if(~rst_n) begin
			flag <= 0;
			// data <=0;
			col <=4'b1111;
		end 
		else 
		case (current_state)
			S0	:	
				begin
					if( row != 4'b1111 )
						begin
							col <= 4'b1110;
							current_state = S1;
							flag <= 0;
						end 
					else
						begin
						current_state = S0;
						end
				end
			S1	:
				begin
					if( row != 4'b1111 )
					begin
						if(!cnt_flag) 
							begin

								if(row != 4'b1111)
									begin
									col_r <= col;
									row_r <= row;
									flag <= 1;
									col <= 4'b0000;
									current_state = S2;
									end
								else
									begin
										col <= {col[0],col[3:1]};
										current_state = S1;
										flag <= 0;
									end
							end
						else
							begin
							flag <= 0;
							current_state <= S0;
							end
					end
					else
					begin
							flag <= 0;
							current_state <= S0;
					end
				end
			S2 :
				begin
					if( row == 4'b1111 )
					begin
						if(!cnt_flag) 
							begin

								if(row != 4'b1111) 
									begin
									col_r <= col;
									row_r <= row;
									flag <= 1;
									col <= 4'b0000;
									current_state = S1;
									end
								else
									begin
										col <= {col[0],col[3:1]};
										current_state = S2;
										flag <= 0;
									end
							end
						else
							begin
							flag <= 0;
							current_state <= S2;
							end
					end
					else
					begin
							flag <= 0;
							current_state <= S2;
					end
				end
			default : current_state <= S0;
		endcase
			
	end




	always @(posedge clk or negedge rst_n) 
	begin  
		if(~rst_n) begin
			cnt <= 0;
			cnt_flag <= 0;
		end else
			begin
				if(cnt < cnt_num) begin
					cnt <= cnt +1;
					cnt_flag <= 0;
				end
				else
					begin
						cnt_flag <= 1;
						cnt <= 0;
					end
			end
	end


always @(posedge clk or negedge rst_n) 
begin : proc_    //row_r,  col_r 译码得到data值
	if(~rst_n)
	   data <= 4'h0;
  else
      case ({col_r, row_r})
        8'b1110_1110 : data <= 4'h0;
        8'b1110_1101 : data <= 4'h4;
        8'b1110_1011 : data <= 4'h8;
        8'b1110_0111 : data <= 4'hC;
        8'b1101_1110 : data <= 4'h1;
        8'b1101_1101 : data <= 4'h5;
        8'b1101_1011 : data <= 4'h9;
        8'b1101_0111 : data <= 4'hD;
        8'b1011_1110 : data <= 4'h2;
        8'b1011_1101 : data <= 4'h6;
        8'b1011_1011 : data <= 4'hA;
        8'b1011_0111 : data <= 4'hE;
        8'b0111_1110 : data <= 4'h3;
        8'b0111_1101 : data <= 4'h7;
        8'b0111_1011 : data <= 4'hB;
        8'b0111_0111 : data <= 4'hF;
      endcase
end
endmodule




// 三段式


// module key_scan (
// 	input clk,    // Clock
// 	input rst_n,  // Asynchronous reset active low
// 	input [3:0]row,
// 	output reg [3:0]col,
// 	output reg [3:0]data,
// 	output reg flag
// );


// 	parameter  S0 = 4'd0;
// 	parameter  S1 = 4'd1;
// 	parameter  S2 = 4'd1;
// 	// parameter  S3 = 4'd1;

// 	reg [3:0]current_state;
// 	reg [3:0]next_state;

// 	reg [31:0]cnt;
// 	reg cnt_flag;
// 	parameter cnt_num = 50_000_000 / 50 / 2 -1;

// 	always @(posedge clk or negedge rst_n) 
// 	begin  
// 		if(~rst_n) begin
// 			cnt <= 0;
// 			cnt_flag <= 0;
// 		end else
// 			begin
// 				if(cnt < cnt_num) begin
// 					cnt <= cnt +1;
// 					cnt_flag <= 0;
// 				end
// 				else
// 					begin
// 						cnt_flag <= 1;
// 						cnt <= 0;
// 					end
// 			end
// 	end

// 	//同步时序always模块，格式化描述次态寄存器迁移到现态寄存器
// always @ (posedge clk or negedge rst_n)
// 	begin
// 		if(!rst_n)
// 		current_state <= S0;
// 		else
// 		current_state <= next_state;
// 	end


// 	//组合逻辑always模块，描述状态转移条件判断
// always @ (*) //电平触发,  阻塞赋值
// 	begin
// 	next_state = S0; //要初始化，使得系统复位后能进入正确的状态
// 	case(current_state)
// 		S0	: begin
// 				if( row != 4'b1111 )
// 					begin
// 						col <= 4'b1110;
// 						next_state = S1;
// 					end 
				
// 				else next_state = S0;
// 			  end
// 		S1	: begin    //键按下
// 				if( row != 4'b1111 )
// 				begin
// 					if(cnt_flag)
// 					begin
// 						// col <= 4'b1110;
// 						next_state = S2;
// 					end
// 					else next_state = S1;
// 				end
// 			  end
// 		S2	: begin
// 				if( row == 4'b1111 )
// 				begin
// 					if(cnt_flag)
// 						begin
// 						next_state = S1;
// 						// col <= 4'b0000;
// 					    end
// 					else next_state = S2;
// 				end
// 			  end
// 		default : next_state = S0;
// 		endcase
// 	end

// 	reg [3:0]col_r;
// 	reg [3:0]row_r;



// 	//同步时序always模块，格式化描述次态寄存器输出
// always @ (posedge clk or negedge rst_n)      //  得到row_r  col_r flag的值
// 	begin
// 		if(!rst_n) 	begin
// 					// col <= 4'b0111;
// 					col_r <= 4'b1111;
// 					row_r <= 4'b1111;
// 					flag <= 0;
// 					end
// 		else
// 		case(next_state)
// 			S0	:
// 					begin
// 						// col <= 4'b1110;
// 						col_r <= 4'b1111;
// 						row_r <= 4'b1111;
// 						flag <= 0;
// 					end
// 			S1	:    //按下了  扫描信号
// 					begin
// 							// col <= 4'b1110;

// 							if(row != 4'b1111 ) 	
// 									begin
// 									col_r <= col;
// 									row_r <= row;
// 									flag <= 1;

// 									col <= 4'b0000; //可以不用这一句，这里给出来是先强行给值，下面S2
// 													// 再判断键是否抬起  1111
// 									end
// 							else 	begin
// 									flag <= 0;

// 									col <= {col[0],col[3:1]};
// 									end
// 							end
			
// 			S2	:	// 键抬起
// 				begin
// 					if(row == 4'b1111) 
// 						begin
// 							col_r <= col;
// 							row_r <= row;
// 							flag <= 1;
// 						end
// 					else 
// 						begin
// 							col <= {col[0],col[3:1]};
// 							flag <= 0;
// 						end

// 				end
// 			// default:... //default的作用是免除综合工具综合出锁存器。
// 		endcase
// 	end


// always @(posedge clk or negedge rst_n) 
// begin : proc_    //row_r,  col_r 译码得到data值
// 	if(~rst_n)
// 	   data <= 4'h0;
//   else
//       case ({col_r, row_r})
//         8'b1110_1110 : data <= 4'h0;
//         8'b1110_1101 : data <= 4'h4;
//         8'b1110_1011 : data <= 4'h8;
//         8'b1110_0111 : data <= 4'hC;
//         8'b1101_1110 : data <= 4'h1;
//         8'b1101_1101 : data <= 4'h5;
//         8'b1101_1011 : data <= 4'h9;
//         8'b1101_0111 : data <= 4'hD;
//         8'b1011_1110 : data <= 4'h2;
//         8'b1011_1101 : data <= 4'h6;
//         8'b1011_1011 : data <= 4'hA;
//         8'b1011_0111 : data <= 4'hE;
//         8'b0111_1110 : data <= 4'h3;
//         8'b0111_1101 : data <= 4'h7;
//         8'b0111_1011 : data <= 4'hB;
//         8'b0111_0111 : data <= 4'hF;
//       endcase
// end
// endmodule

// //一段式正确
// module ram_control (clk,rst_n,data_out,addr_out,wren);

// 	input clk;
// 	input  rst_n;
// 	output reg [7:0] data_out;
// 	output reg [7:0] addr_out;
// 	output reg wren;  //0 read

// 	parameter S0 = 1'b0,  //write
// 			  S1 = 1'b1;  //read
// 	reg current_state;

// 	always @(posedge clk or negedge rst_n) 
// 		begin : proc_1
// 			if(~rst_n) 
// 			begin
// 				wren <= 1'b1;
// 				data_out <= 0;
// 				addr_out <= 0;
// 				// next_state <= S0;
// 				current_state <= S0;
// 			end 
// 			else 
// 			begin
// 				case (current_state)
// 					S0: begin
							
// 							if (addr_out < 8'd255)
// 								begin
// 								wren <= 1'b1;
// 								addr_out <= addr_out + 1;
// 								data_out <= data_out + 1;
// 								current_state <= S0;
// 								end
// 							else
// 								begin
								
// 								// addr_out <= 0;
// 								// data_out <= 0;
// 								wren <= 1'b0;
// 								addr_out <= 0;
// 								current_state <= S1;
// 								end
// 						end
						
// 					S1: begin
							
// 							if (addr_out < 8'd255)
// 								begin
// 								wren <= 1'b0;
// 								addr_out <= addr_out +8'd1;
// 								current_state <= S1;
// 								// data_out = data_out +1;
// 								end
// 							else 
// 								begin
									
// 									// addr_out <= 0;
// 									// data_out = 0;
// 									wren <= 1'b1;
// 									addr_out <= 0;
// 									data_out <= 0;
// 									current_state <= S0;
// 								end
// 						end
// 					// default :  default ;
// 				endcase
// 			end
// 		end //proc_1

// endmodule


// 三段式 
// module ram_control (clk,rst_n,data_out,addr_out,wren);

// 	input clk;
// 	input  rst_n;
// 	output reg [7:0] data_out;
// 	output reg [7:0] addr_out;
// 	output reg wren;  //0 read

// 	parameter S0 = 1'b0,  //write
// 			  S1 = 1'b1;  //read
// 	reg current_state,next_state;

// 	always @ (posedge clk or negedge rst_n) 
// 		begin : proc_1
// 			 if(!rst_n) 
// 				begin
// 			// 	// data_out <= 0;
// 			// 	// addr_out <= 0;
// 			// 	// wren <= 1'b1;
// 			// 	//next_state <= S0;
// 			 	current_state <= S0;
// 				end 
// 			else 
// 			begin
				
// 				current_state <= next_state;
// 			end
// 		end //proc_1

// 	always @ (*) 
// 	begin : proc_2
// 		// addr_out <= 0;
// 		// data_out <= 0;
// 		if(~rst_n) 
// 			begin
				
				
// 				next_state = S0;
// 				// current_state <= 0;
// 			end
// 		else 
// 			begin
// 				case (current_state)
// 					S0: begin
							
// 							if (addr_out < 8'd255)
// 								begin
// 								next_state = S0;
// 								end
// 							else
// 								begin
								
// 								// addr_out <= 0;
								
								
// 								next_state = S1;
// 								end
// 						end
						
// 					S1: begin
							
// 							if (addr_out < 8'd255)
// 								begin
// 								next_state = S1;
// 								end
// 							else 
// 								begin
									
// 									// addr_out <= 0;
// 									// data_out = 0;
// 									next_state = S0;
// 								end
// 						end
// 					default : begin
// 								 // wren <= 1'b1;
// 								 // addr_out <= 0;
// 								 // data_out <= 0;
// 								 next_state = S0;
// 								end
// 				endcase // current_state
// 			end
// 	end// proc_2

// 	always @(posedge clk or negedge rst_n) 
// 	begin : proc_3
// 		if(!rst_n) 
// 			begin
// 			 	wren <= 1'b1;
// 				data_out <= 8'd0;
// 				addr_out <= 8'd0;;
// 			end 
// 		else 
// 		begin
// 			 case (current_state)
// 			 	S0	:	if(addr_out < 255) 
// 						 	begin
// 						 		wren <= 1'b1;
// 								addr_out <= addr_out + 8'd1;
// 								data_out <= data_out + 8'd1;
// 						 	end
// 						 else
// 						 	begin
// 						 		wren <= 1'b0;
// 								addr_out <= 0;
// 								data_out <= 0;
// 						 	end
// 				S1	:	if(addr_out < 255) 
// 						 	begin
// 						 		wren <= 1'b0;
// 								addr_out <= addr_out + 8'd1;
// 								data_out <= data_out + 8'd1;
// 						 	end
// 						 else
// 						 	begin
// 						 		wren = 1'b0;
// 								addr_out <= 0;
// 								data_out <= 0;
// 						 	end
// 				default	: wren <= 1;
// 			 endcase
// 		end
// 	end  //proc_3

// endmodule




module ram_control(clk, rst_n, addr_out, data_out, wren);

	input clk;
	input rst_n;
	
	output reg [7:0] addr_out;
	output reg [7:0] data_out;
	output reg wren;
	
	reg cs,ns;
	
	always @ (posedge clk)
	begin
		if(!rst_n)
			cs <= 0;
		else
			cs <= ns;
	end
	
	always @ (*)
	begin
		if(!rst_n)
			begin
				ns = 0;
			end
		else
			begin
				case(cs)
					0	:	begin
								if(addr_out < 8'd255)
									begin
										ns <= 0;
									end
								else
									begin
										ns = 1;
									end
							end
							
					1	:	begin
								if(addr_out < 8'd255)
									begin									
										ns <= 1;
									end
								else
									begin
										ns = 0;
									end
							end
				endcase
			end
	end
	
	always @ (posedge clk or negedge rst_n)     //三段式中第三段解决了addr，data和wren等跟时钟有关系的信号放在
												//二段式中第二段会因为 迭代二产生锁存器的问题；第三段加了寄存器，虽然
												//会再添加一个周期延时，但是实现了完整的功能；
												//二段式中实现不了的原因是锁存器问题
	begin
		if(!rst_n)
			begin
				addr_out = 8'd0;
				data_out = 8'd0;
				wren = 1'b0;
			end
		else
			begin
				case(ns)
					0	:	begin
								wren = 1'b1;
								addr_out = addr_out + 1'd1;
								data_out = data_out + 1'd1;
							end
							
					1	:	begin
								wren = 1'b0;
								addr_out = addr_out + 1'd1;
							end
					default	:	wren = 1;
				endcase
			end
	end

endmodule 


// 两段式状态机所实现的效果，甚至最终无法实现功能要求。
// 同样的功能，一段式和三段式状态机之所以能够解决 这个问题，
// 就是避免了在纯组合逻辑中涉及这个反馈逻辑。在初学verilog时，
// 我们常提的latch（锁存器），其实也是combinational loop的一个特例。




// // 二段式  30ns停机   第二段中的一些信号是与时钟有关系的，放在这里作为组合逻辑会产生锁存器  addr_out 和 data进行迭代了，所以产生了锁存器，解决方法是加一个
//  //  加一层寄存器，（地址，数据，使能），会延时2个周期
// module ram_control (clk,rst_n,data_out,addr_out,wren);

// 	input clk;
// 	input  rst_n;
// 	output reg [7:0] data_out;
// 	output reg [7:0] addr_out;
// 	output reg wren;  //0 read

// 	parameter S0 = 1'b0,  //write
// 			  S1 = 1'b1;  //read
// 	reg current_state,next_state;

// 	always @ (posedge clk) 
// 		begin : proc_1
// 			// if(~rst_n) 
// 			// begin
// 			// 	// data_out <= 0;
// 			// 	// addr_out <= 0;
// 			// 	// wren <= 1'b1;
// 			// 	//next_state <= S0;
// 			// 	current_state <= S0;
// 			// end 
// 			// else 
// 			// begin
				
// 				current_state <= next_state;
// 			// end
// 		end //proc_1

// 	always @ (*) 
// 	begin : proc_2
// 		// addr_out <= 0;
// 		// data_out <= 0;
// 		if(~rst_n) 
// 			begin
				
// 				wren = 1'b1;
// 				data_out = 0;
// 				addr_out = 0;
// 				next_state = S0;
// 				// current_state <= 0;
// 			end
// 		else 
// 			begin
// 				case (current_state)
// 					S0: begin
							
// 							if (addr_out < 8'd255)
// 								begin
// 								wren = 1'b1;
// 								addr_out = addr_out + 8'd1;
// 								data_out = data_out + 8'd1;
// 								next_state = S0;
// 								end
// 							else
// 								begin
								
// 								// addr_out <= 0;
								
// 								wren = 1'b0;
// 								addr_out = 0;
// 								data_out = 0;
// 								next_state = S1;
// 								end
// 						end
						
// 					S1: begin
							
// 							if (addr_out < 8'd255)
// 								begin
// 								wren = 1'b0;
// 								addr_out = addr_out + 8'd1;
// 								data_out = data_out + 8'd1;
								
// 								next_state = S1;
// 								end
// 							else 
// 								begin
									
// 									// addr_out <= 0;
// 									// data_out = 0;
// 									wren = 1'b1;
// 									addr_out = 0;
// 									data_out = 0;
// 									next_state = S0;
// 								end
// 						end
// 					default : begin
// 								 // wren <= 1'b1;
// 								 // addr_out <= 0;
// 								 // data_out <= 0;
// 								 next_state = S0;
// 								end
// 				endcase // current_state
// 			end
// 	end// proc_2

// endmodule


//很多问题

// module ram_control (clk,rst_n,data_out,addr_out,wren);

// 	input clk;
// 	input  rst_n;
// 	output reg [7:0] data_out;
// 	output reg [7:0] addr_out;
// 	output reg wren;  //0 read

// 	parameter S0 = 1'b0,  //write
// 			  S1 = 1'b1;  //read
// 	reg current_state,next_state;

// 	always @(posedge clk or negedge rst_n) 
// 		begin : proc_1
// 			if(~rst_n) 
// 			begin
// 				// data_out <= 0;
// 				// addr_out <= 0;
// 				// wren <= 1'b1;
// 				//next_state <= S0;
// 				current_state <= S0;
// 			end 
// 			else 
// 			begin
				
// 				current_state <= next_state;
// 			end
// 		end //proc_1

// 	always @ (*) 
// 	begin : proc_2
// 		case (current_state)
// 			S0: begin
// 					next_state <= S1;   //直接跳转了   不对
// 					wren <= 1'b1;
// 					if (addr_out < 8'd255)
// 						begin
// 						addr_out <= addr_out + 1;
// 						data_out <= data_out + 1;
// 						end
// 					else
// 						begin
// 						addr_out <= 0;
// 						data_out <= 0;
// 						end
// 				end
				
// 			S1: begin
// 					next_state <= S0;
// 					wren <= 1'b0;
// 					if (addr_out < 8'd255)
// 						begin
// 						addr_out <= addr_out +1;
// 						// data_out = data_out +1;
// 						end
// 					else 
// 						begin
// 							addr_out <= 0;
// 							// data_out = 0;
// 						end
// 				end
// 			default : begin
// 						 wren <= 1'b1;
// 						 addr_out <= 0;
// 						 data_out <= 0;
// 					end
// 		endcase // current_state
// 	end// proc_2

// endmodule
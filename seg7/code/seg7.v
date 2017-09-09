module seg7 (clk_1k,rst_n,sel,seg);

	input clk_1k;    // Clock
	input rst_n;  // Asynchronous reset active low
	
	// reg [23:0] data_in = 24'b0000_0001_0010_0011_0100_0101;
	parameter [23:0] data_in = 24'b0000_0001_0010_0011_0100_0101;
	output reg [7:0] seg;
	output reg [2:0] sel;

	reg [3:0] temp;
	// reg [23:0] data_in_temmp;


always @(posedge clk_1k or negedge rst_n)
	begin
		if(~rst_n) 
			begin
				// data_in_temmp <= data_in;
				// // seg <= 8'd0;
				sel <= 3'd0;
			end 
		else 
			begin
				if(sel < 5) 
					begin
						sel <= sel + 1;
					end
				else
					begin
						sel <= 0;
					end
			end

	end


always @ (*)
	begin
		if(~rst_n) 
			begin
				
				temp <= 0;
			end 
		else 
			begin
				case(sel) 
					0	:	temp =	data_in[23:20];
					1	:	temp =	data_in[19:16];
					2	:	temp =	data_in[15:12];
					3	:	temp =	data_in[11:8];
					4	:	temp =	data_in[7:4];
					5	:	temp =	data_in[3:0];
					default	: temp = data_in[23:20];
				endcase
			end

	end

// always @( posedge clk_1k )   //移码没有延时，与时钟没关系，谢了的话会有延时；seg延时temp和sel一个周期
always @(*)
	begin : proc_2
		begin
				case(temp)
					4'd0	: 	seg = 8'b1100_0000;
					4'd1	:	seg = 8'b11111001; //1
					4'd2	:	seg = 8'b10100100; //2
					4'd3	:	seg = 8'b10110000; //3
					4'd4	:	seg = 8'b10011001; //4
					4'd5	:	seg = 8'b10010010; //5

					4'd6	:	seg = 8'b10000010; //6
					4'd7	:	seg = 8'b11111000; //7
					4'd8	:	seg = 8'b10000000; //8
					4'd9	:	seg = 8'b10010000; //9
					4'd10	:	seg = 8'b10001000; //a
					4'd11	:	seg = 8'b10000011; //b
					4'd12	:	seg = 8'b10000110; //c
					4'd13	:	seg = 8'b10100001; //d
					4'd14	:	seg = 8'b10000110; //e
					4'd15	:	seg = 8'b10001110; //f
				endcase
			end
	end



//有问题
// always @(posedge clk_1k)
// 	begin
// 		if(~rst_n) 
// 			begin
// 				data_in_temmp <= data_in;
// 				temp <= data_in[23:20];
// 			end 
// 		else 
// 			begin
// 				if(sel == 0) 
// 					begin
// 						data_in_temmp <= data_in;
// 						// temp <= 4'd0;
// 						temp <= data_in_temmp[23:20]
// 					end
// 				else
// 					begin
// 						data_in_temmp <= {data_in_temmp[3:0],data_in_temmp[23:4]};
// 						temp <= data_in_temmp[23:20];
// 					end
// 			end

// 	end


// always @(posedge clk_1k or negedge rst_n) 
// begin : proc_1
// 	if(~rst_n) 
// 		begin
// 			data_in_temmp <= data_in;
// 			// seg <= 8'd0;
// 			sel <= 3'd0;
// 		end 
// 	else 
// 		begin
// 			data_in_temmp <= {data_in_temmp[3:0],data_in_temmp[23:20]};
// 			temp <= data_in_temmp[23:20];
// 			if(sel < 5)
// 				begin
					
// 					// data_in_temmp <= {data_in_temmp[3:0],data_in_temmp[23:20]};
// 					// temp <= data_in_temmp[23:20];
// 					sel <= sel +1;
// 						// case(temp)
// 						// 	4'd0	: 	seg <= 8'b1100_0000;
// 						// 	4'd1	:	seg <= 8'b11111001; //1
// 						// 	4'd2	:	seg <= 8'b10100100; //2
// 						// 	4'd3	:	seg <= 8'b10110000; //3
// 						// 	4'd4	:	seg <= 8'b10011001; //4
// 						// 	4'd5	:	seg <= 8'b10010010; //5
// 						// 	4'd6	:	seg <= 8'b10000010; //6
// 						// 	4'd7	:	seg <= 8'b11111000; //7
// 						// 	4'd8	:	seg <= 8'b10000000; //8
// 						// 	4'd9	:	seg <= 8'b10010000; //9
// 						// 	4'd10	:	seg <= 8'b10001000; //a
// 						// 	4'd11	:	seg <= 8'b10000011; //b
// 						// 	4'd12	:	seg <= 8'b10000110; //c
// 						// 	4'd13	:	seg <= 8'b10100001; //d
// 						// 	4'd14	:	seg <= 8'b10000110; //e
// 						// 	4'd15	:	seg <= 8'b10001110; //f
// 						// endcase
// 				end
// 			else
// 				begin
// 					// data_in_temmp <= data_in;
// 					// temp <= data_in_temmp[23:20];
// 					sel <= 0;
// 						// case(temp)
// 						// 	4'd0	: 	seg <= 8'b1100_0000;
// 						// 	4'd1	:	seg <= 8'b11111001; //1
// 						// 	4'd2	:	seg <= 8'b10100100; //2
// 						// 	4'd3	:	seg <= 8'b10110000; //3
// 						// 	4'd4	:	seg <= 8'b10011001; //4
// 						// 	4'd5	:	seg <= 8'b10010010; //5
// 						// 	4'd6	:	seg <= 8'b10000010; //6
// 						// 	4'd7	:	seg <= 8'b11111000; //7
// 						// 	4'd8	:	seg <= 8'b10000000; //8
// 						// 	4'd9	:	seg <= 8'b10010000; //9
// 						// 	4'd10	:	seg <= 8'b10001000; //a
// 						// 	4'd11	:	seg <= 8'b10000011; //b
// 						// 	4'd12	:	seg <= 8'b10000110; //c
// 						// 	4'd13	:	seg <= 8'b10100001; //d
// 						// 	4'd14	:	seg <= 8'b10000110; //e
// 						// 	4'd15	:	seg <= 8'b10001110; //f
// 						// endcase
// 				end
// 				/* code */
// 			// case (sel)
// 			// 	3'd0:	begin
// 			// 			temp <= data_in[23:20];
// 			// 			sel <= sel+1;
// 			// 			end
// 			// 	3'd1:	begin
// 			// 			temp <= data_in[19:16];
// 			// 			sel <= sel+1;
// 			// 			end
// 			// 	3'd2:	begin
// 			// 			temp <= data_in[15:12];
// 			// 			sel <= sel+1;
// 			// 			end
// 			// 	3'd3:	begin
// 			// 			temp <= data_in[11:8];
// 			// 			sel <= sel+1;
// 			// 			end
// 			// 	3'd4:	begin
// 			// 			temp <= data_in[7:4];
// 			// 			sel <= sel+1;
// 			// 			end
// 			// 	3'd5:	begin
// 			// 			temp <= data_in[3:0];
// 			// 			sel <= 3'd0;
// 			// 			end
// 			// 	default
// 			// 			begin
// 			// 			temp <= data_in[23:20];
// 			// 			sel <= 3'd0;
// 			// 			end
// 			// endcase
// 		end
// end  //proc_1



endmodule
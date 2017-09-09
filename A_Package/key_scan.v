module key_scan(clk, rst_n, row, col, flag, data);

	input clk;
	input rst_n;
	input [3:0] row;			//行线
	output reg [3:0] col;	//列线
	output reg flag;			//反馈的标志信号
	output reg [3:0] data;  //按键值
	
	reg [31:0] counter;		//分频的计数器
	reg clk_1khz;				//1khz
	
	parameter T = 50_000_000/1000/2 - 1;

	//分频到1khz
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			begin
				counter <= 32'd0;
				clk_1khz <= 0;
			end
		else
			begin
				if(counter < T)
					counter <= counter + 1;
				else
					begin
						counter <= 0;
						clk_1khz <= ~clk_1khz;
					end
			end
	end
	
	reg [4:0] cnt_time;	//时间计数器
	reg [7:0] row_col;	//存储按键值
	reg [1:0] state;		
	
	parameter s0 = 2'b00;
	parameter s1 = 2'b01;
	parameter s2 = 2'b10;
	
	always @ (posedge clk_1khz or negedge rst_n)
	begin
		if(!rst_n)
			begin
				cnt_time <= 5'd0;
				row_col <= 8'd0;
				state <= s0;
				col <= 4'b0000;
				flag <= 0;
			end
		else
			case(state)
			s0	:	begin
						if(row != 4'b1111)
							begin
								if(cnt_time < 19)
									begin
										cnt_time <= cnt_time + 1;
										flag <= 0;
									end
								else
									begin
										cnt_time <= 0;
										col <= 4'b0111;
										state <= s1;
									end
							end
						else
							begin
								cnt_time <= 0;
								flag <= 0;
							end
					end
					
			s1	:	begin
						if(row != 4'b1111)
							begin
								row_col <= {row, col};
								flag <= 1;
								col <= 4'b0000;
								state <= s2;
							end
						else
							begin
								col <= {col[0], col[3:1]};
								state <= s1;
							end
					end
					
			s2	:	begin
						if(row == 4'b1111)
							begin
								if(cnt_time < 19)
									cnt_time <= cnt_time + 1;
								else
									begin
										cnt_time <= 0;
										col <= 4'b0000;
										flag <= 0;
										state <= s0;
									end
							end
						else
							begin
								cnt_time <= 0;
								flag <= 0;
								state <= s2;
							end
					end
					default	:	state <= s0;
			endcase						
	end
	
	always @ (*)
	begin
		if(!rst_n)
			data <= 4'd0;
		else
			case(row_col)
				8'b1110_1110	:	data = 4'd0;
				8'b1110_1101	:	data = 4'd1;
				8'b1110_1011	:	data = 4'd2;
				8'b1110_0111	:	data = 4'd3;
				
				8'b1101_1110	:	data = 4'd4;
				8'b1101_1101	:	data = 4'd5;
				8'b1101_1011	:	data = 4'd6;
				8'b1101_0111	:	data = 4'd7;
				
				8'b1011_1110	:	data = 4'd8;
				8'b1011_1101	:	data = 4'd9;
				8'b1011_1011	:	data = 4'd10;
				8'b1011_0111	:	data = 4'd11;
				
				8'b0111_1110	:	data = 4'd12;
				8'b0111_1101	:	data = 4'd13;
				8'b0111_1011	:	data = 4'd14;
				8'b0111_0111	:	data = 4'd15;
			endcase
	end
		
endmodule 

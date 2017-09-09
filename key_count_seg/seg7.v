module seg7(clk, rst_n, data_in, sel, seg);

	input clk;
	input rst_n;
	input [23:0] data_in;
	output reg [2:0] sel;
	output reg [7:0] seg;
	
//	parameter data_in = 24'h123456;
	
	reg [3:0] data_temp;
	reg [31:0] count;
	reg clk_1khz;
	
	parameter T = 50_000_000 /1000 /2 - 1;
	
	always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			begin
				count <= 32'd0;
				clk_1khz <= 0;
			end
		else
			begin
				if(count < T)
					count <= count + 1;
				else
					begin
						count <= 0;
						clk_1khz <= ~clk_1khz;
					end
			end
	end
	
	
	/*********鎵弿6涓暟鐮佺***********/
	always @ (posedge clk_1khz or negedge rst_n)
	begin
		if(!rst_n)
			sel <= 3'd0;
		else
			if(sel < 3'd5)
				sel <= sel + 1;
			else
				sel <= 0;
	end
	
	always @ (posedge clk_1khz or negedge rst_n)
	begin
		if(!rst_n)
			data_temp <= 4'd0;
		else 
			case(sel)
				3'd0	:	data_temp <= data_in[23:20];
				3'd1	:	data_temp <= data_in[19:16];
				3'd2	:	data_temp <= data_in[15:12];
				3'd3	:	data_temp <= data_in[11:8];
				3'd4	:	data_temp <= data_in[7:4];
				3'd5	:	data_temp <= data_in[3:0];
				default	:	data_temp <= data_in[23:20];
			endcase
	end
	
	/*********鏁扮爜绠″搴旂殑璇戠爜***********/
	always @ (*)
	begin
		if(!rst_n)
			seg = 8'b1100_0000;
		else
			begin
				case(data_temp)
//					4'd0	:	seg = 8'b1000_1001;
//					4'd1	:	seg = 8'b1000_0110;
//					4'd2	:	seg = 8'b1100_0111;
//					4'd3	:	seg = 8'b1100_0111;
//					4'd4	:	seg = 8'b1100_0000;
//					4'd5	:	seg = 8'b1111_1111;
					
//					4'd4	:	seg <= 8'b1001_1001;
//					4'd5	:	seg <= 8'b1001_0010;
					// 4'd0	:	seg = 8'b1100_0000;
					// 4'd1	:	seg = 8'b1111_1001;
					// 4'd2	:	seg = 8'b1010_0100;
					// 4'd3	:	seg = 8'b1011_0000;
					
					// 4'd4	:	seg <= 8'b1001_1001;
					// 4'd5	:	seg <= 8'b1001_0010;
					// 4'd6	:	seg <= 8'b1000_0010;
					// 4'd7	:	seg <= 8'b1111_1000;
					
					// 4'd8	:	seg = 8'b1000_0000;
					// 4'd9	:	seg = 8'b1001_0000;
					// 4'd10	:	seg = 8'b1000_1000;
					// 4'd11	:	seg = 8'b1000_0011;
					
					// 4'd12	:	seg = 8'b1100_0110;
					// 4'd13	:	seg = 8'b1010_0001;
					// 4'd14	:	seg = 8'b1000_0110;
					// 4'd15	:	seg = 8'b1000_1110;

					4'd0	: 	seg = 8'b1100_0000;//0
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

endmodule 

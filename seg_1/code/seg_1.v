module  seg_1(clk,rst_n,/*data_in,*/sel,seg);

	input clk;   //50MHz
	input rst_n;  //  low 

	// input [3:0]  data_in;  //输入的4位数据

	output reg [2:0] sel;
	output reg [7:0] seg;

	parameter data_in = 4'd15;

	always @ (posedge clk or negedge rst_n) 
	begin : proc_1
		if(~rst_n) 
			begin
				 sel <= 3'd5;
			end 
		else 
			begin
				sel <= 3'd0;
			end
	end

	always @(*) 
		begin : proc_2
			if(~rst_n) 
				begin
					 seg <= 8'b1111_1111;
				end 
			else 
				begin
					case(data_in)
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

 
endmodule

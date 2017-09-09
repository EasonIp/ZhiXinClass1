`timescale 1ns/1ps
module tb_top_key_scan;

	reg clk;
	reg rst_n;
	reg [3:0] row;
	
 	wire [2:0] sel;
 	wire [7:0] seg;
	
	reg [4:0] key_num;
	
	top_key_scan inst_top_key_scan (
		.clk(clk), 
		.row(row), 
		.rst_n(rst_n), 
		.seg(seg), 
		.sel(sel)
		);

	initial
		begin
			clk = 1;
			rst_n = 0;
			row = 4'b1111;
			#200
			rst_n = 1;
			
			key_num = 5'd16;
			#2000
			key_num = 5'd1;	//当前按键值为1
			#45_000_000
			key_num = 5'd16;
			#50_000_000
			key_num = 5'd2;	//当前按键值为2
			#45_000_000
			key_num = 5'd16;

			#2000
			$stop;
		end
		
	always #10 clk = ~clk;
	
	always @ (*)
	begin
		case(key_num)
			5'd0	:	row = {1'b1,1'b1,1'b1,col[0]};
			5'd1	:	row = {1'b1,1'b1,1'b1,col[1]};
			5'd2	:	row = {1'b1,1'b1,1'b1,col[2]};
			5'd3	:	row = {1'b1,1'b1,1'b1,col[3]};
			
			5'd4	:	row = {1'b1,1'b1,col[0],1'b1};
			5'd5	:	row = {1'b1,1'b1,col[1],1'b1};
			5'd6	:	row = {1'b1,1'b1,col[2],1'b1};
			5'd7	:	row = {1'b1,1'b1,col[3],1'b1};
			
			5'd8	:	row = {1'b1,col[0],1'b1,1'b1};
			5'd9	:	row = {1'b1,col[1],1'b1,1'b1};
			5'd10	:	row = {1'b1,col[2],1'b1,1'b1};
			5'd11	:	row = {1'b1,col[3],1'b1,1'b1};
			
			5'd12	:	row = {col[0],1'b1,1'b1,1'b1};
			5'd13	:	row = {col[1],1'b1,1'b1,1'b1};
			5'd14	:	row = {col[2],1'b1,1'b1,1'b1};
			5'd15	:	row = {col[3],1'b1,1'b1,1'b1};
			
			5'd16	:	row = 4'b1111;
		endcase
	end

endmodule 

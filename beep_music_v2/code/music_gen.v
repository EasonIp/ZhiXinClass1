// WIDTH=8;
// DEPTH=128;

// ADDRESS_RADIX=UNS;
// DATA_RADIX=HEX;

// CONTENT BEGIN
// 	[0..1]  :   23;
// 	2    :   00;
// 	3    :   24;
// 	4    :   25;
// 	5    :   00;
// 	6    :   25;
// 	7    :   24;



module music_gen (
	input clk_1M,    // Clock
	input [11:0]music_data,
	input rst_n,  // Asynchronous reset active low
	output beep_out
);

	reg [11:0]music_data_r;


	always@(posedge clk_1M or negedge rst_n)
	begin
		if(!rst_n)
			music_data_r	<=	11'd0;			//寄存器复位
		else
			music_data_r	<=	music_data;		//寄存音乐控制字
	end

// parameter [31:0]delay_end = ;
reg [31:0]delay_cnt;


//1Mhz 下产生beep_out的不同计数反转，实现两个不同的频率交替输出
	always @(posedge clk_1M or negedge rst_n) 
	begin : proc_2
		if(~rst_n) begin
			delay_cnt <= 0;
			beep_out <= 0;
		end else begin
			if(delay_cnt < music_data_r) begin
				delay_cnt <= delay_cnt + 1;
			end
			else
				begin
					beep_out <= ~beep_out;
					delay_cnt <= 0;
				end
		end
	end


endmodule
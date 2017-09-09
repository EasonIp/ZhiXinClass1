
module beep_2k (
	input clk,    // Clock
	input rst_n, 
	output reg beep_out
	
);
	reg [31:0]cnt;
	// parameter clk_div0 = 50_000_000 / 2*440 -1;    //错误的写法
	// parameter clk_div1 = 50_000_000 / 4*440 -1;
	parameter clk_div0 = 50_000_000 / 2_000 / 2 -1;    //之前写成的上面的样子，先做的除法，然后乘以了440    
	parameter clk_div1 = 50_000_000 / 3_000 /2 -1;

	wire [31:0]delay_end;  
	reg [31:0]delay_cnt;


//  计数实现两个频率的间隔输出，时间间隔为 （2**25-1）*20ns =0.67s    [25]则是1.342s
	assign delay_end = cnt[24]? clk_div0 : clk_div1;   //0.67108864s  z转换一下key

	always @(posedge clk or negedge rst_n) 
	begin : proc_1
		if(~rst_n) begin
			cnt <= 0;
		end else begin
			cnt <= cnt + 1;
		end
	end


//50Mhz 下产生beep_out的不同计数反转，实现两个不同的频率交替输出
	always @(posedge clk or negedge rst_n) 
	begin : proc_2
		if(~rst_n) begin
			delay_cnt <= 0;
			beep_out <= 1;
		end else begin
			if(delay_cnt < delay_end) begin
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
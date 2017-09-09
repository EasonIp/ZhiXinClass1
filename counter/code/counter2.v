module counter2(clk,rst_n,cnt);
	input clk;
	input rst_n;
	output [7:0] cnt; //】后面空格
	reg [7:0] cnt1;  //定义中间变量
	always @ (posedge clk)   // @后空格
	begin : proc_
		if(~rst_n) begin
			 cnt1 <= 8'b0;//rst_n为0时复位 8'd0
		end
		else
			begin
				if(cnt1 == 8'b11111111)  //8'd255
				begin
					cnt1 <= 8'b0;
				end
				else
					begin
					cnt1 <= cnt + 1;
					end
			end
	end
	assign cnt = cnt1;
endmodule

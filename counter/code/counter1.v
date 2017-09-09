module counter1(clk,rst_n,cnt);
	input clk;
	input rst_n;
	output reg [7:0] cnt; //】后面空格
	always @ (posedge clk)   // @后空格
	begin : proc_
		if(~rst_n) begin
			 cnt <= 8'b0;//rst_n为0时复位 8'd0
		end
		else
			begin
				if(cnt == 8'b11111111)  //8'd255
				begin
					cnt <= 8'b0;
				end
				else
					begin
					cnt <= cnt + 1;
					end
			end
	end
endmodule
module beep (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
	input key_in,
	output beep_out
);


	reg [31:0]cnt;
	reg beep_en;
	parameter cnt_num1 = 50_000_000 / 3_000 / 2 -1;

	always @(posedge clk or negedge rst_n)
	begin : proc_1
		if(~rst_n) begin
			cnt <= 32'd0;
			beep_en <=1;
		end else begin
			if(cnt < cnt_num1) begin
				cnt <= cnt +1;
			end else begin
				cnt <= 32'd0;
				beep_en <= ~beep_en;
			end
		end
	end

assign beep_out =  (key_in)?beep_en : 1'b1;   //  flag信号高电平给出按下

endmodule
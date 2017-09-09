module Beep (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
	input key_in,
	output beep
);


	reg [31:0]cnt;
	reg b0;
	parameter cnt_num1 = 50_000_000 / 3_000 / 2 -1;

	always @(posedge clk or negedge rst_n)
	begin : proc_1
		if(~rst_n) begin
			cnt <= 32'd0;
			b0 <=0;
		end else begin
			if(cnt < cnt_num1) begin
				cnt <= cnt +1;
			end else begin
				cnt <= 32'd0;
				b0 <= ~b0;
			end
		end
	end

assign beep_out =  (!key_in)？b0 : 1'b0;

endmodule
module led8 (
	input clk,    // Clock
	input [2:0]sum, // Clock Enable
	input rst_n,  // Asynchronous reset active low
	output reg [3:0]led_out
);
	
	parameter counter_num = 50_000_000 / 1 /2 -1;
	reg [31:0]counter;
	reg clk_1;
	always @(posedge clk or negedge rst_n) 
	begin : proc_
		if(~rst_n)
			begin
			 counter <= 0;
			end
		else 
			if(counter < counter_num) 
				begin
					counter <= counter + 1;
				end
			begin
				 clk_1 <= ~clk_1 ;
			end
	end

	always @(posedge clk_1 or negedge rst_n) 
	begin : proc_2
		if(~rst_n) 
			begin
				led_out <= 0;
			end 
		else 
			case (sum)
				3'd0	:	led_out <= 4'b1110;
				3'd1	:	led_out <= 4'b1101;
				3'd2	:	led_out <= 4'b1011;
				3'd3	:	led_out <= 4'b0111;
				3'd4	:	led_out <= 4'b1100;
				3'd5	:	led_out <= 4'b1001;
				3'd6	:	led_out <= 4'b0011;
				3'd7	:	led_out <= 4'b0000;
			endcase
	end

endmodule
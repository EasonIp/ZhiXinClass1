module key_led(clk,rst_n,key_in,led);  //;
	input clk;
	input rst_n;
	input key_in;
	
	output reg [3:0]led;    // output reg
	
always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			begin
				led <= 4'b1111;
			end
		else
			begin
				if(!key_in)
					led <= 4'b1001;
				else
				   led <= 4'b1111;
			end
	end
endmodule
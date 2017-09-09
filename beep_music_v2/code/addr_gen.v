module addr_gen (
	input clk_1M,    // Clock
	input time_finish, // Clock Enable
	input rst_n  // Asynchronous reset active low
	output reg [15:0]addr
);
	// reg	[31:0]cnt;


always @(posedge clk_1M or negedge rst_n) 
begin : proc_
	if(~rst_n) begin
		addr <= 0;
	end else begin
		if(time_finish) begin
			addr <= addr + 1;
		end else begin
			addr <=addr;
		end
	end
end

endmodule
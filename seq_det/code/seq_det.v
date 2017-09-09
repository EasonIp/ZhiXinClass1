module seq_det(clk,rst_n,seq_in,seq_out);
	input clk;
	input rst_n;
	input seq_in;
	output reg seq_out;
	reg [2:0] current_state;

	parameter [2:0]
			S0 = 3'd0,
			S1 = 3'd1,
			S2 = 3'd2,
			S3 = 3'd3,
			S4 = 3'd4;

	always @(posedge clk or negedge rst_n) 
	begin : proc_1
		if(~rst_n) 
			begin
				 current_state <= S0;
				 seq_out <= 0;
			end 
		else
			begin
				 // current_state <= S0;
				 // seq_out <= 0;
				case (current_state)
					S0 : begin 
						 current_state <=S1;
						 seq_out <= 0;
						 end
					S1: if(seq_in == 1) begin
						current_state <=  S2;
						seq_out <= 0;
						end
						else begin
							current_state <=  S0;
							seq_out <= 0;
						end
					S2:	if(seq_in ==1) begin
							current_state <= S3;
							seq_out <=0;
						end
						else begin
							current_state <= S0;
							seq_out <= 0;
						end
					S3:	if(seq_in ==0) begin
							current_state <= S4;
							seq_out <=0;
						end
						else begin
							current_state <= S2;
							seq_out <= 0;
						end
					S4:	if(seq_in ==1) begin
							current_state <= S1;
							seq_out <=1;
						end
						else begin
							current_state <= S0;
							seq_out <= 0;
						end
					default : begin
							current_state <=S0;
							seq_out <=0;
							end
				endcase
			end
	end
endmodule // seq_det


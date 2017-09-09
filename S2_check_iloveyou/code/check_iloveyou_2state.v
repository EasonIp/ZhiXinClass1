module check_iloveyou_2state(clk, rst_n, cap_flow, low_flow, out_flow);

	input clk;
	input rst_n;
	input [7:0] cap_flow;
	input [7:0] low_flow;

	output reg [7:0] out_flow;
	
	reg [3:0] current_state;
	reg [3:0] next_state;
	
	parameter	s0 = 4'b0000,
					s1 = 4'b0001,
					s2 = 4'b0010,
					s3 = 4'b0011,
					s4 = 4'b0100,
					s5 = 4'b0101,
					s6 = 4'b0110,
					s7 = 4'b0111,
					s8 = 4'b1000,
					s9 = 4'b1001,
					s10 = 4'b1010;
	
	always @ (posedge clk)
	begin
		current_state <= next_state;
	end
					
	always @ (*)   //* 默认是组合逻辑中的输入信号
	begin
		if(!rst_n)
			begin
				next_state <= s0;
				out_flow <= " ";
			end
		else
			begin
				case(current_state)
					s0	:	begin
								if(cap_flow == "I")
									begin
										next_state <= s1;
										out_flow <= "I";
									end
								else
									next_state <= s0;
							end
							
					s1	:	begin
								out_flow <= " ";
								next_state <= s2;
							end
							
					s2	:	begin
								if(cap_flow == "L")
									begin
										next_state <= s3;
										out_flow <= "L";
									end
								else
									next_state <= s2;
							end
							
					s3	:	begin
								if(low_flow == "o")
									begin
										next_state <= s4;
										out_flow <= "o";
									end
								else
									next_state <= s3;
							end
									
					s4	:	begin
								if(low_flow == "v")
									begin
										next_state <= s5;
										out_flow <= "v";
									end
								else
									next_state <= s4;
							end
							
					s5	:	begin
								if(low_flow == "e")
									begin
										next_state <= s6;
										out_flow <= "e";
									end
								else
									next_state <= s5;
							end
							
					s6	:	begin
								out_flow <= " ";
								next_state <= s7;
							end
							
					s7	:	begin
								if(cap_flow == "Y")
									begin
										next_state <= s8;
										out_flow <= "Y";
									end
								else
									next_state <= s7;
							end
					
					s8	:	begin
								if(low_flow == "o")
									begin
										next_state <= s9;
										out_flow <= "o";
									end
								else
									next_state <= s8;
							end
							
					s9	:	begin
								if(low_flow == "u")
									begin
										next_state <= s10;
										out_flow <= "u";
									end
								else
									next_state <= s9;
							end
							
					s10 :	begin
								out_flow <= "!";
								next_state <= s0;
							end
							
					default	:	next_state <= s0;
				endcase
			end
	end

endmodule 

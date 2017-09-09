module check_iloveyou0 (clk,rst_n,cap_flow,low_flow,out_flow);
	input clk; // Clock
	input rst_n;// Asynchronous reset active low
	input [7:0] cap_flow;
	input [7:0] low_flow;
	output reg [7:0] out_flow;

	reg [3:0] CS;
	parameter [3:0]
			S0 = 4'd0,
			S1 = 4'd1,
			S2 = 4'd2,
			S3 = 4'd3,
			S4 = 4'd4,
			S5 = 4'd5,
			S6 = 4'd6,
			S7 = 4'd7,
			S8 = 4'd8,
			S9 = 4'd9,
			S10 = 4'd10,
			S11 = 4'd11;

always @ (posedge clk or negedge rst_n) 
begin : proc_
	if(~rst_n) 
			begin
			CS <= S0;
			end
	else
		begin :proc_1
			case (CS)
				S0: begin
					CS <= S1;
					out_flow = " ";
					end
				S1: begin
						if(cap_flow == "I")
							begin
								CS = S2;
								out_flow <= "I"; //输出I
							end
						else CS = S1;
				    end
				S2: begin
						out_flow <=  " ";
						CS <= S3;
				    end
				S3: begin
						if(cap_flow == "L")
							begin
								CS = S4;
								out_flow <=  "L"; //输出L
							end
						else CS = S3;
					end
				S4: begin
						if(low_flow == "o")
							begin 
								CS = S5;
								out_flow <=  "o";  //输出o
							end
						else CS = S4;
				    end
				S5: begin
						if(low_flow == "v")
							begin 
								CS = S6;
								out_flow <=  "v"; //输出v
							end
						else CS = S5;
				    end
				S6: begin
						if(low_flow == "e")
							begin 
								CS = S7;
								out_flow <=  "e";  //输出e
							end
						else CS = S6;
				    end
				S7: begin
						out_flow <= " ";
						CS <= S8;
				    end
				S8: begin
						if(cap_flow == "Y")
							begin
								CS = S9;
								out_flow <=  "Y";  //输出Y
							end
						else CS = S8;
				    end
				S9: begin
						if(low_flow == "o")
							begin
								CS = S10;
								out_flow <=  "o";  //输出o
							end
						else CS = S9;
				    end
				S10: begin
						if(low_flow == "u")
							begin
								CS = S11;
								out_flow <=  "u";  //输出u
							end
						else CS = S10;
				    end
				S11:
				    begin
				    out_flow <=  "!";
				    CS <= S0;           //循环检测
				    end
					// ERROR: begin

					//     	end
				default : CS <= S0;
			endcase
		end

end

endmodule
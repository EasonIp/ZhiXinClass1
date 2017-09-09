module check_iloveyou (clk,rst_n,cap_flow,low_flow,out_flow)
	input clk;  // Clock
	input rst_n;// Asynchronous reset active low
	input [7:0] cap_flow;
	input [7:0] low_flow;
	output reg [7:0] out_flow;

	reg [3:0] NS,CS;
	parameter [3:0]
			S0 = 4'd0;
			S1 = 4'd1;
			S2 = 4'd2;
			S3 = 4'd3;
			S4 = 4'd4;
			S5 = 4'd5;
			S6 = 4'd6;
			S7 = 4'd7;
			S8 = 4'd8;
			S9 = 4'd9;
			S10 = 4'd10;
			S11 = 4'd11;
			Error = 4'd12;

always @ (posedge clk or negedge rst_n) 
begin : proc_
	if(~rst_n) begin
		CS <= S0;
	end else begin
		CS <= NS;
	end
end

always @ (CS or cap_flow or low_flow)
begin :proc_1
	NS = 4'bx;
	ERROR_out;
	case (CS)
		S0: begin
			CS <= S1;
			out_flow = " ";
			end
		S1: begin
				if(cap_flow == 73)
					begin
						NS = S1;
						out_flow <= "I"; //输出I
					end
				else NS = S0;
		    end
		S2: begin
				out_flow <=  " ";
				NS <= S3;
		    end
		S3: begin
				if(cap_flow == 76)
					begin
						NS = S4;
						out_flow <=  "L"; //输出L
					end
				else NS = S0;
			end
		S4: begin
				if(low_flow == 111)
					begin 
						NS = S5;
						out_flow <=  "o";  //输出o
					end
				else NS = S0;
		    end
		S5: begin
				if(low_flow == 118)
					begin 
						NS = S6;
						out_flow <=  "v"; //输出v
					end
				else NS = S0;
		    end
		S6: begin
				if(low_flow == 101)
					begin 
						NS = S7;
						out_flow <=  "e";  //输出e
					end
				else NS = S0;
		    end
		S7: begin
				out_flow <= " ";
				NS <= S8;
		    end
		S8: begin
				if(low_flow == 89)
					begin
						NS = S9;
						out_flow <=  "Y";  //输出Y
					end
				else NS = S0;
		    end
		S9: begin
				if(low_flow == 111)
					begin
						NS = S10;
						out_flow <=  " ";  //输出o
					end
				else NS = S0;
		    end
		S10: begin
				if(low_flow == 117)
					begin
						NS = S11;
						out_flow <=  "u";  //输出u
					end
				else NS = S0;
		    end
		S11:
		    begin
		    out_flow <=  "!";
		    NS <= S0;
		ERROR: begin

		    	end
	//default : /* default */;
	endcase
end

endmodule
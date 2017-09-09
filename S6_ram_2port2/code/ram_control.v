module ram_control (wrclk, rdclk,rst_n,data_a,address_a,wren_a,wren_b,address_b);
	input wrclk;
	input rdclk;
	input rst_n;
	output reg [7:0] data_a;
	// output reg [7:0] data_b;
	output reg wren_a;
	output reg wren_b;
	output reg [9:0] address_a;   //大小1024
	output reg [9:0] address_b;


	always @ (posedge wrclk or negedge rst_n) 
	begin : proc_1
		if(~rst_n) 
			begin
				data_a <= 8'd0;
				// wren <= 1;
				address_a <= 10'd0;
				//rdaddress <= 0;
			end 
		else 
			begin
				 if(address_a <= (1024-1) ) 
					 begin
					 	wren_a <= 1'b1;
					 	address_a <= address_a + 8'd1;
					 	data_a <= data_a + 8'd1;
					 end
				else
					begin
						wren_a <= 1'b0;
					 	address_a <= 8'd0;
					 	data_a <= 8'd0;
					end
			end
	end


	always @ (posedge rdclk or negedge rst_n) 
	begin : proc_2
		if(~rst_n) 
			begin
				wren_b <= 0;
				// data_b <= 8'd0;
				address_b <= 10'd0;

			end 
		else 
			begin
				 if(address_b <= (1024-1) ) 
					 begin
					 	//wren <= 0;
					 	wren_b <= 0;
					 	address_b <= address_b + 10'd1;
					 	// data_b <= data_b + 8'd1;

					 end
				else
					begin
						//wren <= 0;
						// wren_b <= 0;
					 	address_b <= 10'd0;
					 	// data_b <=  8'd0;


					end
			end
	end


endmodule
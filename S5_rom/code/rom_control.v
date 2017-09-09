module rom_control (clk, rst_n, rom_control_out);
	input clk;
	input rst_n;
	output [7:0] rom_control_out;

	reg [31:0] d_out;


	// parameter [7:0] ini_phase = ( ( 256 / 4) -1);    //4分之一相位



	// assign rom_control_out = d_out [31:23];

	always @(posedge clk or negedge rst_n) 
	begin : proc_1
		if(~rst_n) begin
			d_out <= 0;
			// rom_control_out <= 0;
			// rom_control_out <= d_out [31:23];
		end 
		else 
		begin
			// if(d_out < 2**32) 
			// if(d_out < (2**32-1) ) //  此处没有减一的话
			if(d_out < (2**32) ) //  此处没有减一的话
				begin
					d_out <= d_out + 8590;    // 8590 ~  100Hz;   86 ~  1Hz
			 	end
			 	else
			 	begin
			 		d_out <= 0;
			 		// rom_control_out <= ini_phase;   //若用此句会让波形在255时截断到 初始相位那里
			 	end
		end
	end

	assign rom_control_out = d_out [31:24];
	// assign rom_control_out = d_out [15:7];    //此处的7不对，会使结果为20KHZ

endmodule

//  //   下面是10K的程序

// module rom_control (clk, rst_n, rom_control_out);
// 	input clk;
// 	input rst_n;
// 	output [7:0] rom_control_out;

// 	reg [15:0] d_out;


// 	// parameter [7:0] ini_phase = ( ( 256 / 4) -1);    //4分之一相位



// 	// assign rom_control_out = d_out [31:23];

// 	always @(posedge clk or negedge rst_n) 
// 	begin : proc_1
// 		if(~rst_n) begin
// 			d_out <= 0;
// 			// rom_control_out <= 0;
// 			// rom_control_out <= d_out [31:23];
// 		end 
// 		else 
// 		begin
// 			// if(d_out < 2**32) 
// 			if(d_out < 2**16) 
// 				begin
// 					d_out <= d_out + 13;
// 			 	end
// 			 	else
// 			 	begin
// 			 		d_out <= 0;
// 			 		// rom_control_out <= ini_phase;   //若用此句会让波形在255时截断到 初始相位那里
// 			 	end
// 		end
// 	end

// 	assign rom_control_out = d_out [15:8];
// 	// assign rom_control_out = d_out [15:7];    //此处的7不对，会使结果为20KHZ

// endmodule






//可以倍频输出，可以任意相位调整
// module rom_control (clk, rst_n, rom_control_out);
// 	input clk;
// 	input rst_n;
// 	output reg [7:0] rom_control_out;

// 	reg [31:0] d_out;


// 	parameter [7:0] ini_phase = ( ( 256 / 4) -1);    //4分之一相位



// 	always @(posedge clk or negedge rst_n) 
// 	begin : proc_1
// 		if(~rst_n) begin
// 			rom_control_out <= ini_phase;
// 		end 
// 		else 
// 		begin
// 			if(rom_control_out < 8'd255 ) 
// 				begin
// 					rom_control_out <= rom_control_out + 2;
// 			 	end
// 			 	else
// 			 	begin
// 			 		rom_control_out <= 8'd0;
// 			 		// rom_control_out <= ini_phase;   //若用此句会让波形在255时截断到 初始相位那里
// 			 	end
// 		end
// 	end

// endmodule
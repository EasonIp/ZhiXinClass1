module mux3_8 (A_3,Y_8);


	input [2:0] A_3;
	output reg [7:0] Y_8;


	parameter  S0 = 3'b000;
	parameter  S1 = 3'b001;
	parameter  S2 = 3'b010;
	parameter  S3 = 3'b011;
	parameter  S4 = 3'b100;
	parameter  S5 = 3'b101;
	parameter  S6 = 3'b110;
	parameter  S7 = 3'b111;

	// reg [2:0] cs;

	always @ (*)    //用新号（*）？  组合逻辑中简写  （*代表所有的输入信号的变动）
		begin 
			// Y_8 <= 8'b1111_1111;
			// cs <= A_3;
			case (A_3)
				S0 : Y_8 <= 8'b0111_1111;
				S1 : Y_8 <= 8'b1011_1111;
				S2 : Y_8 <= 8'b1101_1111;
				S3 : Y_8 <= 8'b1110_1111;
				S4 : Y_8 <= 8'b1111_0111;
				S5 : Y_8 <= 8'b1111_1011;
				S6 : Y_8 <= 8'b1111_1101;
				S7 : Y_8 <= 8'b1111_1110;


				// S0 : Y_8[7] <= 0;
				// S1 : Y_8[6] <= 0;
				// S2 : Y_8[5] <= 0;
				// S3 : Y_8[4] <= 0;
				// S4 : Y_8[3] <= 0;
				// S5 : Y_8[2] <= 0;
				// S6 : Y_8[1] <= 0;
				// S7 : Y_8[0] <= 0;
				default : Y_8 <= 8'b1111_1111;
			endcase // A_3
		end

endmodule


// module mux3_8 (A_3,Y_8);


// 	input [2:0] A_3;
// 	output reg [7:0] Y_8;

// 	always     //用新号（*）？
// 		begin 
// 			Y_8 <= 8'b1111_1111;
// 			case (A_3)
// 				000 : Y_8[7] <= 0;
// 				001 : Y_8[6] <= 0;
// 				010 : Y_8[5] <= 0;
// 				011 : Y_8[4] <= 0;
// 				100 : Y_8[3] <= 0;
// 				101 : Y_8[2] <= 0;
// 				110 : Y_8[1] <= 0;
// 				111 : Y_8[0] <= 0;
// 				default : Y_8 <= 8'b1111_1111;
// 			endcase // A_3
// 		end

// endmodule
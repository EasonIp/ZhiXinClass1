module decode (
	input clk_1M,    // Clock
	input [7:0]rom_data, //八位  11-17低音  21-27中音  31-37高音
	input rst_n,  // Asynchronous reset active low
	output [11:0]music_data
);

always @(posedge clk_1M or negedge rst_n) 
begin : proc_1
	if(~rst_n) begin
		 music_data <= 12'b1111_1111_1111;
	end else begin
		 case(rom_data)       //将简谱音符与分频预置数相匹配   
				8'd00 	:	music_data <= 12'b1111_1111_1111;    
				8'd11 	:	music_data <= 12'd137;    
				8'd12 	:	music_data <= 12'd345;    
				8'd13 	:	music_data <= 12'd531;    
				8'd14 	:	music_data <= 12'd616;    
				8'd15 	:	music_data <= 12'd773;    
				8'd16 	:	music_data <= 12'd912;    
				8'd17 	:	music_data <= 12'd1036;  // low  
				8'd21	:   music_data <= 12'd1092;    
				8'd22	:   music_data <= 12'd1197;    
				8'd23	:   music_data <= 12'd1290;    
				8'd24	:   music_data <= 12'd1332;    
				8'd25	:   music_data <= 12'd1410;    
				8'd26	:   music_data <= 12'd1480;    
				8'd27	:   music_data <= 12'd1542;   //medi 
				8'd31	:   music_data <= 12'd1570;    
				8'd32	:   music_data <= 12'd1622;    
				8'd33	:   music_data <= 12'd1668;    
				8'd34	:   music_data <= 12'd1690; 
				8'd35	:   music_data <= 12'd1728;
				8'd36	:   music_data <= 12'd1764;
				8'd37	:   music_data <= 12'd1795;  //high
				default:;
			endcase
	end
end

endmodule
module edge_check (
	input clk,    // Clock
	input signal, 
	input rst_n,  // Asynchronous reset active low
	output pos_edge,
	output neg_edge
	
);
	
	reg sig_r0, sig_r1;  // 状态寄存器
	always @ (posedge clk or negedge rst_n)
		    if (!rst_n) begin 
		        sig_r0 <= 1'b0;
		        sig_r1 <= 1'b0;
		    end 
	    else 
		    begin 
		        sig_r0 <= signal;
		        sig_r1 <= sig_r0;
		    end 

	assign pos_edge = (~sig_r1) & (sig_r0);
	assign neg_edge = sig_r1 & (~sig_r0);  


endmodule
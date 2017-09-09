module assign_test_a (
                       clk,
                       lhold,
                       lholda
);
	input clk;
	input lhold;
	output lholda;
	reg lholda;
	always @(posedge clk)
	if (lhold)
	 lholda<=lhold;
	else
	 lholda<=0;
endmodule
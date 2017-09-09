
`timescale 1ns/1ps

module tb_seq_det; /* this is automatically generated */

    reg rst_n;
    reg seq_in;
    reg clk;

    wire seq_out;
	seq_det inst_seq_det (
			.clk     (clk),
			.rst_n   (rst_n),
			.seq_in  (seq_in),
			.seq_out (seq_out)
		);
    // clock
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
	

    
    initial begin
    // reset
        // clk = 1;
        rst_n = 0;
        #20
        rst_n = 1;  //=?
        // #3000 ns
        // $stop;
    end

    initial
    begin
    	        // do something
        forever 
        	begin
        		#20 seq_in <= {$random} % 2;
        	end

    end
endmodule

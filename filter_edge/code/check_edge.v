module check_edge (
    input clk,    // Clock
    input rst_n,  // Asynchronous reset active low
    input D_signal,
    output  pos_edge, //上升沿检测
    output  neg_edge //下降沿检测
);

    parameter  N=2;
    reg [N-1:0]D_signal0;
    reg [N-1:0]D_signal1;
    // reg [N-1:0]D_signal1;

    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            begin
                D_signal0[0] <= 0;
                D_signal1[0] <= 0;
            end
        else 
            begin 
                D_signal0[0] <= D_signal;
                D_signal1[0] <= D_signal0[0];
            end
    end



    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            begin
                D_signal0[1] <= 0;
                D_signal1[1] <= 0;
            end
        else 
            begin 
                D_signal0[1] <= D_signal1[0];
                D_signal1[1] <= D_signal0[1];
            end
    end


assign pos_edge = ~D_signal0[1] & D_signal1[0]; //关键
assign neg_edge= D_signal0[1] & ~D_signal1[0]; //关键


endmodule

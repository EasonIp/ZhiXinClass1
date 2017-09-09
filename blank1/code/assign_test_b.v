module assign_test_b (
                       clk,
                       lhold,
                       lholda
);
input clk;
input lhold;
output lholda;
reg lholda_r;
  always @(posedge clk)
  if (lhold)
     lholda_r<=lhold;
  else
     lholda_r<=0;
 assign  lholda=lholda_r;
endmodule
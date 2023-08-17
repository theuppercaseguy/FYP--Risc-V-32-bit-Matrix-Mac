
//`include "Five_Stage_Pipline_Top.v"

module Pipelined_Top_Testbench();
   
   reg clk=0, rst;
    
    Pipeline_top dut(
        .clk(clk),
        .rst(rst)
    );
        
       
       always begin
           clk = ~clk;
           #5;
       end
   
       initial begin
           rst <= 1'b0;
           #20;
           rst <= 1'b1;
           #180;
           $finish;    
       end



endmodule
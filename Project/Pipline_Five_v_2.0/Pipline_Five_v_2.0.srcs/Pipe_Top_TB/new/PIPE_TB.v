
//`include "Five_Stage_Pipline_Top.v"

module Pipelined_Top_Testbench();
   
   reg clk=0, rst;
    
    Pipeline_top dut(
        .clk(clk),
        .rst(rst)
    );
        
       
       always begin
           clk = ~clk;
           #50;
       end
   
       initial begin
           rst <= 1'b0;
           #200;
           rst <= 1'b1;
           #1000;
//           $finish;    
       end



endmodule
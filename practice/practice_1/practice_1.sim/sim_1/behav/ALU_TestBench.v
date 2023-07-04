`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2023 03:44:54 PM
// Design Name: 
// Module Name: ALU_TestBench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_TestBench();

reg t_a,t_b;
wire sum,carry;
//design under test dut
ALU dut(.a(t_a),.b(t_b),.sum(sum),.carry(carry))

initial begin

t_a = 0; t_b=0;
#10
t_a = 0; t_b=1;
#10
t_a = 1; t_b=0;
#10
t_a = 1; t_b=1;
#10 

$stop;
end


endmodule

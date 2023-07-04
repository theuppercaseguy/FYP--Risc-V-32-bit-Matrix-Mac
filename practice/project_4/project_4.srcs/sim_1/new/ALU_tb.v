`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2023 11:06:53 AM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
reg A,B,ALUControl;
wire Result;

ALU uut(A,B,ALUControl,Result);
initial
begin

A=1'b0; B=1'b0; ALUControl=1'b0; 
#10
A=1'b0; B=1'b1;
#10
A=1'b1; B=1'b0;
#10
A=1'b1; B=1'b1;

end
    
    
    
endmodule

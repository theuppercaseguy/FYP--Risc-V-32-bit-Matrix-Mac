`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 04:08:07 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
    input [31:0] A, //input address of the instruction in the instruction memory
    input rst, //reset
    
    output [31:0] RD//instruction to output from instruction memory// accessing memory
    );

    reg [31:0] Memory [1023:0];  //register memory containing, 1024 seperate registers of 32 bits each
    
    
    
    //             if reset low, access memry start, else access address from memomory 
    assign RD =  ( rst == 1'b0 )? 32'h00000000 : Memory[A[31:2]] ;

    

    initial begin
        Memory[0] = 32'hFFC4A303;    
    end








endmodule






















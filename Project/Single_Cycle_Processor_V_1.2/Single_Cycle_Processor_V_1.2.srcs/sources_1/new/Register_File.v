`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 04:56:08 PM
// Design Name: 
// Module Name: Register_File
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


module Register_File(
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD3,
    input clk,rst,WE3,
    
    output [31:0] RD1,
    output [31:0] RD2
    );
    
    //register file memory
    reg [31:0] Registers [31:0];//32 registers of 32 bits each
    
    //read functionality from the register file
    assign RD1 =  ( !rst ) ? 32'h00000000 : Registers[A1] ;
    assign RD2 =  ( !rst ) ? 32'h00000000 : Registers[A2] ;

    //write functionality
    always @(posedge clk)
    begin
        if(WE3)
        begin
            Registers[A3] <= WD3;
        
        end    
    end

    initial begin
        //test-1
        Registers[9] = 32'h0000020;
    end






endmodule














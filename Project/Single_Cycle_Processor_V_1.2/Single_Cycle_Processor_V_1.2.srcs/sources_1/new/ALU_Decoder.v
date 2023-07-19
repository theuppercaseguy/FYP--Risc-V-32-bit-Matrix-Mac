`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 10:41:25 AM
// Design Name: 
// Module Name: ALU_Decoder
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



module ALU_Decoder(ALUOp,funct3,funct7,op,ALUControl);

    input [1:0]ALUOp;
    input [2:0]funct3;
    input [6:0]funct7,op;
    output [2:0]ALUControl;

    // Method 2
    assign ALUControl = (ALUOp == 2'b00) ? 3'b000 ://lw, sw
                        (ALUOp == 2'b01) ? 3'b001 :// beq, branch if equal
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({op[5],funct7[5]} == 2'b11)) ? 3'b001 ://arithmetic subtraction 
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({op[5],funct7[5]} == 2'b00)) ? 3'b000 : //arithmetic addition
                        ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 3'b101 ://slt 
                        ((ALUOp == 2'b10) & (funct3 == 3'b110)) ? 3'b011 : //or
                        ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 3'b010 : //and
                                                                  3'b000 ;//lw,sw

endmodule





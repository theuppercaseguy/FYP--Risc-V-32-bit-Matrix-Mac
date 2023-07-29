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
    
    output [5:0]ALUControl;
     // I-Type Basic Instructions => SLLI, SRLI, SRAI, ADDI, LI ETC => OP => 0010011
        // parameter I_ADDI_op = 7'b0010011;   //ADDI  => OP => 0010011 => I-TYPE
        parameter I_op_basic = 7'b0010011;   //ADDI  => OP => 0010011 => I-TYPE
          
                                                   
        // R-type Instructions: => ADD, SUB, AND, OR, XOR, SLL, SRL, SLT => SAME OPCODE => 0110011
        parameter R_op_basic = 7'b0110011;  
                                        
       
       //B-TYPE INSTRUCTIONS
        parameter B_op_basic = 7'b1100011;  //BEQ = BNE = BLT = BGE => OP => 1100011 SAME OP CODE
                
        //Ecall, Ebreak, END
        parameter ECALL = 7'b1110011;
    

    // Method 2
    assign ALUControl = ((ALUOp == 2'b00) & (funct3 == 3'b010) ) ? 5'b00000 :    //lw, sw
                        ((ALUOp == 2'b00) & ( op == I_op_basic ) & (funct3 == 3'b001) ) ? 5'b00111 :    //SLLI
                        ((ALUOp == 2'b00) & ( op == I_op_basic ) & (funct3 == 3'b101) ) ? 5'b00110 :    //SRLI
                        ((ALUOp == 2'b01) & ( op == B_op_basic ) & (funct3 == 3'b000) ) ? 5'b01001 :   // beq, branch if equal
                        ((ALUOp == 2'b01) & ( op == B_op_basic ) & (funct3 == 3'b001) ) ? 5'b01010 :   // bne, branch if equal
                        ((ALUOp == 2'b01) & ( op == B_op_basic ) & (funct3 == 3'b100) ) ? 5'b01011 :   // blt, branch if equal
                        ((ALUOp == 2'b01) & ( op == B_op_basic ) & (funct3 == 3'b101) ) ? 5'b01000 :   // bge, branch if equal
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ( op == R_op_basic & funct7 == 7'b0100000 )) ? 5'b00001 : //arithmetic subtraction 
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ( op == R_op_basic & funct7 == 7'b0000000 )) ? 5'b00000 : //arithmetic addition
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ( op == R_op_basic & funct7 == 7'b0000001 )) ? 5'b00010 : //arithmetic signed Multiplication
                        ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 5'b01100 : //slt 
                        ((ALUOp == 2'b10) & (funct3 == 3'b100)) ? 5'b00101 : //xor
                        ((ALUOp == 2'b10) & (funct3 == 3'b110)) ? 5'b00100 : //or
                        ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 5'b00011 : //and
                        (op == ECALL )    ? 5'b11111 : //ECALL, EBREAK, END
                                             5'b00000 ; //lw,sw
    


endmodule





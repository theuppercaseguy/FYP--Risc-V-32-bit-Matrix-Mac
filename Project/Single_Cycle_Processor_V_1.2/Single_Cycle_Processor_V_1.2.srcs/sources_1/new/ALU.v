`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 10:39:11 AM
// Design Name: 
// Module Name: ALU
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
/* ALU 1
module ALU(A,B,ALU_Out,ALU_Sel,Overflow,CarryOut,Zero,Negative);

    input [31:0]A,B;
    input [2:0]ALU_Sel;
    output CarryOut,Overflow,Zero,Negative;
    output [31:0]ALU_Out;

    wire Cout;
    wire [31:0]Sum;

    assign Sum = (ALU_Sel[0] == 1'b0) ? A + B :
                                          (A + ((~B)+1)) ;
    assign {CarryOut,ALU_Out} = (ALU_Sel == 3'b000) ? Sum :
                           (ALU_Sel == 3'b001) ? Sum :
                           (ALU_Sel == 3'b010) ? A & B :
                           (ALU_Sel == 3'b011) ? A | B :
                           (ALU_Sel == 3'b101) ? {{32{1'b0}},(Sum[31])} :
                           {33{1'b0}};
    assign Overflow = ((Sum[31] ^ A[31]) & 
                      (~(ALU_Sel[0] ^ B[31] ^ A[31])) &
                      (~ALU_Sel[1]));
    assign CarryOut = ((~ALU_Sel[1]) & Cout);
    assign Zero = &(~ALU_Out);
    assign Negative = ALU_Out[31];

endmodule
*/


//ALU 2
module ALU(
    input [31:0] A, B,       // ALU 32-bit Inputs                 
    input [5:0] ALU_Sel,     // ALU Selection
    output [31:0] ALU_Out,   // ALU 32-bit Output
    output CarryOut,         // Carry Out Flag
    output Zero,             // Zero Flag
    output Negative,         // Negative Flag
    output Overflow          // Overflow Flag
);
    reg [31:0] ALU_Result;
    wire [32:0] tmp;
    
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0, A} + {1'b0, B};
    assign CarryOut = tmp[32];   // Carryout flag
    
   
    
    always @(*)
    begin
        case (ALU_Sel)
            5'b00000: // Addition
                ALU_Result = A + B; 
            5'b00001: // Subtraction
                ALU_Result = A - B;
            5'b00010: // Multiplication
                ALU_Result = A * B;
            5'b00011: // Division
                ALU_Result = A / B;
            5'b00100: // Logical shift left
                ALU_Result = A << 1;
            5'b00101: // Logical shift right
                ALU_Result = A >> 1;
            5'b00110: // Rotate left
                ALU_Result = {A[30:0], A[31]};
            5'b00111: // Rotate right
                ALU_Result = {A[0], A[31:1]};
            5'b01000: // Logical and 
                ALU_Result = A & B;
            5'b01001: // Logical or
                ALU_Result = A | B;
            5'b01010: // Logical xor 
                ALU_Result = A ^ B;
            5'b01011: // Logical nor
                ALU_Result = ~(A | B);
            5'b01100: // Logical nand 
                ALU_Result = ~(A & B);
            5'b01101: // Logical xnor
                ALU_Result = ~(A ^ B);
            5'b01110: // Greater comparison
                ALU_Result = (A > B) ? 32'd1 : 32'd0;
            5'b01111: // Equal comparison   
                ALU_Result = (A == B) ? 32'd1 : 32'd0;
            5'b10000:
                ALU_Result = {32'b0, ALU_Result};
            default: ALU_Result = {33{1'b0}};
        endcase
    end
      // Flag assignments
      assign Zero = (ALU_Result == 32'd0);
      assign Negative = ALU_Result[31];
      assign Overflow = ((A[31] ^ B[31]) & (A[31] ^ ALU_Result[31]));
      
    
    
    
endmodule


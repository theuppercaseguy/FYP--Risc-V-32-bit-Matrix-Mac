`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 05:57:32 PM
// Design Name: 
// Module Name: Execute_Cycle
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
`include "ALU.v"
`include "MUX_2_by_1.v"
`include "PC_Adder.v"


module Execute_Cycle(
    input clk,rst,
    input  RegWriteE, ALUSrcE, MemWriteE, ResultSrcE, BranchE,
    input  [2:0]  ALUControlE,
    input  [31:0] RD1_E, RD2_E, Imm_Ext_E,
    input  [4:0]  RS1_E, RS2_E, RD_E,
    input  [31:0] PCE, PCPlus4E,
    
    output PCSrcE, MemWriteM, RegWriteM, ResultSrcM,
    output [4:0]  RD_M,
    output [31:0] PCTargetE, ALU_ResultM, PCPlus4M, WriteDataM

);
   //Interm wires
   wire [31:0] Src_B, ResultE;
   wire ZeroE;
   
   //Output registers
    reg RegWriteE_r, MemWriteE_r, ResultSrcE_r;
    reg [4:0] RD_E_r;
    reg [31:0] PCPlus4E_r, RD2_E_r, ResultE_r;
    
   
   //Modules instentiation
    MUX_2_by_1 ALU_Src_Mux(
          .a(RD1_E),
          .b(Imm_Ext_E),
          .s(ALUSrcE),
          .c(Src_B)
    );
      
    ALU ALU(
         .A(RD1_E), 
         .B(Src_B),                     // ALU 32-bit Inputs                 
         .ALU_Sel(ALUControlE),         // ALU Selection
         .ALU_Out(ResultE),             // ALU 32-bit Output
         .CarryOut(),                   // Carry Out Flag
         .Zero(ZeroE),               // Zero Flag
         .Negative(),           // Negative Flag
         .Overflow()            // Overflow Flag
      );
      
       PC_Adder Branch_Adder(
             .curr_address(PCE),
             .branch(1'b1),
             .ALU_Out(32'd1),
             .offset(Imm_Ext_E),
             .next_address(PCTargetE)
             
         );
      
   
       assign PCSrcE = ZeroE & BranchE;
      
      
     //registers logic
     always @(posedge clk or negedge rst)
     begin
        if(rst == 1'b0)begin
            RegWriteE_r         <= 1'b0;
            MemWriteE_r         <= 1'b0;
            ResultSrcE_r        <= 1'b0;
            RD_E_r              <= 1'b0;
            PCPlus4E_r          <= 1'b0;
            RD2_E_r             <= 1'b0;
            ResultE_r           <= 1'b0;
        end
            else begin
            RegWriteE_r         <= RegWriteE;
            MemWriteE_r         <= MemWriteE;
            ResultSrcE_r        <= ResultSrcE;
            RD_E_r              <= RD_E;
            PCPlus4E_r          <= PCPlus4E;
            RD2_E_r             <= RD2_E;
            ResultE_r           <= ResultE;
        end
     end
    
    
    //output assignments
    assign PCSrcE           = ZeroE & BranchE;
    assign RegWriteM        = RegWriteE;
    assign MemWriteM        = MemWriteE;
    assign ResultSrcM       = ResultSrcE;
    assign RD_M             = RD_E;
    assign PCPlus4M         = PCPlus4E;
    assign WriteDataM       = RD2_E;
    assign ALU_ResultM      = ResultE_r;
        
endmodule












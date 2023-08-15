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
`include "MUX_3_by_1.v"
`include "PC_Adder.v"
//`include "Adder.v"


module Execute_Cycle(
    input clk, rst, CLR,
    input  RegWriteE, ResultSrcE, MemWriteE, [5:0] ALUControlE,
    input   ALUSrcE, RegDstE,
    input  [31:0] RD1_E, RD2_E, Imm_Ext_E,
    input  [31:0] PCE, PCPlus4E, ResultW,
    input  [1:0] ForwardA_E, ForwardB_E,
    input  [4:0]  RS1_E, RS2_E, RD_E,
    
    output RegWriteM, ResultSrcM ,MemWriteM, 
    output [4:0]  RD_M,
    output [31:0] ALU_ResultM, WriteDataM

);
   //Interm wires
   wire [31:0] Src_A, Src_B_interim, Src_B, ResultE;
   wire ZeroE;
   wire [4:0] RD_E_interm;
   
   //Output registers
    reg RegWriteE_r, MemWriteE_r, ResultSrcE_r;
    reg [4:0] RD_E_r;
    reg [31:0] RD2_E_r, ResultE_r;
         
   //Modules instentiation
   
   //3 by 1 mux for source A of hazard uni
   Mux_3_by_1 SrcA_Mux(
        .a(RD1_E),
        .b(ResultW),
        .c(ALU_ResultM),
        .s(ForwardA_E),
        .y(Src_A)
   );
   
   //3 by 1 mux for source B of hazard uni
   Mux_3_by_1 SrcB_Mux(
        .a(RD2_E),
        .b(ResultW),
        .c(ALU_ResultM),
        .s(ForwardB_E),
        .y(Src_B_interim)
   );   
   
   
    // ALU Src
    MUX_2_by_1 ALU_Src_Mux(
          .a(Src_B_interim),
          .b(Imm_Ext_E),
          .s(ALUSrcE),
          .c(Src_B)
    );
      
    ALU ALU(
         .A(Src_A), 
         .B(Src_B),                     // ALU 32-bit Inputs                 
         .ALU_Sel(ALUControlE),         // ALU Selection
         .ALU_Out(ResultE),             // ALU 32-bit Output
         .CarryOut(),                   // Carry Out Flag
         .Zero(ZeroE),               // Zero Flag
         .Negative(),           // Negative Flag
         .Overflow()            // Overflow Flag
    ); 
     
      
     MUX_2_by_1 Execute_Rs2_Rde(
             .a(RS2_E),
             .b(RD_E),
             .s(RegDstE),
             .c(RD_E_interm)
     );       
     
     //registers logic
     always @(posedge clk or negedge rst)
     begin
        if(rst == 1'b0)begin
            RegWriteE_r         <= 1'b0;
            ResultSrcE_r        <= 1'b0;
            MemWriteE_r         <= 1'b0;
            ResultE_r           <= 32'h00000000;
            RD2_E_r             <= 32'h00000000;            
            RD_E_r              <= 4'b0000;
        end 
        else if(CLR) begin
            RegWriteE_r         <= 1'b0;
            ResultSrcE_r        <= 1'b0;
            MemWriteE_r         <= 1'b0;
            ResultE_r           <= 32'h00000000;
            RD2_E_r             <= 32'h00000000;            
            RD_E_r              <= 4'b0000;
        end        
        else begin
            RegWriteE_r         <= RegWriteE;
            ResultSrcE_r        <= ResultSrcE;
            MemWriteE_r         <= MemWriteE;
            ResultE_r           <= ResultE;
            RD2_E_r             <= Src_B_interim;            
            RD_E_r              <= RD_E_interm;
         end
     end
    
    
    //output assignments
//  assign PCSrcE           = ( rst == 1'b0) ? 1'b0 : ZeroE & BranchE;
    assign RegWriteM        = RegWriteE_r;
    assign ResultSrcM       = ResultSrcE_r;
    assign MemWriteM        = MemWriteE_r; 
    assign ALU_ResultM      = ResultE_r;
    assign WriteDataM       = RD2_E_r;
    assign RD_M             = RD_E_r; //writeregM
    
//    assign PCPlus4M         = PCPlus4E_r;
        
endmodule












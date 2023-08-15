`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2023 06:16:16 PM
// Design Name: 
// Module Name: Decode_Cycle
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
`include "Control_Unit_Top.v"
`include "Register_File.v"
`include "Sign_Extend.v"
`include "Adder.v"
`include "MUX_2_by_1.v"

module Decode_Cycle(
    input clk, rst, EN, /* CLR,*/
    input RegWriteW, ForwardAD, ForwardBD,
    input [4:0] RDW,
    input [31:0] InstrD, PCPlus4D, 
    input [31:0] ALUResultM, ResultW,
    
    //Control signals output
    output RegWriteE, ResultSrcE/*MemToReg*/, 
    output ALUSrcE, MemWriteE, RegDstE, BranchD,    
    output [5:0] ALUControlE,
    output PCSrcD,
    //
    output [31:0] RD1_E, RD2_E, Imm_Ext_E,
    output [4:0] RS1_E, RS2_E, RD_E,
    output [31:0] PCE, PCPlus4E,
    output [31:0] PCBranchD
    
    );
    
    wire RegWriteD, ALUSrcD, MemWriteD, ResultSrcD, BranchD;
    wire [1:0]  ImmSrcD;
    wire [5:0]  ALUControlD;
    wire [31:0] RD1_D, RD2_D, Imm_Ext_D, RD1_Mux_Out, RD2_Mux_Out;
    wire RegDstD;
    
    //Declaring output registers of Decode_Cycle
    reg RegWriteD_r, ALUSrcD_r, MemWriteD_r, ResultSrcD_r/*, BranchD_r*/;
    reg [2:0] ALUControlD_r;
    reg [31:0] RD1_D_r, RD2_D_r, Imm_Ext_D_r;
    reg [4:0] RD_D_r, RS1_D_r, RS2_D_r;
    reg [31:0] PCPlus4D_r, RegDstD_r;
    reg RegDstE_D;
    
    
    //initiating modules control unit top
    Control_Unit_Top Control_Unit_Fetch_Cycle(
                .Op(InstrD[6:0]),
                .funct3(InstrD[14:12]),
                .funct7(InstrD[31:25]),
                
                .RegWrite(RegWriteD),
                .ImmSrc(ImmSrcD),
                .ALUSrc(ALUSrcD),
                .MemWrite(MemWriteD),
                .ResultSrc(ResultSrcD),
                .Branch(BranchD),
                .ALUControl(ALUControlD),
                .RegDst(RegDstD)
       );
    
      Register_File Register_File(
               .clk(clk),
               .rst(rst),
               .A1(InstrD[19:15]),
               .A2(InstrD[24:20]),
               .A3(RDW),
               .WD3(ResultW),
               .WE3(RegWriteW),
//                .WE3(RegWriteD),
                               
               .RD1(RD1_D),
               .RD2(RD2_D)
       );
       
       
       Sign_Extend Sign_Extend(
            .In(InstrD[31:0]),
            .ImmSrc(ImmSrcD),
            .Imm_Ext(Imm_Ext_D)
       );
       
       Adder Deocde_Adder(
            .A(Imm_Ext_D),
            .B(PCPlus4D),
            
            .Sum(PCBranchD),
            .Carry_Out()
       );
       
       MUX_2_by_1 RD1_and_ALUResultM(
            .a(RD1_D),
            .b(ALUResultM),
            .s(ForwardAD),
            .c(RD1_Mux_Out)   
       );

        MUX_2_by_1 RD2_and_ALUResultM(
              .a(RD2_D),
              .b(ALUResultM),
              .s(ForwardBD),
              .c(RD2_Mux_Out)       
       );
       
       assign PCSrcD = ( BranchD & ( ( RD1_Mux_Out == RD2_Mux_Out ) ? 1'b1 : 1'b0)) ;
       
         // Declaring Register Logic
        always @(posedge clk or negedge rst) begin
            if(rst == 1'b0) begin
                RegWriteD_r         <= 1'b0;
                ResultSrcD_r        <= 1'b0;
                ALUSrcD_r           <= 1'b0;
                MemWriteD_r         <= 1'b0;
                RegDstD_r           <= 1'b0;
                ALUControlD_r       <= 6'b000000;
                //PCSrcD
                RD1_D_r             <= 32'h00000000;
                RD2_D_r             <= 32'h00000000;
                Imm_Ext_D_r         <= 32'h00000000;
                RS1_D_r             <= 5'h00000;
                RS2_D_r             <= 5'h00000;
                RD_D_r              <= 5'h00000;
                PCPlus4D_r          <= 32'h00000000;
            end
            else begin
                if (EN )begin
                    if (/*CLR*/ PCSrcD == 1'b1) begin //flushing registers when branch is taken
                        RegWriteD_r         <= 1'b0;
                        ResultSrcD_r        <= 1'b0;
                        ALUSrcD_r           <= 1'b0;
                        MemWriteD_r         <= 1'b0;
                        RegDstD_r           <= 1'b0;
                        ALUControlD_r       <= 6'b000000;
                        //PCSrcD
                        RD1_D_r             <= 32'h00000000;
                        RD2_D_r             <= 32'h00000000;
                        Imm_Ext_D_r         <= 32'h00000000;
                        RS1_D_r             <= 5'h00000;
                        RS2_D_r             <= 5'h00000;
                        RD_D_r              <= 5'h00000;
//                        PCPlus4D_r          <= 32'h00000000;
                    end 
                    else begin //EN is asserted in top hazard module but here its negated, so lo and it means raw data hazard has occured
                        RegWriteD_r         <= RegWriteD;
                        ResultSrcD_r        <= ResultSrcD;
                        ALUSrcD_r           <= ALUSrcD;
                        MemWriteD_r         <= MemWriteD;
                        RegDstD_r           <= RegDstD; //yet to be calculated
                        ALUControlD_r       <= ALUControlD;
                        //PCSrcD
                        RD1_D_r             <= RD1_D; 
                        RD2_D_r             <= RD2_D; 
                        Imm_Ext_D_r         <= Imm_Ext_D;
                        RS1_D_r             <= InstrD[19:15];
                        RS2_D_r             <= InstrD[24:20];
                        RD_D_r              <= InstrD[11:7];
//                        PCPlus4D_r          <= PCPlus4D;
                    end
                end
            end
      end
        
        
                // Output asssign statements
        assign RegWriteE        = RegWriteD_r;
        assign ResultSrcE       = ResultSrcD_r;
        assign ALUSrcE          = ALUSrcD_r;
        assign MemWriteE        = MemWriteD_r;
        assign RegDstE          = RegDstD_r;
        assign ALUControlE      = ALUControlD_r;
//      assign PCSrcD           = ( BranchD & ( ( RD1_Mux_Out == RD2_Mux_Out ) ? 1'b1 : 1'b0)) ;
        assign RD1_E            = RD1_D_r;
        assign RD2_E            = RD2_D_r;
        assign Imm_Ext_E        = Imm_Ext_D_r;
        assign RS1_E            = RS1_D_r;
        assign RS2_E            = RS2_D_r;
        assign RD_E             = RD_D_r;
//        assign PCPlus4E         = PCPlus4D_r;


            
//        assign PCBranchD        = ; already filled by adder

endmodule









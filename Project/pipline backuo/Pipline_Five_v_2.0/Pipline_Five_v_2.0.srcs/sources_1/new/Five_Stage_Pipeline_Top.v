`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 05:09:23 PM
// Design Name: 
// Module Name: Five_Stage_Pipline_Top
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



`include "Fetch_Cycle.v"
`include "Decode_Cycle.v"
`include "Execute_Cycle.v"
`include "Memory_Cycle.v"
`include "WriteBack_Cycle.v"
`include "Hazard_Unit.v"




module Five_Stage_Pipline(
    input clk, rst
    );
    
    
        wire PCSrcD, RegWriteW, RegWriteE, ALUSrcE, MemWriteE, ResultSrcE, BranchD, RegWriteM, MemWriteM, ResultSrcM, ResultSrcW  ;
        wire [4:0]  RDW, RD_M,  RD_E;
        wire [5:0]  ALUControlE;
        wire [31:0] PCTargetE, InstrD, PCD, PCPlus4D, ResultW, RD1_E, RD2_E,Imm_Ext_E, PCE, PCPlus4E, PCPlus4M, WriteDataM, ALU_ResultM      ;
        wire [31:0] PCPlus4W, ALUResultW, ReadDataW ;
        wire [4:0]  RS1_E, RS2_E; 
        wire [1:0]  ForwardBE, ForwardAE;
        
        //new updates for controll hazards
        wire [31:0] PCBranchD;
        wire StallF, StallD, ForwardAD, ForwardBD, ALUResultD;
        wire RegDstE, FlushE;
        //Module Instentiation
        
        

        Fetch_Cycle Fetch(
            .clk(clk), 
            .rst(rst), 
            .EN(~StallF),         
            .PCSrcD(PCSrcD),
            /*PCPlus4D internally accessed*/
            .PCBranchD(PCBranchD),
             
             //output
            .InstrD(InstrD), 
            .PCPlus4D(PCPlus4D) 
          );
        
        
        
          Decode_Cycle Decode(
              .clk(clk), 
              .rst(rst), 
              .EN(~StallD),
//            .CLR(PCSrcD), internally assigned
              
              .InstrD(InstrD),
              .RegWriteW(RegWriteW), 
              .ALUResultM(ALU_ResultM),
              
              .ForwardAD(ForwardAD),
              .ForwardBD(ForwardBD),
              .PCPlus4D(PCPlus4D),
              .RDW(RDW), //writeRegW
              .ResultW(ResultW),
     
              //outputs
              .RegWriteE(RegWriteE),
              .ResultSrcE(ResultSrcE),/*MemToReg*/
              .MemWriteE(MemWriteE),
              .ALUControlE(ALUControlE),
              .ALUSrcE(ALUSrcE),
              .RegDstE(RegDstE),
              .BranchD(BranchD),
              .PCSrcD(PCSrcD),

              .RD1_E(RD1_E), 
              .RD2_E(RD2_E),              
              .RS1_E(RS1_E), 
              .RS2_E(RS2_E),
              .RD_E(RD_E), 
              .Imm_Ext_E(Imm_Ext_E),
              .PCBranchD(PCBranchD)

          );
                  
          
          Execute_Cycle Execute( //26
              .clk(clk),
              .rst(rst),
              .CLR(FlushE),
              .RegWriteE(RegWriteE ), 
              .ResultSrcE(ResultSrcE), //MemtowriteE
              .MemWriteE(MemWriteE),
              .ALUControlE(ALUControlE),
              .ALUSrcE(ALUSrcE),  
              .RegDstE(RegDstE),
              .RD1_E(RD1_E), 
              .RD2_E(RD2_E),              
              .ResultW(ResultW),
              .ForwardA_E(ForwardAE),
              .ForwardB_E(ForwardBE),
              .RS1_E(RS1_E), 
              .RS2_E(RS2_E), 
              .RD_E(RD_E), //writeregE
              .Imm_Ext_E(Imm_Ext_E),
              
              //output
              .RegWriteM(RegWriteM), 
              .ResultSrcM(ResultSrcM),//MemtowriteM 
              .MemWriteM(MemWriteM),  
              .WriteDataM(WriteDataM),              
              .RD_M(RD_M), //writeregM
              .ALU_ResultM(ALU_ResultM) //ALUOutM          
//          
          );
        
            Memory_Cycle Memory(
                .clk(clk), 
                .rst(rst),
                .RegWriteM(RegWriteM),  
                .ResultSrcM(ResultSrcM), //memtoreg
                .MemWriteM(MemWriteM), 
                .ALU_ResultM(ALU_ResultM), //ALUOutM
                .WriteDataM(WriteDataM),
                .RD_M(RD_M), //writeregM
                
                //output                
                .RegWriteW(RegWriteW), 
                .ResultSrcW(ResultSrcW),//memtoreg
                .ALUResultW(ALUResultW), //ALUOutW
                .ReadDataW(ReadDataW),
                .RD_W(RDW) //writeregW 
        );
        
        WriteBack_Cycle WriteBack(
            .clk(clk), 
            .rst(rst),             
            .ResultSrcW(ResultSrcW),
            .ALU_ResultW(ALUResultW),//ALUOutW 
            .ReadDataW(ReadDataW), 
            
            //output
            .ResultW(ResultW)
         );
    
        //hazard unit
        Hazard_Unit Forwarding_Block(
            .clk(clk), 
            .rst(rst),

            
            .RegWriteW(RegWriteW), //input
            .RD_W(RDW),//WriteRegW  //input             
            .RegWriteM(RegWriteM),  //input           
            .ResultSrcM(ResultSrcM),//input  //MemtoregM            
            .RD_M(RD_M), //writeregM //input
            .RegWriteE(RegWriteE),  //input          
            .ResultSrcE(ResultSrcE),//input //MemtoregE
            .RD_E(RD_E), //input
            .RS1_E(RS1_E), //input 
            .RS2_E(RS2_E), //input
            .RS1_D(RS1_E),//input //not needed
            .RS2_D(RS2_E),//input //not needed
            .BranchD(BranchD), //input
            

            .ForwardBE(ForwardBE), //output
            .ForwardAE(ForwardAE), //output
            .FlushE(FlushE), //output
            .ForwardBD(ForwardBD), //output
            .ForwardAD(ForwardAD), //output           
            .StallD(StallD), //output
            .StallF(StallF) //output

            
            
            );


endmodule










`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 05:07:20 PM
// Design Name: 
// Module Name: Hazard_Unit
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


module Hazard_Unit(
    input clk, rst, RegWriteW, RegWriteM, ResultSrcM, RegWriteE,
    input ResultSrcE, BranchD,
    input [4:0] RD_E, RS1_E, RS2_E, RS1_D, RS2_D, RD_M, RD_W,
    
    output [1:0] ForwardAE, ForwardBE,
    output FlushE, ForwardBD, ForwardAD, StallD, StallF 
    
    );
    
    wire branchstallD, lwstallD;
    
    assign ForwardAE = ( rst == 1'b0 ) ? 2'b00 :
                       ( ( RegWriteM == 1'b1 ) & (RD_M != 5'h00) &( RD_M == RS1_E) ) ? 2'b10 :
                       ( ( RegWriteW == 1'b1 ) & (RD_W != 5'h00) &( RD_W == RS1_E) ) ? 2'b01 :
                       2'b00 ;
    
    assign ForwardBE = ( rst == 1'b0 ) ? 2'b00 :
                       ( ( RegWriteM == 1'b1 ) & (RD_M != 5'h00) &( RD_M == RS2_E) ) ? 2'b10 :
                       ( ( RegWriteW == 1'b1 ) & (RD_W != 5'h00) &( RD_W == RS2_E) ) ? 2'b01 :
                        2'b00 ;    
    
    /*assign ForwardAD = ( rst == 1'b0 ) ? 2'b00 :
                       ( ( RegWriteM == 1'b1 ) & (RD_M != 5'h00) &( RD_M == RS2_E) ) ? 2'b10 :
                       ( ( RegWriteW == 1'b1 ) & (RD_W != 5'h00) &( RD_W == RS2_E) ) ? 2'b01 :
                        2'b00 ;    
    */              
                  
    //RsD == RS1_D
    //RtD == RS2_D
    //rdD == rdD
                     
    //RsE == RS1_E
    //RtE == RS2_E
    //rdE == rdE
    
    //WriteRegE ==  RD_E
    //WriteRegM ==  RD_M   
    //WriteRegW ==  RD_W
                    
    //MemtoRegM ==  ResultSrcM     
    
    assign ForwardAD = (RS1_D != 0 & RS1_D == RD_M) & RegWriteM;
    assign ForwardBD = (RS2_D != 0 & RS2_D == RD_M) & RegWriteM;
    
    assign branchstallD =    BranchD & 
                            (RegWriteE  & (RD_E == RS1_D | RD_E == RS2_D)) |
                            (ResultSrcM & (RD_M == RS1_D | RD_M == RS2_D)) ;

//    assign lwstall = ((RS1_D == RS2_E) | (RS2_D == RD_E)) & ResultSrcE ;
    assign lwstallD = ResultSrcE & (RS2_E == RS1_D | RS2_E == RS2_D);
    
    assign StallD = lwstallD | branchstallD;
    assign StallF = StallD;
    assign FlushE = StallD;
    
    
//    FlushD = PcSrcE;
    
endmodule
















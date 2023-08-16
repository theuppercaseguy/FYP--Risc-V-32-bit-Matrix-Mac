`timescale 1ns/1ns

module hazard_unit (
    input clk, rst,
    input      [4:0] Rs1_E,
    input      [4:0] Rs2_E,
    input      [4:0] RD_M,
    input      [4:0] RD_W,
    input      [4:0] RS1_D,
    input      [4:0] RS2_D,
    input      [4:0] RdE,
    input      ResultSrcE,
    input            RegWriteM,
    input            RegWriteW,
    input            PCSrcE,
    
    output reg       StallF,
    output reg       StallD,
    output reg       FlushE,
    output reg       FlushD,
    output reg [1:0] ForwardAE,
    output reg [1:0] ForwardBE
//    output reg  ForwardAE,
//    output reg  ForwardBE
);
    reg lwStall;

    always @(*) begin
        if (((Rs1_E == RD_M) & RegWriteM) & (Rs1_E != 0) ) begin
            ForwardAE = 2'b10;
        end
        else if ( ((Rs1_E == RD_W) & RegWriteW) & (Rs1_E != 0) ) begin
            ForwardAE = 2'b01;
        end
        else if(lwStall & (RS1_D == RdE))begin
             ForwardAE = 2'b10; // Forward from the memory stage if required
        end
        else begin
            ForwardAE = 2'b00;
        end
        
    end

    always @ (*) begin
        if (((Rs2_E == RD_M) & RegWriteM) & (Rs2_E != 0) ) begin
            ForwardBE = 2'b10;
        end
        else if ( ((Rs2_E == RD_W) & RegWriteW) & (Rs2_E != 0) ) begin
            ForwardBE = 2'b01;
        end
        else if (lwStall & (RS2_D == RdE)) begin
                   ForwardBE = 2'b10; // Forward from the memory stage if required
        end
        else begin
            ForwardBE = 2'b00;
        end
        
    end
    

    always @ (* ) begin
        lwStall = (ResultSrcE & ((RS1_D == RdE) | (RS2_D == RdE)));
        StallD  = lwStall;
        StallF  = lwStall | (PCSrcE != 1'b0);
        FlushE  = lwStall ; 
        FlushD  = PCSrcE != 1'b0;
    end

endmodule
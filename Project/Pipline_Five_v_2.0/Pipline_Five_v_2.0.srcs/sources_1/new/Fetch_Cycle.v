
`include "Program_Counter.v"
`include "PC_Adder.v"
`include "MUX_2_by_1.v"
`include "Instruction_Memory.v"
`include "Adder.v"

module fetch_cycle(clk, rst,EN, PCSrcE, PCTargetE, InstrD, PCD, PCPlus4D);

    // Declare input & outputs
    input clk, rst, EN;
    input PCSrcE;
    input [31:0] PCTargetE;

    output [31:0] InstrD;
    output [31:0] PCD, PCPlus4D;

    // Declaring interim wires
    wire [31:0] PC_F, PCF, PCPlus4F;
    wire [31:0] InstrF;

    // Declaration of Register
    reg [31:0] InstrF_reg;
    reg [31:0] PCF_reg, PCPlus4F_reg;


    // Initiation of Modules
    // Declare PC Mux
     MUX_2_by_1 PC_MUX(
                .a(PCPlus4F),
                .b(PCTargetE),
                .s(PCSrcE),
                .c(PC_F)
                );

    // Declare PC Counter
    Program_Counter Program_Counter (
                .clk(clk),
                .rst(rst),
                .PC(PCF),
                .PC_Next(PC_F)
                );

    // Declare Instruction Memory
    Instruction_Memory IMEM (
                .rst(rst),
                .A(PCF),
                .RD(InstrF)
                );

    // Declare PC adder
    Adder PC_adder (
                .A(PCF),
                .B(32'h00000004),
                .Sum(PCPlus4F),
                .Carry_Out()
                );

    // Fetch Cycle Register Logic
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            InstrF_reg              <= 32'h00000000;
            PCF_reg                 <= 32'h00000000;
            PCPlus4F_reg            <= 32'h00000000;
              
        end
        else begin
            if(EN ==1'b1)begin
                InstrF_reg          <= InstrF;
                PCF_reg             <= PCF;
                PCPlus4F_reg        <= PCPlus4F;
            end
        end
    end


    // Assigning Registers Value to the Output port
    assign  InstrD   = (rst == 1'b0) ? 32'h00000000 : InstrF_reg;
    assign  PCD      = (rst == 1'b0) ? 32'h00000000 : PCF_reg;
    assign  PCPlus4D = (rst == 1'b0) ? 32'h00000000 : PCPlus4F_reg;


endmodule
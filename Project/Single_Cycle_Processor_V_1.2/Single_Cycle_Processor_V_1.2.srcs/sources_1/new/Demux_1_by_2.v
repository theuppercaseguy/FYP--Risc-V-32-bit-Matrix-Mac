`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 08:20:32 PM
// Design Name: 
// Module Name: Demux_1_by_2
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


module Demux_1_by_2(
    input [31:0] A,B,
    input S,
    output [31:0] Y
    );
    assign Y = ( S == 1'b1 ) ? B : A;
    
endmodule

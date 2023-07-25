`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 05:52:29 PM
// Design Name: 
// Module Name: Sign_Extend
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


module Sign_Extend( //our imm values are of 12 bits, we are sign extending it to 32 bits
        input [31:0] In,//inputs bits
        input ImmSrc,
        output [31:0] Imm_Ext// output bits 
    );
    
    //extending by 20 bits which are the same as the MSB of th Input, so signed value is contained
     assign Imm_Ext =  (ImmSrc == 1'b1) ? ( { { 20{ In[31] } },{ In[31:25],In[11:7] } }) :
                                  { { 20{1'b0} } , In[31:20] } ; 


endmodule

















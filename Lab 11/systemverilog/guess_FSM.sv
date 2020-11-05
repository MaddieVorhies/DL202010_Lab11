`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2020 12:09:02 PM
// Design Name: 
// Module Name: guess_FSM
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


module guess_FSM #(parameter N=1)(
    input clk, reset,
    input  b0, b1, b2, b3,
    output reg win, lose,
    output reg y0, y1, y2, y3
    );
    
    localparam [1:0]
      s0   = 2'b00,
      s1  = 2'b01,
      s2    = 2'b11,
      s3  = 2'b10;
      swin = 
    
endmodule

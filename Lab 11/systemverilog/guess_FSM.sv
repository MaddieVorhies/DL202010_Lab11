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
    input clk, rst, en,
    input  [3:0] b,
    output reg win, lose,
    output reg [3:0] y
    );
    
    localparam [1:0]
      s0    = 2'b00,
      s1    = 2'b01,
      s2    = 2'b11,
      s3    = 2'b10,

      
    reg [1:0] state, state_next;
      
    always @(posedge clk, posedge rst)
    begin
       if (rst==1) 
          win <= 0;
          lose <= 0;
          y[3:0] <= 0;
       else if (en==1)
          Q <= D;
    end
    
    
    
    
      
    
      
    
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2020 12:40:08 PM
// Design Name: 
// Module Name: counter_slow
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


module counter_slow(
    input clk,
    input rst,
    output tick
    );
    
    counter #(.N(26)) count_slow (
       .clk(clk),
       .rst(rst),
       .tick(tick)
    );
    
endmodule

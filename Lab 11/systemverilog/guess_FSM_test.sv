`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 09:16:02 PM
// Design Name: 
// Module Name: guess_FSM_test
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


module guess_FSM_test();
    reg clk_t, rst_t, en_t;
    reg  [3:0] b_t;
    reg win_t, lose_t;
    reg [3:0] y_t;
    
    guess_FSM dut (
       .clk(clk_t), 
       .rst(rst_t), 
       .en(en_t),
       .b(b_t),
       .win(win_t), 
       .lose(lose_t), 
       .y(y_t)
    );
    
    initial begin 
       clk_t = 0; 

endmodule

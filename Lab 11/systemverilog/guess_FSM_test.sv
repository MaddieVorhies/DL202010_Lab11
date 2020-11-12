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
    
    always begin
       clk_t = ~clk_t; #5;
    end
    
    initial begin 
        clk_t = 0; en_t = 0; rst_t = 0; #5;
        en_t = 1; #5;
        b_t = 4'b0001; #5;
        rst_t = 1; #5;
        rst_t = 0; #5;
        b_t = 4'b0000; #5;
        b_t = 4'b1100; #5;
        $finish;
    end

endmodule

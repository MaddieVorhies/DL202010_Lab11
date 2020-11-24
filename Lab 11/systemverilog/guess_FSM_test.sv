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
    integer i;
    
    guess_FSM #(.N(21)) dut (
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
       clk_t = 0; rst_t = 1; en_t = 0; b_t = 4'b0000; #10
       rst_t = 0; #20
       en_t = 1; #60
       
       for (i = 0; i <= 4'b1111; i = i + 1) begin
           b_t = 4'b0000; 
           #60; 
           b_t = i;
           #10;
       end
       
       b_t = 4'b0000;
       en_t = 0; #50;
       en_t = 1; #60; 
       rst_t = 1; #10;
       rst_t = 0;
       
       for (i = 0; i <= 4'b1111; i = i + 1) begin
          b_t = 4'b0000;
          #50; 
          b_t = i;
          #10; 
       end 
       
       b_t = 4'b0000;
       en_t = 0; #50;
       en_t = 1; #60; 
       rst_t = 1; #10;
       rst_t = 0;
       
       for (i = 0; i <= 4'b1111; i = i + 1) begin
          b_t = 4'b0000;
          #70; 
          b_t = i;
          #10; 
       end 
       $finish;
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 01:11:09 PM
// Design Name: 
// Module Name: guessing_game_test
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


module guessing_game_test();
   reg btnU_t, btnD_t, btnL_t, btnR_t, btnC_t;
   reg clk_t;
   reg [15:0] sw_t;
   wire [6:0] seg_t;
   wire [3:0] an_t;
   reg [15:0] led_t;
   
   guessing_game #(.N(3), .D(1)) dut(
      .btnU(btnU_t),
      .btnD(btnD_t), 
      .btnL(btnL_t), 
      .btnR(btnR_t),
      .btnC(btnC_t),
      .clk(clk_t),
      .sw(sw_t),
      .seg(seg_t),
      .an(an_t),
      .led(led_t)
   );
   
    always begin
       clk_t = ~clk_t; #5;
    end
   
   initial begin 
      clk_t = 0; btnC_t = 1; btnR_t = 0; btnD_t = 0; 
      btnU_t = 0; btnL_t = 0; sw_t = 0; #10;
      btnC_t = 0; #20;
      sw_t = 0; #40; 
      
      btnR_t = 1; btnL_t = 0; 
      btnD_t = 0; btnU_t = 0; #100;
      
      btnR_t = 0; btnL_t = 0; 
      btnD_t = 0; btnU_t = 0; #10;
      sw_t = 1; #60;
      sw_t = 0; #50;
      btnC_t = 1; #20;
      btnC_t = 0; #60;
      
      btnR_t = 0; btnL_t = 0; 
      btnD_t = 1; btnU_t = 0; #50;
      
      btnR_t = 0; btnL_t = 0; 
      btnD_t = 0; btnU_t = 0; #10;
      sw_t = 1; #60;
      sw_t = 0; #50;
      btnC_t = 1; #20;
      btnC_t = 0; #60;
      
      btnR_t = 0; btnL_t = 0; 
      btnD_t = 1; btnU_t = 0; #50;
      
      btnR_t = 0; btnL_t = 0; 
      btnD_t = 0; btnU_t = 0; #10;
      sw_t = 1; #60;
      sw_t = 0; #50;
      btnC_t = 1; #20;
      btnC_t = 0; #60;
      
      btnR_t = 0; btnL_t = 0; 
      btnD_t = 0; btnU_t = 1; #50;
      
      btnR_t = 0; btnL_t = 0; 
      btnD_t = 0; btnU_t = 0; #10;
      sw_t = 1; #60;
      sw_t = 0; #50;
      btnC_t = 1; #20;
      btnC_t = 0; #60;
      $finish;
      
   end
  
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2020 11:22:35 AM
// Design Name: 
// Module Name: guessing_game
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


module guessing_game #(parameter N = 26, D = 21) (
   input btnU, btnD, btnL, btnR, btnC,
   input clk, 
   input [15:0] sw, 
   output [6:0] seg, 
   output [3:0] an,
   output reg [15:0] led
    );
    
    wire deb1_out, deb2_out, deb3_out, deb4_out;
    wire deb1_tick, deb2_tick, deb3_tick, deb4_tick;
    wire fast_count;
    wire slow_count;
    wire mux2_out;
    wire [3:0] guess_y;
    wire guess_win;
    wire guess_lose;
    
    debounce #(.N(D))deb1(
       .clk(clk), 
       .reset(btnC),
       .in(btnR),
       .out(deb1_out),
       .tick(deb1_tick)
    );
    
    debounce #(.N(D))deb2(
       .clk(clk), 
       .reset(btnC),
       .in(btnU),
       .out(deb2_out),
       .tick(deb2_tick)
    );
    
    debounce #(.N(D))deb3(
       .clk(clk), 
       .reset(btnC),
       .in(btnL),
       .out(deb3_out),
       .tick(deb3_tick)
    );
    
    debounce #(.N(D))deb4(
       .clk(clk), 
       .reset(btnC),
       .in(btnD),
       .out(deb4_out),
       .tick(deb4_tick)
    );
    
   counter #(.N(N)) slow(
       .clk(clk), 
       .rst(btnC),
       .tick(slow_count)
    );
   
    counter #(.N(N-2)) fast(
       .clk(clk),
       .rst(btnC),
       .tick(fast_count)
    );
    
    mux2 #(.BITS(1)) mux_guess(
       .in0(slow_count),
       .in1(fast_count),
       .sel(sw[0]),
       .out(mux2_out)
    );
    
    guess_FSM guessing_game(
       .b({deb4_out, deb3_out, deb2_out, deb1_out}),
       .en(mux2_out),
       .clk(clk), 
       .rst(btnC),
       .y(guess_y),
       .win(guess_win),
       .lose(guess_lose),
       .led(led)
    );
    
    y_decoder decoder(
       .in(guess_y), 
       .out(seg)
   );
    
    assign an = 4'b1110;
    
endmodule

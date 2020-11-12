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
      s0    = 2'b0000,
      s1    = 2'b0001,
      s2    = 2'b0011,
      s3    = 2'b0010,
      swin  = 4'b0100,
      slose = 4'b0101;

    reg [1:0] state, state_next;
    reg [N-1:0] counter, counter_next;
      
    always_ff @(posedge clk, posedge rst)
       if (rst) begin
         state   <= s0;
         counter <= {N{1'b1}};
      end
      else begin
         state   <= state_next;
         counter <= counter_next;
      end
      
    always_comb begin
      state_next   = state;
      counter_next = counter;
      
      case(state)
         s0: begin
            y[0] = 1;
            if (4'b0001)
               state_next = swin;
            else if (4'b000)
               state_next = s1; 
            else 
               state_next = slose;
         end
         
         s1: begin
            y[1] = 1;
            if (4'b0010)
               state_next = swin;
            else if (4'b000)
               state_next = s2; 
            else 
               state_next = slose;
         end
         
         s2: begin
            y[2] = 1;
            if (4'b0100)
               state_next = swin;
            else if (4'b000)
               state_next = s3; 
            else 
               state_next = slose;
         end
         
         s3: begin
            y[3] = 1;
            if (4'b1000)
               state_next = swin;
            else if (4'b000)
               state_next = s0; 
            else 
               state_next = slose;
         end
         
         swin: begin
            win = 1;
            if (4'b0000)
               state_next = s0; 
            else 
               state_next = swin;
         end
         
         slose: begin
            lose = 1;
            if (4'b0000)
               state_next = s0; 
            else 
               state_next = swin;
         end
      endcase
    end
    
    always @*
       case(state)
          s0: y = 4'b0001;
          s1: y = 4'b0010;
          s2: y = 4'b0100;
          s3: y = 4'b1000;
          swin: win = 1;
          slose: lose = 1;
       endcase
       
    
          
      
    
    
endmodule

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


module guess_FSM(
    input clk, rst, en,
    input  [3:0] b,
    output reg [15:0] led,
    output reg win, lose,
    output reg [3:0] y
    );
    
      localparam s0    = 3'b000;
      localparam s1    = 3'b001;
      localparam s2    = 3'b010;
      localparam s3    = 3'b011;
      localparam swin  = 3'b100;
      localparam slose = 3'b101;

    reg [2:0] state, state_next;
      
    always @(posedge clk, posedge rst)
       if (rst) begin
         state   <= s0;
      end
      else if (en)
         state   <= state_next;
      
    always @*
          
      case(state)
         s0: begin
            if (b == 4'b0000)
               state_next = s1;
            else if (b[3] == 1 || b[2] == 1 || b[1] == 1)
               state_next = slose; 
            else 
               state_next = swin;
         end
         
         s1: begin
            if (b == 4'b0000)
               state_next = s2;
            else if (b[3] == 1 || b[2] == 1 || b[0] == 1)
               state_next = slose; 
            else 
               state_next = swin;
         end
         
         s2: begin
            if (b == 4'b0000)
               state_next = s3;
            else if (b[3] == 1 || b[1] == 1 || b[0] == 1)
               state_next = slose; 
            else 
               state_next = swin;
         end
         
         s3: begin
            if (b == 4'b0000)
               state_next = s0;
            else if (b[2] == 1 || b[1] == 1 || b[0] == 1)
               state_next = slose; 
            else 
               state_next = swin;
         end
         
         swin: 
            state_next = swin;
         
         slose: 
            state_next = slose;
            
      endcase
    
    always @* begin
      win = 1'b0;
      lose = 1'b0;
      led[15:0] = 16'b0;
       case(state)
          s0: 
             begin
             y = 4'b0001;
             win = 1'b0;
             lose= 1'b0;
             end
          s1: 
             begin
             y = 4'b0010;
             win = 1'b0;
             lose= 1'b0;
             end
          s2: 
             begin
             y = 4'b0100;
             win = 1'b0;
             lose= 1'b0;
             end
          s3: 
             begin
             y = 4'b1000;
             win = 1'b0;
             lose= 1'b0;
             end
             
          swin: begin
             win = 1'b1;
             lose = 1'b0;
             y = 4'b1111;
             led[15:0] = 16'b1111111111111111;
          end
          
          slose: begin
             lose = 1'b1;
             win = 1'b0;
             y = 4'b0000;
             led[0] = 1'b1;
          end
       endcase
    end
    
    
    
endmodule

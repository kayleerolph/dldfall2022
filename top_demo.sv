`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2021 06:40:11 PM
// Design Name: 
// Module Name: top_demo
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


module top_demo
(
  input  logic [2:0] sw,
//  input  logic [3:0] btn,
  output logic [1:0] led
);

//  assign led[3:0] = sw;
//  assign led[7:4] = btn;
//sw[0] == a
 silly fa ( sw[0], sw[1], sw[2], led[0], led[1]);
   
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/09 17:52:32
// Design Name: 
// Module Name: lab_6
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


module lab_6(row,clock,reset,col,AN,C);
input clock,reset;
input [3:0] row;
output [3:0] AN,col;
output [6:0] C;
wire [3:0] code;
assign AN = 4'b1110;
wire clock_1;
wire reg_load;
wire [3:0] Q;
clock_divider cd (clock,reset,clock_1);
keypad_scanner scanner(clock_1,reset,row,col,code,reg_load);
register store (clock_1,reset,code,reg_load,Q); 
ssd_driver ssd (Q,C);
endmodule

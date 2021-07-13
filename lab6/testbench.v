`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/11 14:43:34
// Design Name: 
// Module Name: testbench
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


module test;
    wire [3:0] col, AN;
    wire [6:0] C;
    wire [3:0] current_state;
    wire [3:0] code;
    reg [3:0] row;
    reg clock, reset;
    lab_6 UUT(row,clock,reset,col,AN,C, current_state, code);
    initial begin
        #0 clock=1;reset=0;row=0;
        #5 row=4'b0001;
        #5 reset = 1;
        #20 row=4'b0000;
    end
    always #1 clock=~clock;
endmodule

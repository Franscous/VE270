`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/09 17:47:53
// Design Name: 
// Module Name: register
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


module register(clk,reset,code,Reg_load,count);
input reset;
input [3:0] code;
output [3:0] count;
input Reg_load,clk;
reg [3:0] count;
initial count=4'ha;
always @(posedge clk,posedge reset)
    if(reset) count<=0;
        else
            if(Reg_load) count<=code;
            else count<=count;
endmodule

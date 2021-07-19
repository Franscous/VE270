`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/18 10:26:24
// Design Name: 
// Module Name: ring_counter
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


module ring_counter(clock_in,reset,Q);
input clock_in;
input reset;
output [1:0]Q;
reg [1:0]Q = 0;
always @(posedge clock_in or posedge reset)
begin
    if (reset == 1)Q <= 0;
    else
        Q <= Q+1;
end
endmodule
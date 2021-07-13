`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/23 21:32:59
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(clock,clear,clock_out);
input clock,clear;
output clock_out;
reg [17:0] count;
reg clock_out;
parameter N = 200000;
always @(posedge clock or posedge clear)
if(clear ==1)
    begin 
       count <=0;
       clock_out <= 0;
    end
else
    begin
        if(count ==N/2-1)
            begin
                clock_out <= ~clock_out;
                count <=0;
            end 
        else
            count <=count+1;
end
endmodule

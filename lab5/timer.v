`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/23 21:51:08
// Design Name: 
// Module Name: timer
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


module timer(clock,reset,Q_L,Q_R);
input clock,reset;
output [3:0]Q_L;
output [3:0]Q_R;
reg [3:0]Q_L;
reg [3:0]Q_R;
always @(posedge clock or posedge reset)
begin
    if (reset==1)
        begin
            Q_L <= 0;
            Q_R <= 0;
        end 
    else
        if (Q_R < 9)Q_R <=Q_R+1;
        else 
        begin
            Q_R<=0;
                if (Q_L < 5)Q_L <= Q_L+1;
                else Q_L <=0;
        end
end
endmodule

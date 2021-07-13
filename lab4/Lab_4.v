`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/13 16:18:16
// Design Name: 
// Module Name: Lab_4
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


module ssd_driver(Q,C);
    input [3:0] Q;
    output [6:0] C;
    reg [6:0] C;
    always @(Q) begin
        case (Q)
            4'h0: C = 7'b1000000;
            4'h1: C = 7'b1111001;
            4'h2: C = 7'b0100100;
            4'h3: C = 7'b0110000;
            4'h4: C = 7'b0011001;
            4'h5: C = 7'b0010010;
            4'h6: C = 7'b0000010;
            4'h7: C = 7'b1111000;
            4'h8: C = 7'b0000000;
            4'h9: C = 7'b0010000;
            4'ha: C = 7'b0001000;
            4'hb: C = 7'b0000011;
            4'hc: C = 7'b1000110;
            4'hd: C = 7'b0100001;
            4'he: C = 7'b0000110;
            4'hf: C = 7'b0001110;
            default C = 7'b1111111;
        endcase
    end
endmodule

module counter_4_bit(clock,reset,u_or_down,Q,C,AN);
    input clock,reset,u_or_down;
    output [3:0]  Q;
    output [3:0] AN; 
    output [6:0] C;
    ssd_driver ssd (Q,C);
    reg    [3:0]  Q=4'b0000;
    assign AN = 4'b1110;
    always @ (posedge reset or posedge clock)
        if(reset==1'b1) Q<=0; else
        if(u_or_down==1'b1) Q<=Q+1;
    else                Q<=Q-1;
endmodule

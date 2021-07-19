`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/18 10:24:57
// Design Name: 
// Module Name: ssd_driver
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


module ssd_driver(Q,ssd_mode,C);
    input [1:0] ssd_mode;
    input [3:0] Q;
    output [6:0] C;
    reg [6:0] C;
    always @(Q) begin
        if (ssd_mode == 2'b00) begin
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
//            4'ha: C = 7'b0001000;
//            4'hb: C = 7'b0000011;
//            4'hc: C = 7'b1000110;
//            4'hd: C = 7'b0100001;
//            4'he: C = 7'b0000110;
//            4'hf: C = 7'b0001110;
            default C = 7'b1111111;
        endcase
    end
        else if (ssd_mode == 2'b01) C = 7'b0111111;
        else C = 7'b1111111;
   end
endmodule

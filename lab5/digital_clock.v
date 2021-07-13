`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/23 22:31:56
// Design Name: 
// Module Name: digital_clock
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


module digital_clock(clock,reset,AN,C);
input clock,reset;
output [3:0]AN;
output [6:0]C;
wire Clk_500Hz,Clk_1Hz;
wire[3:0]Q_L,Q_R;
wire[1:0]ring;
reg [3:0] Q = 4'ha;
reg [3:0] AN = 4'b1111;
clock_divider clock_500Hz (clock,reset,Clk_500Hz);
clock_divider #(500) clock_1Hz (Clk_500Hz,reset,Clk_1Hz); 
timer counter (Clk_1Hz,reset,Q_L,Q_R);
ring_counter rc(Clk_500Hz,reset,ring);
SSD_driver ssd(Q,C);
    always @(ring) begin
        case (ring)
            2'b00: begin Q = 4'ha; AN = 4'b0111; end
            2'b01: begin Q = 4'ha; AN = 4'b1011; end
            2'b10: begin Q = Q_L; AN = 4'b1101; end
            2'b11: begin Q = Q_R; AN = 4'b1110; end
            default: begin Q = 4'ha; AN = 4'b1111; end
        endcase
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/24 00:44:24
// Design Name: 
// Module Name: testbenth
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


//module testbenth;
//parameter half_period = 10;
//wire [3:0] Q_L,Q_R;
//reg clock,reset;
//timer UUT (clock,reset,Q_L,Q_R);
//initial begin
//#0 clock = 0; reset = 0;
//#50 reset = 1;
//#100 reset = 0;
//end
//always #half_period clock = ~clock;
//initial #2000 $stop;
//endmodule
//module testbenth;
//parameter half_period = 50;
//wire [3:0] Q;
//reg clock,reset;
//ring_counter UUT (clock,reset,Q);
//initial begin
//#0 clock = 0; reset = 0;
//#50 reset = 1;
//#100 reset = 0;
//end
//always #half_period clock = ~clock;
//initial #2000 $stop;
//endmodule
module testbenth;
parameter half_period = 1;
wire [3:0] AN;
wire [6:0] C;
reg [3:0] AN = 4'b1111;
reg [6:0] C = 7'b1111111;
reg clock,reset;
digital_clock UUT (clock,reset,AN,C);
initial begin
#0 clock = 0; reset = 0;
#5 reset = 1;
#10 reset = 0;
end
always #half_period clock = ~clock;
initial #200 $stop;
endmodule
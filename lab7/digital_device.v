`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/18 10:27:36
// Design Name: 
// Module Name: digital_device
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


module digital_device(clock,number,P,mode,push,C,AN,overflow);
input clock,push,P,mode;
input [3:0] number;
output overflow;
output [3:0] AN; 
output [6:0] C;
wire [1:0] ring;
wire reset = 0;
wire clock_500,clock_1;
reg [1:0] c1=2'h2, c2=2'h2, c3=2'h2, c4=2'h2, c5=2'h2, c6=2'h2;
reg overflow = 0;
reg [3:0] student_id = 4'h0;
reg [1:0] ssd_mode = 2'b00;
reg [3:0] Q = 4'ha;
reg [3:0] AN = 4'b1111;
reg [3:0] Q1=4'h0, Q2=4'h0, Q3=4'h0, Q4=4'h0, Q5=4'h0; 
reg [3:0] old_num = 4'h0;
reg [3:0] new_num = 4'h0;
clock_divider clock_500Hz (clock,reset,clock_500);
clock_divider #(500) clock_1Hz (clock_500,reset,clock_1);
ring_counter Ring (clock_500,reset,ring);
ssd_driver ssd (Q,ssd_mode,C);
always @ (ring) begin
    if (mode == 0) begin
        case (ring)
                2'b00: begin Q = Q1; ssd_mode = c1; AN = 4'b0111; end
                2'b01: begin Q = Q2; ssd_mode = c2; AN = 4'b1011; end
                2'b10: begin Q = Q3; ssd_mode = c3; AN = 4'b1101; end
                2'b11: begin Q = Q4; ssd_mode = c4; AN = 4'b1110; end
                default: begin Q = Q1; ssd_mode = c1; AN = 4'b1111; end
            endcase
        end else begin
            case (ring)
                2'b00: begin ssd_mode = 4'h2; AN = 4'b0111; end
                2'b01: begin ssd_mode = 4'h2; AN = 4'b1011; end
                2'b10: begin ssd_mode = c5; AN = 4'b1101; end
                2'b11: begin Q = Q5; ssd_mode = c6; AN = 4'b1110; end
                default: begin AN = 4'b1111; end
            endcase
        end
end
always @ (posedge clock_1) begin
    if (mode == 0) begin 
    case (student_id)
        4'h0:if(P == 0) begin Q4 = 4'h5; c4 = 2'h0; end 
             else       begin Q4 = 4'h5; c4 = 2'h0; end 
        4'h1:if(P == 0) begin Q4 = 4'h1;Q3 = 4'h5;c3 = 2'h0; end 
             else       begin Q4 = 4'h2;Q3 = 4'h5;c3 = 2'h0; end
        4'h2:if(P == 0) begin Q4 = 4'h9;Q3 = 4'h1;Q2 = 4'h5;c2 = 2'h0; end 
             else       begin Q4 = 4'h0;Q3 = 4'h2;Q2 = 4'h5;c2 = 2'h0; end
        4'h3:if(P == 0) begin Q4 = 4'h0;Q3 = 4'h9;Q2 = 4'h1;Q1 = 4'h5;c1 = 2'h0; end 
             else       begin Q4 = 4'h3;Q3 = 4'h0;Q2 = 4'h2;Q1 = 4'h5;c1 = 2'h0; end 
        4'h4:if(P == 0) begin Q4 = 4'h2;Q3 = 4'h0;Q2 = 4'h9;Q1 = 4'h1; end
             else       begin Q4 = 4'h7;Q3 = 4'h3;Q2 = 4'h0;Q1 = 4'h2; end
        4'h5:if(P == 0) begin Q4 = 4'h1;Q3 = 4'h2;Q2 = 4'h0;Q1 = 4'h9; end
             else       begin Q4 = 4'h0;Q3 = 4'h7;Q2 = 4'h3;Q1 = 4'h0; end   
        4'h6:if(P == 0) begin Q4 = 4'h9;Q3 = 4'h1;Q2 = 4'h2;Q1 = 4'h0; end
             else       begin Q4 = 4'h9;Q3 = 4'h0;Q2 = 4'h7;Q1 = 4'h3; end    
        4'h7:if(P == 0) begin Q4 = 4'h1;Q3 = 4'h9;Q2 = 4'h1;Q1 = 4'h2; end
             else       begin Q4 = 4'h1;Q3 = 4'h9;Q2 = 4'h0;Q1 = 4'h7; end  
        4'h8:if(P == 0) begin Q4 = 4'h0;Q3 = 4'h1;Q2 = 4'h9;Q1 = 4'h1; end
             else       begin Q4 = 4'h0;Q3 = 4'h1;Q2 = 4'h9;Q1 = 4'h0; end
        4'h9:if(P == 0) begin Q4 = 4'h1;Q3 = 4'h0;Q2 = 4'h1;Q1 = 4'h9; end
             else       begin Q4 = 4'h0;Q3 = 4'h0;Q2 = 4'h1;Q1 = 4'h9; end      
        4'ha:if(P == 0) begin Q4 = 4'h7;Q3 = 4'h1;Q2 = 4'h0;Q1 = 4'h1; end
             else       begin Q4 = 4'h7;Q3 = 4'h0;Q2 = 4'h0;Q1 = 4'h1; end 
        4'hb:if(P == 0) begin Q4 = 4'h8;Q3 = 4'h7;Q2 = 4'h1;Q1 = 4'h0; end
             else       begin Q4 = 4'h8;Q3 = 4'h7;Q2 = 4'h0;Q1 = 4'h0; end 
        4'hc:if(P == 0) begin c4 = 2'h2;Q3 = 4'h8;Q2 = 4'h7;Q1 = 4'h1; end
             else       begin c4 = 2'h2;Q3 = 4'h8;Q2 = 4'h7;Q1 = 4'h0; end
        4'hd:if(P == 0) begin c3 = 2'h2;          Q2 = 4'h8;Q1 = 4'h7; end
             else       begin c3 = 2'h2;          Q2 = 4'h8;Q1 = 4'h7; end
        4'he:if(P == 0) begin c2 = 2'h2;                    Q1 = 4'h8; end
             else       begin c2 = 2'h2;                    Q1 = 4'h8; end
        4'hf:if(P == 0) begin c1 = 2'h2;                               end
             else       begin c1 = 2'h2;                               end
        endcase
        student_id = student_id + 1;
     end
end
always @ (posedge push) begin
    if (mode == 1) begin
    new_num = old_num + number;
    if ((old_num[3] && number[3] && (~new_num[3]))|((~old_num[3]) && (~number[3]) && new_num[3])) overflow = 1;
    else overflow = 0;
    old_num = new_num;
    if (old_num[3] == 1) begin
        Q5 = ~(old_num - 1);
        c5 = 4'h1;
        c6 = 4'h0;
        end
     else begin
        Q5 = old_num;
        c5 = 4'h2;
        c6 = 4'h0;
     end
    end
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/09 16:18:19
// Design Name: 
// Module Name: keypad_scanner
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


module keypad_scanner(clock,reset,row,col,code,reg_load);
input clock,reset;
input[3:0] row;
output[3:0] col,code;
output reg_load;
reg [3:0]code = 4'b0000;
reg [3:0] current_state;
reg [3:0] next_state;
reg [3:0] col = 4'b1111; 
wire OR_row;
assign OR_row = |row;
reg reg_load = 0;
parameter init = 4'd0; 
parameter state_1 = 4'd1; 
parameter state_2 = 4'd2; 
parameter state_3 = 4'd3; 
parameter state_4 = 4'd4; 
parameter state_5 = 4'd5; 
parameter state_6 = 4'd6; 
parameter state_7 = 4'd7; 
parameter state_8 = 4'd8; 
parameter state_9 = 4'd9; 

initial current_state = init;
always @(posedge clock or posedge reset) begin
    if(reset == 1) current_state <= init;
    else current_state <=next_state;
end
always @(current_state,OR_row) begin
        case(current_state)
            init:begin
                col = 4'b1111;
		if(OR_row == 1)next_state = state_1;
                else next_state = init;
            end
            state_1:begin
                col = 4'b0001;
                if(OR_row == 1) next_state = state_5;
                else next_state = state_2;
                end
            state_2:begin
                col = 4'b0010;
                if(OR_row == 1) next_state = state_6; 
                else next_state = state_3;
                end
            state_3:begin
                col = 4'b0100;
                if(OR_row == 1) next_state = state_7;
                else next_state = state_4;
                end
            state_4:begin
                col = 4'b1000;
                if(OR_row == 1) next_state = state_8;
                else next_state = init;
                end
            state_5:begin
                col = 4'b0001;
                reg_load = 1;
                case(row)
                    4'b0001:code<=4'h0;
					4'b0010:code<=4'h4;
					4'b0100:code<=4'h8;
					4'b1000:code<=4'hc;
					default:code<=4'h0;
			    endcase
                next_state = state_9;
                end
             state_6:begin
                col = 4'b0010;
                reg_load = 1;
                case(row)
					4'b0001:code<=4'h1;
					4'b0010:code<=4'h5;
					4'b0100:code<=4'h9;
					4'b1000:code<=4'hd;
					default:code<=4'h0;					
			    endcase
                next_state = state_9;
                end 
             state_7:begin
                col = 4'b0100;
                reg_load = 1;
                case(row)
					4'b0001:code<=4'h2;
					4'b0010:code<=4'h6;
					4'b0100:code<=4'ha;
					4'b1000:code<=4'he;
					default:code<=4'h0;
			    endcase
                next_state = state_9;
                end
             state_8:begin
                col = 4'b1000;
                reg_load = 1;
                case(row)
					4'b0001:code<=4'h3;
					4'b0010:code<=4'h7;
					4'b0100:code<=4'hb;
					4'b1000:code<=4'hf;
					default:code<=4'h0;
			    endcase
                next_state = state_9;
                end
             state_9:begin
                col = 4'b1111;
                reg_load = 0;
                if(OR_row == 1) next_state = state_9;
                else next_state = init;
                end
             default:begin
                col = 4'b1111;
                current_state <= current_state;
                end
       endcase
end
endmodule

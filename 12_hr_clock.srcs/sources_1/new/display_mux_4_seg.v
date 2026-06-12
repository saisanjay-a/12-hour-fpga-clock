`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 12:17:12 PM
// Design Name: 
// Module Name: display_mux_4_seg
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


module display_mux_4_seg(
    input clk,reset,
    input [4:0] hr,
    input [5:0] min,

    output reg [3:0] an,
    output reg [3:0] digit
);

reg [19:0] refresh_counter;

always @(posedge clk or posedge reset)
begin
    if(reset)
        refresh_counter <= 20'd0;
    else
        refresh_counter <= refresh_counter + 1'b1;
end

wire [1:0] sel;

assign sel = refresh_counter[3:2];

wire [3:0] hr_tens  = hr / 10;
wire [3:0] hr_ones  = hr % 10;

wire [3:0] min_tens = min / 10;
wire [3:0] min_ones = min % 10;

always @(*)
begin
    case(sel)

    2'b00:
    begin
        digit = min_ones;
        an = 4'b1110;
    end

    2'b01:
    begin
        digit = min_tens;
        an = 4'b1101;
    end

    2'b10:
    begin
        digit = hr_ones;
        an = 4'b1011;
    end

    2'b11:
    begin
        digit = hr_tens;
        an = 4'b0111;
    end

    endcase
end

endmodule
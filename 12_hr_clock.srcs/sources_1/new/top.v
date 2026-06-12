`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 12:35:23 PM
// Design Name: 
// Module Name: top
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


module top( // for 4 display segment (BASYS - 3)
    input clk,reset,
    output [6:0] seg,
    output [3:0] an, 
    output pm_led
);

    wire clk_1hz;
    wire [4:0] hr;
    wire [5:0] min, sec;
    wire pm;
    wire [3:0] digit;
    
    clk_divider u1(clk, reset, clk_1hz);
    
    clk_module_12_hr u2(clk_1hz, reset, hr, min, sec, pm);
 
    seven_seg_decoder u3(digit, seg);
        
    display_mux_4_seg u4(clk, reset, hr, min, an, digit);
    
    assign pm_led = pm;
    
endmodule

/* for 6 display segment
module top(
    input clk,
    input reset,
    output [6:0] seg,
    output [3:0] an,
    output pm_led
);

wire clk_1hz;

wire [4:0] hr;
wire [5:0] min;
wire [5:0] sec;

wire pm;

wire [3:0] digit;

clk_divider U1(clk, reset, clk_1hz);

clk_module_12_hr U2(clk_1hz, reset, hr, min, sec, pm);

display_mux U3(clk, hr, min, an, digit);

seven_seg_decoder U4(digit, seg);

assign pm_led = pm;

endmodule
*/
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 01:00:01 PM
// Design Name: 
// Module Name: tb_top
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

module tb_top;

reg clk;
reg reset;

wire [6:0] seg;
wire [3:0] an;
wire pm_led;

top DUT(
    .clk(clk),
    .reset(reset),
    .seg(seg),
    .an(an),
    .pm_led(pm_led)
);

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    reset = 1;
    #20;
    reset = 0;

    #2000000000;

    $finish;
end

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 11:19:49 AM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input clk,reset,
    output reg clk_1hz
);

    reg [26:0] count;
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            count   <= 27'b0;
            clk_1hz <= 1'b0;
        end
        else begin
            if(count == 49_999_999) begin
                count   <= 27'b0;
                clk_1hz <= ~clk_1hz;
            end
            else
                count <= count + 1'b1;
        end
    end
    
endmodule

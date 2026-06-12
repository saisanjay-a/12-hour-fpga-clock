`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 12:17:39 PM
// Design Name: 
// Module Name: display_mux_6_seg
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


module display_mux_6_seg(
    input clk,
    input [4:0] hr,
    input [5:0] min, sec,
    output reg [3:0] digit,
    output reg [5:0] an
    );
        reg [19:0] refresh_counter;
    
    always @(posedge clk)
        refresh_counter <= refresh_counter + 20'd1;
        
    wire [2:0] sel;
    
    assign sel = refresh_counter[19:17];
    
    wire [3:0] sec_ones = sec % 10;
    wire [3:0] sec_tens = sec / 10;

    wire [3:0] min_ones = min % 10;
    wire [3:0] min_tens = min / 10;

    wire [3:0] hr_ones = hr % 10;
    wire [3:0] hr_tens = hr / 10;
    
    always @(*) begin
        case (sel)
            3'd0 : begin
                digit = sec_ones;
                an = 6'b111110;
            end
            
            3'd1 : begin
                digit = sec_tens;
                an = 6'b111101;
            end
            
            3'd2 : begin
                digit = min_ones;
                an = 6'b111011;
            end
            
            3'd3 : begin
                digit = min_tens;
                an = 6'b110111;
            end
            
            3'd4 : begin
                digit = hr_ones;
                an = 6'b101111;
            end
            
            3'd5 : begin
                digit = hr_tens;
                an = 6'b011111;
            end
            
            default : begin
                digit = 4'd0;
                an = 6'b111111;
            end
            
        endcase
    end

endmodule

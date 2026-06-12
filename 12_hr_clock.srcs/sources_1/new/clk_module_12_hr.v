`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 11:31:05 AM
// Design Name: 
// Module Name: clk_module_12_hr
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


module clk_module_12_hr(
    input clk_1hz, reset,
    output reg [4:0] hr,
    output reg [5:0] min, sec,
    output reg pm
);

    always @(posedge clk_1hz or posedge reset) begin
        if (reset) begin
            hr  <= 5'd12;
            min <= 6'd0;
            sec <= 6'd0;
            pm  <= 1'b0;
        end
        else begin
        
            // Seconds begin
            if (sec == 6'd59) begin
                sec <= 6'd0;
                
                // Minutes begin
                if (min == 6'd59) begin
                    min <= 6'd0;
                    
                    // Hours begin
                    if (hr == 5'd11) begin
                        hr <= 5'd12;
                        pm <= ~pm;
                    end
                    else if (hr == 5'd12) 
                        hr <= 5'd1;
                    else
                        hr <= hr + 5'd1; 
                end // hours end
                
                else
                    min <= min + 6'd1; 
            end // Minutes end
            
            else 
                sec <= sec + 6'd1; 
        end // Seconds end
        
    end

endmodule

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/13 16:03:45
// Design Name: 
// Module Name: Divider
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


module Divider(
    input I_CLK,
    input Rst,
    output O_CLK
    );
    reg o_clk;
    reg [26:0] count;
    parameter N=100000000;
    always @(posedge I_CLK)
    begin
        if (Rst)
            begin
                count=0;
                o_clk=0;
            end
        else begin
            if (count==N/2-1)
                begin
                    o_clk=!o_clk;
                    count=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                end
            else begin
                count=count+1;
            end
        end
    end 
    assign O_CLK=o_clk;
endmodule


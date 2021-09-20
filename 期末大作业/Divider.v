`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 08:21:15
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


module Divider(I_CLK,Rst,O_CLK);
    input wire I_CLK;
    input wire Rst;
    output reg O_CLK=0;
    reg [31:0] cnt=0;
    parameter divide=20;
    always@(posedge I_CLK)
    begin
        if(Rst)
        begin
            O_CLK<=0;
            cnt<=0;
        end
        else if(cnt==divide/2-1)
        begin
            O_CLK<=~O_CLK;
            cnt<=0;
        end
        else cnt<=cnt+1;
    end
endmodule

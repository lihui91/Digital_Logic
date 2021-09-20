`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 08:24:10
// Design Name: 
// Module Name: RGB
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

module RGB(
    input wire system_clk,
    input wire [5:0] indata,
    output reg r,
    output reg b
    );
    wire sim_clk;
    parameter cycle=100000;
    /////ÐÞ¸Ä
    parameter down_limit=15;
    parameter up_limit=25;
    reg [16:0] cnt=0;
    reg [16:0] up=0;
    always@(indata)begin
        up<=(indata-down_limit)*(cycle/(up_limit-down_limit));
    end
    always@(posedge system_clk)begin
        if(cnt==cycle-1)begin
            cnt<=0;
        end
        else begin
            cnt<=cnt+1;
        end
    end
    //r
    always@(posedge system_clk)begin
    if(cnt<up/4)begin
        r<=1;
    end
    else begin
        r<=0;
    end
    end
    //b
    always@(posedge system_clk)begin
    if(cnt<(cycle-up)/4)begin
        b<=1;
    end
    else begin
        b<=0;
    end
    end
endmodule

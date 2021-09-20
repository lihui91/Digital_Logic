`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/28 20:14:51
// Design Name: 
// Module Name: JK_FF
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


module JK_FF(
    input CLK,
    input J,
    input K,
    input RST_n,
    output reg Q1,
    output reg Q2
    );
    always@(posedge CLK or negedge RST_n)
    begin
    if(!RST_n)
    begin
    Q1<=0;
    Q2<=1;
    end
    else
    begin
    if(J==0&&K==0)
    begin
    Q1<=Q1;
    Q2<=Q2;
    end
    else if(J==1&&K==1)
    begin
    Q1<=Q2;
    Q2<=Q1;
    end
    else
    begin
    Q1<=J;
    Q2<=K;
    end
    end
    end
endmodule

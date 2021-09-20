`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/28 18:13:33
// Design Name: 
// Module Name: Synchronous_D_FF
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


module Synchronous_D_FF(
    input CLK,
    input D,
    input RST_n,
    output reg Q1,//Q
    output reg Q2//Q非
    );
    always@(posedge CLK)//上升沿有效
    begin
    if(RST_n==0)
    begin
    Q1=0;
    Q2=1;
    end
    else
    begin
    Q1=D;
    Q2=~D;
    end
    end
endmodule

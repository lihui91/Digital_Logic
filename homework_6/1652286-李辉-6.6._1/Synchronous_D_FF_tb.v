`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/28 18:28:29
// Design Name: 
// Module Name: Synchronous_D_FF_tb
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


module Synchronous_D_FF_tb;
reg CLK;
reg D;
reg RST_n;
wire Q1;
wire Q2;
Synchronous_D_FF uut(.CLK(CLK),.D(D),.RST_n(RST_n),.Q1(Q1),.Q2(Q2));
always //产生时钟
begin
    #10
    CLK=~CLK;
end   

always //产生波形
begin
    #20
    D=~D;
end   

initial
begin
    CLK=0; 
    D=0;
    RST_n=1;
    #95
    RST_n=0;
    #20
    RST_n=1;
end
endmodule

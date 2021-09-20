`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/28 19:56:36
// Design Name: 
// Module Name: Asynchronous_D_FF_tb
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


module Asynchronous_D_FF_tb;
reg CLK;
reg D;
reg RST_n;
wire Q1;
wire Q2;
Asynchronous_D_FF uut(.CLK(CLK),.D(D),.RST_n(RST_n),.Q1(Q1),.Q2(Q2));
initial
begin
CLK=0;
D=1;
#75 D=0;
#100 D=1;
end
initial
begin
RST_n=1;
#275 RST_n=0;
#50 RST_n=1;
end

always 
#50 CLK=~CLK;
endmodule

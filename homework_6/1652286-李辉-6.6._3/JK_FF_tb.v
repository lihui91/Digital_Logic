`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/28 20:25:49
// Design Name: 
// Module Name: JK_FF_tb
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


module JK_FF_tb;
reg CLK;
reg J;
reg K;
reg RST_n;
wire Q1;
wire Q2;
JK_FF uut(
.CLK(CLK),
.J(J),
.K(K),
.RST_n(RST_n),
.Q1(Q1),
.Q2(Q2)
);
initial
begin
RST_n=0;
CLK=1;
#10 RST_n=1;
#75 RST_n=0;
#10 RST_n=1;
end
initial
begin
J=0;
#30 J=1;
#100 J=0;
#90  J=1;
end
initial
begin
K=1;
#50 K=0;
#60 K=1;
#60 K=0;
end
always #10 CLK=~CLK;
endmodule

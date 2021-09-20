`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/07 19:14:41
// Design Name: 
// Module Name: Counter8_tb
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


module Counter8_tb();
reg CLK;
reg rst_n;
wire [2:0] oQ;
wire [6:0] oDisplay;
Counter8 uut(
.CLK(CLK),
.rst_n(rst_n),
.oQ(oQ),
.oDisplay(oDisplay)
);
initial 
begin
rst_n=0;
#10
rst_n=1;
CLK=0;
#1000
$finish;
end
always #10 CLK=~CLK;

endmodule

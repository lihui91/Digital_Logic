`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/04 15:42:00
// Design Name: 
// Module Name: Divider_tb
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


module Divider_tb;
reg I_CLK;
reg rst;
wire O_CLK;
initial begin
I_CLK=0;
rst=1;
#4 rst=0;
end
always begin
 #2 I_CLK=~I_CLK;
 end
Divider div(.I_CLK(I_CLK),.rst(rst),.O_CLK(O_CLK));
endmodule

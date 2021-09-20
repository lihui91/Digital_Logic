`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/21 22:32:52
// Design Name: 
// Module Name: FA_tb
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


module FA_tb();
reg a;
reg b;
reg c;
wire s;
wire out;
FA uut(.iA(a),.iB(b),.iC(c),.oS(s),.oC(out));
initial
begin
a=0;b=0;c=0;
#10
a=0;b=0;c=1;
#10
a=0;b=1;c=0;
#10
a=0;b=1;c=1;
#10
a=1;b=0;c=0;
#10
a=1;b=0;c=1;
#10
a=1;b=1;c=0;
#10
a=1;b=1;c=1;
end
endmodule

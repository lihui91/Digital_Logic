`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/16 18:34:55
// Design Name: 
// Module Name: extend_tb
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


module extend_tb;
reg [15:0] a;
reg sext;
wire [31:0] b;
//Instantiate the Unit Under Test(UUT)
extend uut(.a(a),.sext(sext),.b(b));
initial 
begin 
//initialize inputs
a=0;
sext=0;
//wait 100 ns for global reset to finish
#100
//add stimulus here
sext=1;
a=16'h0000;
#100;
sext=0;
a=16'h8000;
#100;
sext=1;
a=16'h8000;
#100
sext=0;
a=16'hffff;
#100;
sext=1;
a=16'hffff;
#100;
end
endmodule
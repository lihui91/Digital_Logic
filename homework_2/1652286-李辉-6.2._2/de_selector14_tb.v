`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/25 19:44:32
// Design Name: 
// Module Name: de_selector14_tb
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


module de_selector14_tb;
reg iC;
reg iS0;
reg iS1;
wire oZ0;
wire oZ1;
wire oZ2;
wire oZ3;

de_selector14 uut(
.iC(iC),
.iS0(iS0),
.iS1(iS1),
.oZ0(oZ0),
.oZ1(oZ1),
.oZ2(oZ2),
.oZ3(oZ3)
);
initial
begin
iC=0;
#100 iC=0;
#100 iC=1;
#100 iC=0;
#100 iC=1;
end

initial
begin
iS0=0;
#100 iS0=0;
#100 iS0=1;
#100 iS0=0;
#100 iS0=1;
end

initial 
begin
iS1=0;
#100 iS1=0;
#100 iS1=0;
#100 iS1=1;
#100 iS1=1;
end
endmodule

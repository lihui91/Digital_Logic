`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/22 08:18:31
// Design Name: 
// Module Name: Adder_tb
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


module Adder_tb();
reg iC;
reg [7:0] iData_a;
reg [7:0] iData_b;
wire [8:0] oData;
wire oData_C;

Adder uut(.iC(iC),
.iData_a(iData_a),
.iData_b(iData_b),
.oData(oData),
.oData_C(oData_C));
initial
begin
#50
iC=0;
 iData_a=8'b00000001; 
 iData_b=8'b00000001; 
 #50 
 iC=0; 
 iData_a=8'b11111111; 
 iData_b=8'b11111111; 
 #50 
 iC=0; 
 iData_a=8'b10001001; 
 iData_b=8'b10001101; 
 #50 
 iC=0; 
 iData_a=8'b00000001; 
 iData_b=8'b00000001; 
 #50 
 iC=1; 
 iData_a=8'b00000001; 
 iData_b=8'b00000001;
 #50 
 iC=1; 
 iData_a=8'b10000001; 
 iData_b=8'b00000001; 
 #50 
 iC=1; 
 iData_a=8'b10000001; 
 iData_b=8'b00000011; 
 #50 iC=1; 
 iData_a=8'b10000011; 
 iData_b=8'b00000001; 
 #50 iC=1; 
 iData_a=8'b00000001; 
 iData_b=8'b10000011; 
 #50 
 iC=1; 
 iData_a=8'b00000011; 
 iData_b=8'b10000001; 
 #50 
 iC=1; 
 iData_a=8'b10000011; 
 iData_b=8'b10000001; 
 #50 iC=1; 
 iData_a=8'b11111111; 
 iData_b=8'b11111111;
end
endmodule

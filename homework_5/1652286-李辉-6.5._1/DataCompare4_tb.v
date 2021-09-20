`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/21 19:36:50
// Design Name: 
// Module Name: DataCompare4_tb
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


module DataCompare4_tb();
reg [3:0] iData_a;
reg [3:0] iData_b;
reg [2:0] iData;
wire [2:0] oData;
DataCompare4 uut(.iData_a(iData_a),.iData_b(iData_b),.iData(iData),.oData(oData));
initial
begin
#50
iData_a=4'b1010;
iData_b=4'b0110;
iData=3'b010;
#50
iData_a=4'b0010;
iData_b=4'b1110;
iData=3'b010;
#50
iData_a=4'b1010;
iData_b=4'b1110;
iData=3'b010;
#50
iData_a=4'b1110;
iData_b=4'b1010;
iData=3'b010;
#50
iData_a=4'b1100;
iData_b=4'b1110;
iData=3'b010;
#50
iData_a=4'b1110;
iData_b=4'b1101;
iData=3'b010;
#50
iData_a=4'b1100;
iData_b=4'b1101;
iData=3'b010;
#50
iData_a=4'b1101;
iData_b=4'b1100;
iData=3'b010;
#50
iData_a=4'b1101;
iData_b=4'b1101;
iData=3'b100;
#50
iData_a=4'b1101;
iData_b=4'b1101;
iData=3'b010;
#50
iData_a=4'b1101;
iData_b=4'b1101;
iData=3'b001;
#50
iData_a=4'b1101;
iData_b=4'b1101;
iData=3'b101;
end
endmodule

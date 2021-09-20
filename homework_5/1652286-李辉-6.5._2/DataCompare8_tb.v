`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/21 20:34:16
// Design Name: 
// Module Name: DataCompare8_tb
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


module DataCompare8_tb();
reg [7:0] iData_a;
reg [7:0] iData_b;
wire [2:0] oData;
DataCompare8 uut(.iData_a(iData_a),.iData_b(iData_b),.oData(oData));
initial
begin
#50
iData_a=8'b10101011;
iData_b=8'b01111101;
#50
iData_a=8'b00101011;
iData_b=8'b11111101;
#50
iData_a=8'b10101011;
iData_b=8'b11111101;
#50
iData_a=8'b11101011;
iData_b=8'b10111101;
#50
iData_a=8'b10101011;
iData_b=8'b10011101;
#50
iData_a=8'b10001011;
iData_b=8'b10111101;
#50
iData_a=8'b10101011;
iData_b=8'b10111101;
#50
iData_a=8'b10111011;
iData_b=8'b10101101;
#50
iData_a=8'b10110011;
iData_b=8'b10111101;
#50
iData_a=8'b10111011;
iData_b=8'b10110101;
#50
iData_a=8'b10110011;
iData_b=8'b10110101;
#50
iData_a=8'b10110111;
iData_b=8'b10110001;
#50
iData_a=8'b10110111;
iData_b=8'b10110101;
#50
iData_a=8'b10110101;
iData_b=8'b10110111;
#50
iData_a=8'b10110100;
iData_b=8'b10110101;
#50
iData_a=8'b10110101;
iData_b=8'b10110100;
end
endmodule

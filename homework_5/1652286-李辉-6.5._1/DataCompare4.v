`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/21 19:18:20
// Design Name: 
// Module Name: DataCompare4
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


module DataCompare4(
    input [3:0] iData_a,
    input [3:0] iData_b,
    input [2:0] iData,
    output reg[2:0] oData
    );
    always @(*)
    if(iData_a>iData_b)
    oData=3'b100;
    else if(iData_a<iData_b)
    oData=3'b001;
    else if(iData_a==iData_b)
    begin
    if(iData==3'b100)
    oData=3'b100;
    else if(iData==3'b010)
    oData=3'b010;
    else if(iData==3'b001)
    oData=3'b001;
    else
    oData=3'b000;
    end
endmodule

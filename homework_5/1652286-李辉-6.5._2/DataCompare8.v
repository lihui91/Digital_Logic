`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/21 20:09:25
// Design Name: 
// Module Name: DataCompare8
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


module DataCompare8(
    input [7:0] iData_a,
    input [7:0] iData_b,
    output [2:0] oData
    );
    wire [2:0]fff;
    DataCompare8_low ddd(.iData_a(iData_a[3:0]),.iData_b(iData_b[3:0]),.oData(fff));
    DataCompare8_high ggg(.iData_a(iData_a[7:4]),.iData_b(iData_b[7:4]),.iData(fff),.oData(oData));
    endmodule
    
    module DataCompare8_low(
        input [3:0] iData_a,
        input [3:0] iData_b,
        output reg[2:0] oData
        );
        always @(*)
            if(iData_a>iData_b)
            oData=3'b100;
            else if(iData_a<iData_b)
            oData=3'b001;
            else if(iData_a==iData_b)     
            oData=3'b010;
        endmodule
        
    module DataCompare8_high(
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

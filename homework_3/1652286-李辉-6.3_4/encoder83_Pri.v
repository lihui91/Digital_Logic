`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/04 18:19:19
// Design Name: 
// Module Name: encoder83_Pri
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


module encoder83_Pri(
    input [7:0] iData,
    input iEI,
    output reg [2:0] oData,
    output oEO
    );
    assign oEO=~iEI;
    always @(*)
    if(iEI==0&&iData==8'b11111111)
    oData=3'b111;
    else if(iEI==0&&iData[7]==0)
    oData=3'b000;
    else if(iEI==0&&iData[7]==1&&iData[6]==0)
    oData=3'b001;
    else if(iEI==0&&iData[7]==1&&iData[6]==1&&iData[5]==0)
    oData=3'b010;
    else if(iEI==0&&iData[7]==1&&iData[6]==1&&iData[5]==1&&iData[4]==0)
    oData=3'b011;
    else if(iEI==0&&iData[7]==1&&iData[6]==1&&iData[5]==1&&iData[4]==1&&iData[3]==0)
    oData=3'b100;
    else if(iEI==0&&iData[7]==1&&iData[6]==1&&iData[5]==1&&iData[4]==1&&iData[3]==1&&iData[2]==0)
    oData=3'b101;
    else if(iEI==0&&iData[7]==1&&iData[6]==1&&iData[5]==1&&iData[4]==1&&iData[3]==1&&iData[2]==1&&iData[1]==0)
    oData=3'b110;
    else if(iEI==0&&iData[7]==1&&iData[6]==1&&iData[5]==1&&iData[4]==1&&iData[3]==1&&iData[2]==1&&iData[1]==1&&iData[0]==0)
    oData=3'b111;
    else
    oData=3'b111;
endmodule

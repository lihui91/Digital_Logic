`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/13 16:03:15
// Design Name: 
// Module Name: display7
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


module display7(
    input [3:0] iData,
    output [6:0] oData
    );
    assign oData[6]=iData[3]&iData[2]|iData[3]&iData[1]|(~iData[3])&(~iData[2])&(~iData[1])|(~iData[3])&iData[2]&iData[1]&iData[0];
    assign oData[5]=iData[3]&iData[2]|iData[3]&iData[1]|iData[1]&iData[0]|(~iData[3])&(~iData[2])&iData[0]|(~iData[3])&(~iData[2])&iData[1];
    assign oData[4]=iData[3]&iData[2]|iData[3]&iData[1]|(~iData[3])&iData[0]|(~iData[3])&iData[2]&(~iData[1])|iData[3]&(~iData[2])&(~iData[1])&iData[0];
    assign oData[3]=iData[3]&iData[2]|iData[3]&iData[1]|(~iData[3])&(~iData[2])&(~iData[1])&iData[0]|iData[2]&(~iData[1])&(~iData[0])|iData[2]&iData[1]&iData[0];
    assign oData[2]=iData[3]&iData[2]|iData[3]&iData[1]|(~iData[3])&(~iData[2])&iData[1]&(~iData[0]);
    assign oData[1]=iData[3]&iData[2]|iData[3]&iData[1]|iData[2]&(~iData[1])&iData[0]|iData[2]&iData[1]&(~iData[0]);
    assign oData[0]=iData[3]&iData[2]|iData[3]&iData[1]|iData[2]&(~iData[1])&(~iData[0])|(~iData[3])&(~iData[2])&(~iData[1])&iData[0];
endmodule
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/04 11:06:36
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [2:0] iData,
    input [1:0] iEna,
    output  reg [7:0] oData
    );
    always @(*)
    case(iEna)
    2'b01:
    case(iData)
    3'b000:oData=8'b11111110;
    3'b001:oData=8'b11111101;
    3'b010:oData=8'b11111011;
    3'b011:oData=8'b11110111;
    3'b100:oData=8'b11101111;
    3'b101:oData=8'b11011111;
    3'b110:oData=8'b10111111;
    3'b111:oData=8'b01111111;
    endcase
    default:oData=8'b11111111;
    endcase
endmodule

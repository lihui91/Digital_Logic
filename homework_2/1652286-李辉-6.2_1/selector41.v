`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/25 16:29:47
// Design Name: 
// Module Name: selector41
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


module selector41(
   input iS1,
   input iS0,
   input [3:0] iC0,
   input [3:0] iC1,
   input [3:0] iC2,
   input [3:0] iC3,
   output [3:0] oZ
    );
    assign oZ=iS0?(iS1?iC3:iC1):(iS1?iC2:iC0);
endmodule

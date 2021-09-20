`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/25 16:36:17
// Design Name: 
// Module Name: selector41_tb
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


module selector41_tb;
   reg iS0;
   reg iS1;
   reg [3:0] iC0;
   reg [3:0] iC1;
   reg [3:0] iC2;
   reg [3:0] iC3;
   wire [3:0] oZ;
 selector41  uut(
      .iS1(iS1),
      .iS0(iS0),
      .iC0(iC0),
      .iC1(iC1),
      .iC2(iC2),
      .iC3(iC3),
      .oZ(oZ)
      );
      
      initial
      begin
      iC0=4'b0001;
      iC1=4'b0010;
      iC2=4'b1100;
      iC3=4'b0101;
      end
      
      initial
      begin
      iS0=0;
      #100  iS0=0;
      #100  iS0=1;
      #100  iS0=0;
      #100  iS0=1;
      end
      
      initial
      begin
      iS1=0;
      #100  iS1=0;
      #100  iS1=0;
      #100  iS1=1;
      #100  iS1=1;
      end
endmodule

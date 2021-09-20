`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/07 19:13:47
// Design Name: 
// Module Name: Counter8
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

module Counter8(
    input CLK,            
    input rst_n,          
    output [2:0] oQ,
    output [6:0] oDisplay 
    );
    reg rst;
    wire clk;
    wire [3:0] oq;
    assign oq[3]=0;
    assign oq[2:0]=oQ[2:0];
    //defparam div.N=100000000;
    
   initial begin
       rst=1;
      #1 rst=0;
   end
   Divider div(
   .I_CLK(CLK),.Rst(rst),.O_CLK(clk)
   );
    
    JK_FF FF0(
    .CLK(clk),.J(1),.K(1),.RST_n(rst_n),.Q1(oQ[0]),.Q2()
    );
    JK_FF FF1(
    .CLK(clk),.J(oQ[0]),.K(oQ[0]),.RST_n(rst_n),.Q1(oQ[1]),.Q2()
    );
    JK_FF FF2(
    .CLK(clk),.J(oQ[0]&&oQ[1]),.K(oQ[0]&&oQ[1]),.RST_n(rst_n),.Q1(oQ[2]),.Q2()
    );
    
    display7 disp(
    .iData(oq),.oData(oDisplay)
    );
endmodule
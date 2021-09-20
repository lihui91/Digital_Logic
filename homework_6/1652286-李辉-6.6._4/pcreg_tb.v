`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/28 22:47:03
// Design Name: 
// Module Name: pcreg_tb
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


module pcreg_tb;

reg clk;    
reg rst;  
reg ena;  
reg [31:0] data_in; 
wire [31:0] data_out;

pcreg pp(clk,rst,ena,data_in,data_out);

always //产生时钟
begin
    #10
    clk=~clk;
end   

always //产生波形
begin
    #15
    data_in=data_in+1;
end   

initial
begin
    clk=0; 
    data_in=0;
    rst=0;
    
    ena=1;//高电平读入
    #100
    ena=0;//低电平保持
    #100  
    ena=1;   
    rst=1;//rst无论ena怎样都清0
    #10
    ena=0;//rst无论ena怎样都清0
    #13
    ena=1;
    rst=0;//下一个时钟复原
end
endmodule

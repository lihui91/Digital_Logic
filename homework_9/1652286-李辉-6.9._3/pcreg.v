`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/28 21:25:13
// Design Name: 
// Module Name: pcreg
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
module pcreg(
    input clk,   //1位输入，寄存器时钟信号，上升沿时为PC寄存器赋值 
    input rst,   //1位输入，异步重置信号，高电平时将PC寄存器清零 //注：当ena信号无效时，rst也可以重置寄存器 
    input ena,   //1位输入,有效信号高电平时PC寄存器读入data_in //的值，否则保持原有输出 
    input [31:0] data_in, //32位输入，输入数据将被存入寄存器内部 
    output [31:0] data_out   //32位输出，工作时始终输出 PC  //寄存器内部存储的值 
    );
    wire Q2;
    generate
       genvar i;    
       for(i=0;i<32;i=i+1)//允许产生module和primitive的多个实例化
       begin:thirty_two
          Asynchronous_D_FF every(clk&ena,data_in[i],~rst,data_out[i],Q2);
       end
    endgenerate
endmodule

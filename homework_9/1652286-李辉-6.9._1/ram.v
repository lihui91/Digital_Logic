`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/18 20:21:41
// Design Name: 
// Module Name: ram
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


module ram(
    input clk,//存储器时钟信号，上升沿时向ram内部写入数据
    input ena,//存储器有效信号，高电平时存储器才能运行，否则输出z
    input wena,//存储器读写有效信号，高电平时为写有效，低电平时为读有效
               //与ena同时有效时才能对存储器进行读写
    input [4:0] addr,//输入地址，指定数据读写的地址
    input [31:0] data_in,//存储器写入的数据，在clk上升沿时被写入
    output [31:0] data_out//存储器读出的数据
    );
    reg [31:0] out;
    reg [31:0]mem[31:0];//存储器1024bit
    always@(*)
    begin
    if(~ena)//ena=0
    out={32{1'bz}};
    else if(~wena)//wena=0，只读
         out=mem[addr];
    end
    always@(posedge clk)
    begin
    if(wena==1&&ena==1)
    mem[addr]=data_in;
    end   
    assign data_out=out;  
endmodule

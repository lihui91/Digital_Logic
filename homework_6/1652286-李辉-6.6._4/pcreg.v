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

module Asynchronous_D_FF(
    input CLK,
    input D,
    input RST_n,
    output reg Q1,
    output reg Q2
    );
    always@(posedge CLK or negedge RST_n)
    begin
    if(RST_n==0)
    begin
    Q1=0;
    Q2=1;
    end
    else
    begin
    Q1=D;
    Q2=~D;
    end
    end
endmodule

module pcreg(
    input clk,   //1λ���룬�Ĵ���ʱ���źţ�������ʱΪPC�Ĵ�����ֵ 
    input rst,   //1λ���룬�첽�����źţ��ߵ�ƽʱ��PC�Ĵ������� //ע����ena�ź���Чʱ��rstҲ�������üĴ��� 
    input ena,   //1λ����,��Ч�źŸߵ�ƽʱPC�Ĵ�������data_in //��ֵ�����򱣳�ԭ����� 
    input [31:0] data_in, //32λ���룬�������ݽ�������Ĵ����ڲ� 
    output [31:0] data_out   //32λ���������ʱʼ����� PC  //�Ĵ����ڲ��洢��ֵ 
    );
    wire Q2;
    genvar i;    
    for(i=0;i<32;i=i+1)//�������module��primitive�Ķ��ʵ����
        Asynchronous_D_FF every(clk&ena,data_in[i],~rst,data_out[i],Q2);
endmodule

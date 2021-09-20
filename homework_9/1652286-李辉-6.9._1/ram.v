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
    input clk,//�洢��ʱ���źţ�������ʱ��ram�ڲ�д������
    input ena,//�洢����Ч�źţ��ߵ�ƽʱ�洢���������У��������z
    input wena,//�洢����д��Ч�źţ��ߵ�ƽʱΪд��Ч���͵�ƽʱΪ����Ч
               //��enaͬʱ��Чʱ���ܶԴ洢�����ж�д
    input [4:0] addr,//�����ַ��ָ�����ݶ�д�ĵ�ַ
    input [31:0] data_in,//�洢��д������ݣ���clk������ʱ��д��
    output [31:0] data_out//�洢������������
    );
    reg [31:0] out;
    reg [31:0]mem[31:0];//�洢��1024bit
    always@(*)
    begin
    if(~ena)//ena=0
    out={32{1'bz}};
    else if(~wena)//wena=0��ֻ��
         out=mem[addr];
    end
    always@(posedge clk)
    begin
    if(wena==1&&ena==1)
    mem[addr]=data_in;
    end   
    assign data_out=out;  
endmodule

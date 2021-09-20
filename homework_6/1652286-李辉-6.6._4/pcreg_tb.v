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

always //����ʱ��
begin
    #10
    clk=~clk;
end   

always //��������
begin
    #15
    data_in=data_in+1;
end   

initial
begin
    clk=0; 
    data_in=0;
    rst=0;
    
    ena=1;//�ߵ�ƽ����
    #100
    ena=0;//�͵�ƽ����
    #100  
    ena=1;   
    rst=1;//rst����ena��������0
    #10
    ena=0;//rst����ena��������0
    #13
    ena=1;
    rst=0;//��һ��ʱ�Ӹ�ԭ
end
endmodule

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/19 08:47:11
// Design Name: 
// Module Name: ram_tb
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


module ram_tb();
reg clk;
reg ena;
reg wena;
reg [4:0]addr;
reg [31:0]data_in;
wire [31:0]data_out;
ram uut(clk,ena,wena,addr,data_in,data_out);

always
begin
#5 clk=~clk;
end

integer i;
initial
begin
clk=0;
ena=1;
wena=0;//������
addr=0;//��0��ʼȡ
for(i=0;i<=31;i=i+1)
begin
#6 addr=addr+1;
end

wena=1;//д����
addr=0;
data_in={32{1'b1}};

#60
for(i=0;i<=31;i=i+1)
begin
#6
data_in=data_in-1;
addr=addr+1;
end
//�����д��ȥ�Ķ�����
#6
wena=0;
addr=0;
for(i=0;i<=31;i=i+1)
begin
#6
addr=addr+1;//�������data_out
end
//�������ena����
#6
ena=0;
#100 ena=1;
end

endmodule

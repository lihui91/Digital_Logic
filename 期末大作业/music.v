`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 08:22:16
// Design Name: 
// Module Name: music
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


module div_(
input I_CLK,//����ʱ��
input[31:0] n0,//��Ƶ����
input rst,//��λ
output clk_out//��Ƶ���ʱ��
);
reg mid_O_CLK;
assign clk_out=mid_O_CLK;
reg[31:0] counter;

wire [31:0]n;
assign n=(n0>>1);//����

initial
begin
    mid_O_CLK=0;//����һ����ֵ0
    counter=32'b0;
end

always@(posedge I_CLK or posedge rst)//�첽��λ
begin
    if(rst==1)
    begin
        mid_O_CLK=0;//��λ
        counter=0;//�������
     end
     else if(n!=32'b0)
     begin
        if(counter>=n)
        begin
           mid_O_CLK=~mid_O_CLK;//��ת
           counter=32'b0;//�������
        end
        counter=counter+1;
      end
end
endmodule


module music(//ѭ���������� :ʥ����
input clk_100,//100mhz
input Rst,
output wave,//��������Ƶ��
output d12//����
);
wire [2:0] data_note;
wire clk_single;//��ȡ������ʱ��
reg [7:0] number_now;//��ǰ���ŵ��������
reg [31:0] n;//��Ƶϵ��,����
parameter num=8'd184;//�����ĸ���

parameter n_single=32'd25000000;//0;//���������������ŵ�ʱ���ʱ�ӷ�Ƶ���� ��������1/4�� 1��1s��
//�����ܳ��� ����reg
div_ d_signle(clk_100,n_single,Rst,clk_single);//��������������ʱ��
christmas christmas_(.clka(clk_100),.addra(number_now),.douta(data_note));//��ȡ����
wire mid_wave;
reg rst;
div_ d_note(clk_100,n,Rst,mid_wave);

initial
begin
    rst<=1'b0;
    number_now<=8'b0;
end

always @(negedge clk_100)
if(rst==1)
    rst<=0;
    
assign wave=(n!=32'd0)?mid_wave:16'b0;

always@(posedge clk_single)//��ȡ������
begin
    if(number_now==num-1)
        number_now<=8'b0;
    else
        number_now<=number_now+1;
end

//�����Ƿ�Ƶ����
always@(data_note)
begin
    case(data_note)
        3'd0:n<=32'd0;
        3'd1:n<=32'd191095;
        3'd2:n<=32'd170270;
        3'd3:n<=32'd151676;
        3'd4:n<=32'd143163;
        3'd5:n<=32'd127551;
        3'd6:n<=32'd113636;
        3'd7:n<=32'd101235;
    endcase
    rst<=1;
end
assign d12=1'b1;
endmodule

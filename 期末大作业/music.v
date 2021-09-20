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
input I_CLK,//输入时钟
input[31:0] n0,//分频倍数
input rst,//复位
output clk_out//分频后的时钟
);
reg mid_O_CLK;
assign clk_out=mid_O_CLK;
reg[31:0] counter;

wire [31:0]n;
assign n=(n0>>1);//二分

initial
begin
    mid_O_CLK=0;//赋予一个初值0
    counter=32'b0;
end

always@(posedge I_CLK or posedge rst)//异步复位
begin
    if(rst==1)
    begin
        mid_O_CLK=0;//复位
        counter=0;//清零计数
     end
     else if(n!=32'b0)
     begin
        if(counter>=n)
        begin
           mid_O_CLK=~mid_O_CLK;//反转
           counter=32'b0;//清零计数
        end
        counter=counter+1;
      end
end
endmodule


module music(//循环播放音乐 :圣诞歌
input clk_100,//100mhz
input Rst,
output wave,//蜂鸣器的频率
output d12//拉高
);
wire [2:0] data_note;
wire clk_single;//读取音符的时钟
reg [7:0] number_now;//当前播放的音符序号
reg [31:0] n;//分频系数,生成
parameter num=8'd184;//音符的个数

parameter n_single=32'd25000000;//0;//单个音符持续播放的时间的时钟分频参数 单个音符1/4拍 1拍1s？
//↑可能出错 不是reg
div_ d_signle(clk_100,n_single,Rst,clk_single);//单个音符持续的时间
christmas christmas_(.clka(clk_100),.addra(number_now),.douta(data_note));//获取音符
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

always@(posedge clk_single)//读取新音符
begin
    if(number_now==num-1)
        number_now<=8'b0;
    else
        number_now<=number_now+1;
end

//下面是分频常数
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

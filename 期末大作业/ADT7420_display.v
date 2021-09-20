`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 08:16:59
// Design Name: 
// Module Name: ADT7420_display
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


module ADT7420_display(
    input wire system_clk,
    inout wire ADT7420_SDA,
    output wire ADT7420_SCL,
    output wire [15:0] adt_tem,//采样得到的16位温度
    output reg [7:0] seg,//输出到数码管的段选信号
    output reg [7:0] an,//输出到数码管的位选信号
    output wire [15:0] light//采集的数据输出到LED
    );
    wire [15:0] temperature;
    assign adt_tem=temperature;
    wire finish_flag;
    reg [5:0] led_display=6'd10;
    ADT7420 right(.system_clk(system_clk),.SCL(ADT7420_SCL),.SDA(ADT7420_SDA),.data(temperature),.finish_flag(finish_flag));
    wire virtual_clock; 
    
    Breath breath(.system_clk(system_clk),.light(light));
    
    Divider #(20000)div(.I_CLK(system_clk),.Rst(0),.O_CLK(virtual_clock));
    wire [7:0] segment [0:9];
    assign segment[0]=8'hc0;
    assign segment[1]=8'hf9;
    assign segment[2]=8'ha4;
    assign segment[3]=8'hb0;
    assign segment[4]=8'h99;
    assign segment[5]=8'h92;
    assign segment[6]=8'h82;
    assign segment[7]=8'hf8;
    assign segment[8]=8'h80;
    assign segment[9]=8'h90;
    integer result=0;
    always@(posedge system_clk)begin
        result<=temperature;
        result=(result>>3)*625;
        led_display=result/10000;
        case (an)//位选信号，哪个数字
        8'b11111110:seg<=8'hc6;//最后一个
        8'b11111101:seg<=8'h9c;//倒数第二个
        8'b11111011:seg<=segment[(result/10)%10];
        8'b11110111:seg<=segment[(result/100)%10];
        8'b11101111:seg<=segment[(result/1000)%10];
        8'b11011111:begin
            seg[6:0]<=segment[(result/10000)%10][6:0];
            seg[7]=0;
        end
        8'b10111111:seg<=segment[(result/100000)%10];
        8'b01111111:begin//第一个
            if(result>=0) seg<=segment[(result/1000000)%10];
            else seg<=8'hbf;
        end
        default:seg<=8'h00;//初始态
        endcase
    end
    always@(posedge virtual_clock)begin
        an<=(an<<1)+1;
        if(an==8'hff) an<=8'hfe;
    end    
    //////////////////////在此条
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 08:19:05
// Design Name: 
// Module Name: Breath
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


module Breath(
    input wire system_clk,
    output wire [15:0] light
    );
    wire rst_n;
    assign rst_n=1;
    reg [6:0] cnt1=0;
    reg [9:0] cnt2=0;
    reg [9:0] cnt3=0;
    wire delay_1us;
    wire delay_1ms;
    wire delay_1s;
    //延时1us
        always @(posedge system_clk or negedge rst_n)
        begin
            if(!rst_n)
                cnt1 <= 6'b0;
            else if(cnt1 < 7'd100)
                cnt1 <= cnt1 + 1'b1;
            else 
                cnt1 <= 6'b0;
        end
        assign delay_1us = (cnt1 == 7'd99)?1'b1:1'b0;//100M/1000
    
        //延时1ms
        always @(posedge system_clk or negedge rst_n)
        begin
            if(!rst_n)
                cnt2 <= 10'b0;
            else if(delay_1us)
            begin
                if(cnt2 < 10'd999)    
                    cnt2 <= cnt2 + 1'b1;
                else 
                    cnt2 <= 10'b0;
            end
           end
           assign delay_1ms = ((delay_1us == 1'b1) && (cnt2 == 10'd999))?1'b1:1'b0;
    
           //延时1s
           always @(posedge system_clk or negedge rst_n)
        begin
            if(!rst_n)
                cnt3 <= 10'b0;
            else if(delay_1ms)
            begin
                 if(cnt3 < 10'd999)
                    cnt3 <= cnt3 + 1'b1;
                else 
                    cnt3 <= 10'b0;
             end
            
        end
        assign delay_1s = ((delay_1ms == 1'b1) && (cnt3 == 10'd999))?1'b1:1'b0;
        reg display_state=0;
        //state change
        always @(posedge system_clk or negedge rst_n)
        begin
            if(!rst_n)
                display_state <= 1'b0;
            else if(delay_1s)//每一秒切换一次led灯显示状态
                display_state <= ~display_state;
            else 
                display_state <= display_state;
        end
        reg pwm=0;
            //pwm信号的产生
        always @(posedge system_clk or negedge rst_n)
        begin
            if(!rst_n)
                    pwm <= 1'b0;
            else 
                case(display_state)
                    1'b0: pwm <= (cnt2 < cnt3)?1'b1:1'b0;
                    1'b1: pwm <= (cnt2 < cnt3)?1'b0:1'b1;
                    default: pwm <= pwm;
                endcase
        end
        assign light={15{pwm}};
endmodule

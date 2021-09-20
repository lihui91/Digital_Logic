`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 08:25:32
// Design Name: 
// Module Name: vga_driver
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


module vga_driver(//产生行时序，场时序
    input wire vga_clk,
    input wire rst_n,
    input [2:0] ena,//使能信号，切换图片
    output wire vsync,
    output wire hsync,
    output reg [3:0]  red,
    output reg [3:0]  green,
    output reg [3:0]  blue
    );
    parameter image_width =500,
               image_height=400,
               image_w=300,
               image_h=200,
               image_pix_num=60000;
    reg [15:0] Rom_addr;
    reg [15:0] Rom_addr1;
    reg [15:0] Rom_addr2;
    wire [11:0] Rom_data;
    wire [11:0] Rom_data1;
    wire [11:0] Rom_data2;
    reg [9:0] Count_H;
    always@(posedge vga_clk or negedge rst_n)begin//行时序
        if(!rst_n)begin
            Count_H<=10'd0;
        end
        else if(Count_H==10'd800-1'b1)begin
            Count_H<=10'd0;
        end
        else begin
            Count_H<=Count_H+1'b1;
        end
    end
    reg [9:0] Count_V;
    always@(posedge vga_clk or negedge rst_n)begin//场时序
        if(!rst_n)begin
            Count_V<=10'd0;
        end
        else if(Count_V==10'd525-1'b1)begin
            Count_V<=10'd0;
        end
        else if(Count_H==10'd800-1'b1)begin
            Count_V<=Count_V+1'b1;
        end
    end
    reg isReady;//产生有效区域标志
    always@(posedge vga_clk or negedge rst_n)begin
        if(!rst_n)begin
            isReady<=1'b0;
        end
        else if((Count_H>=10'd144&&Count_H<=10'd784)&&(Count_V>=10'd35&&Count_V<=10'd515))begin
            isReady<=1'b1;
        end
        else isReady<=1'b0;
    end
    
    //把rom的图片输出
    always@(posedge vga_clk,negedge rst_n)
    begin
         if(!rst_n)
         begin
           Rom_addr<=16'd0;//!
           Rom_addr1<=16'd0;
           Rom_addr2<=16'd0;
         end  
         else if(isReady)
             begin
               
                if((Count_H>=314)&&(Count_H<=314+image_w-1'b1)&&(Count_V>=175)&&(Count_V<=175+image_h-1'b1))
                begin
                 if(ena[0]&&~ena[1]&&~ena[2])//1 锦鲤
                               begin
                               red<=Rom_data[11:8];
                               green<=Rom_data[7:4];
                               blue<=Rom_data[3:0];
                               if(Rom_addr==image_pix_num-1'b1)
                                    Rom_addr<=16'd0;
                               else
                                    Rom_addr<=Rom_addr+1'b1;
                               end
               else  if(ena[0]&&ena[1]&&~ena[2])//2温度计
                begin
                red<=Rom_data1[11:8];
                green<=Rom_data1[7:4];
                blue<=Rom_data1[3:0];
                if(Rom_addr1==image_pix_num-1'b1)
                     Rom_addr1<=16'd0;
                else
                     Rom_addr1<=Rom_addr1+1'b1;
                end
                
                else if(ena[0]&&ena[1]&&ena[2])//3音乐
                               begin
                               red<=Rom_data2[11:8];
                               green<=Rom_data2[7:4];
                               blue<=Rom_data2[3:0];
                               if(Rom_addr2==image_pix_num+1-1'b1)//此处可以改进成动态效果，下次尝试一下加较小的数字
                                    Rom_addr2<=16'd0;
                               else
                                    Rom_addr2<=Rom_addr2+1'b1;
                               end     
                  else
                                           begin
                                                 red<=4'b1111;
                                                 green<=4'b1111;
                                                 blue<=4'b1111;
                                                 Rom_addr=Rom_addr;
                                                  Rom_addr1=Rom_addr1;
                                                  Rom_addr2<=Rom_addr2;
                                           end                                   
                end
                else if((Count_H>=144)&&(Count_H<214)&&(Count_V>=35)&&(Count_V<75+image_height-1'b1))//左
                begin
                red<=4'b1111;
                green<=4'b0000;
                blue<=4'b0000;
                end
                
                else if((Count_H>=214)&&(Count_H<=284+image_width-1'b1)&&(Count_V>=35)&&(Count_V<75))//上
                begin
                 red<=4'b0000;
                 green<=4'b1111;
                 blue<=4'b0000;
                end
                
                else if((Count_H>214+image_width-1'b1)&&(Count_H<=284+image_width-1'b1)&&(Count_V>=75)&&(Count_V<=115+image_height-1'b1))//右
                begin
                red<=4'b0000;
                green<=4'b0000;
                blue<=4'b1111;
                end
                
                else if((Count_H>=144)&&(Count_H<=214+image_width-1'b1)&&(Count_V>=75+image_height-1'b1)&&(Count_V<=115+image_height-1'b1))//下
                begin
                red<=4'b0000;
                green<=4'b1111;
                blue<=4'b0000;
                end    
                 else
                            begin
                                  red<=4'b1111;
                                  green<=4'b1111;
                                  blue<=4'b1111;
                                  Rom_addr=Rom_addr;
                                   Rom_addr1=Rom_addr1;
                                   Rom_addr2<=Rom_addr2;
                            end             
         end 
         else
             begin
                   red<=4'b1111;
                   green<=4'b1111;
                   blue<=4'b1111;
                   Rom_addr=Rom_addr;
                    Rom_addr1=Rom_addr1;
                    Rom_addr2<=Rom_addr2;
             end             
    end//图片   
    
     
    assign vsync=(Count_V<=10'd4)?1'b0:1'b1;
    assign hsync=(Count_H<=10'd128)?1'b0:1'b1;
    assign ready=isReady;
    Rom_image rom_image(
    .clka(vga_clk),
    .addra(Rom_addr),
    .ena(ena[0]),
    .douta(Rom_data)
    );
    
     Rom_image1 rom_image1(
       .clka(vga_clk),
       .addra(Rom_addr1),
       .ena(ena[1]),
       .douta(Rom_data1)
       );
     Rom_image2 rom_image2(
              .clka(vga_clk),
              .addra(Rom_addr2),
              .ena(ena[2]),
              .douta(Rom_data2)
              );
endmodule

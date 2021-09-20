`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 07:53:52
// Design Name: 
// Module Name: master
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


module Final_Design(
    input wire fpga_clk,//系统时钟
    //input wire mode,//温度开关->ena[1]
    input wire RST,
    //input rSt,//音乐复位信号->ena[2]
    input [2:0] Ena,
    output wire [15:0] light,
    output wire [7:0] seg,
    output wire [7:0] an,
    output music_master,
    output d12,
    inout wire ADT7420_SDA,
    output wire ADT7420_SCL,
    output wire VSYNC_Sig,
    output wire HSYNC_Sig,
    output wire [3:0] Red_Sig,
    output wire [3:0] Green_Sig,
    output wire [3:0] Blue_Sig
    );
    wire [7:0] Aseg;
    wire [7:0] Aan;
    wire [15:0] Alight;
    wire [7:0] Dseg;
    wire [7:0] Dan;
    wire [15:0] Dlight;
    wire [15:0] adt_tem;//温度
    wire MODE;
    Anti_shake mode_change(.clk_in(fpga_clk),.key_in(~Ena[1]),.key_out(MODE));
    ADT7420_display adt(.system_clk(fpga_clk),.ADT7420_SDA(ADT7420_SDA),
    .ADT7420_SCL(ADT7420_SCL),.seg(Aseg),.an(Aan),.light(Alight),
    .adt_tem(adt_tem));
    
    music mp3(.clk_100(fpga_clk),.Rst(~Ena[2]),.wave(music_master),.d12(d12));
    
    vga Vga(.system_clk(fpga_clk),.ena(Ena),.RST(RST),.VSYNC_Sig(VSYNC_Sig),
    .HSYNC_Sig(HSYNC_Sig),.Red_Sig(Red_Sig),.Green_Sig(Green_Sig),
    .Blue_Sig(Blue_Sig));
    assign light=MODE?Dlight:Alight;
    assign seg=MODE?Dseg:Aseg;
    assign an=MODE?Dan:Aan;
endmodule

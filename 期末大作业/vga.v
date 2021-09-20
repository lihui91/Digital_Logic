`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 08:28:08
// Design Name: 
// Module Name: vga
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


module vga(
    input wire system_clk,
    input wire RST,
    input [2:0] ena,
    output wire VSYNC_Sig,
    output wire HSYNC_Sig,
    output wire [3:0] Red_Sig,
    output wire [3:0] Green_Sig,
    output wire [3:0] Blue_Sig
    );
    vga40HZ fpq(.clk_in1(system_clk),.clk_out1(vga_clk));
    vga_driver driver(.vga_clk(vga_clk),.ena(ena),.rst_n(~RST),.vsync(VSYNC_Sig),
    .hsync(HSYNC_Sig),.red(Red_Sig),.green(Green_Sig),.blue(Blue_Sig));
endmodule

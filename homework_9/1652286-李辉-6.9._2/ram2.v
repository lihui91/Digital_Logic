`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/19 16:25:56
// Design Name: 
// Module Name: ram2
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


module ram2(
    input clk,
    input ena,
    input wena,
    input [4:0] addr,
    inout [31:0] data
    );
    reg [31:0] out;
    reg [31:0]mem[0:31];
    always@(posedge clk)
    begin
    if(ena&&wena)
    begin
    mem[addr]=data;
    end
    end
    always@(*)
    begin
    if(~ena)
    begin
    out=32'bz;
    end
    else
    begin
    if(~wena)
    begin
    out=mem[addr];
    end
    end
    end
    assign data=(wena==0)?out:{32{1'bz}};
endmodule

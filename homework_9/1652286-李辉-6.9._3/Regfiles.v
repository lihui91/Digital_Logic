`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/19 19:45:40
// Design Name: 
// Module Name: Regfiles
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


module Regfiles(
    input clk,
    input rst,
    input we,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [31:0] wdata,
    output [31:0] rdata1,
    output [31:0] rdata2
    );
    wire  [31:0]datA;
    wire  [1023:0]meM;
    reg [31:0]data;
    reg [1023:0]mem;
    always@(*)
    begin
    data=datA;
    mem=meM;    
    end
    decoder5_32 decoder(.iData(waddr),.iEna(we),.oData(datA));
    generate
         genvar i;
         for(i=0;i<32;i=i+1)
             begin:queues
             pcreg Reg(
            .clk(clk),.rst(rst),.ena(data[i]),.data_in(wdata),.data_out(meM[32*i+31:32*i])
             );
             end
    endgenerate 
    selector32_1  sel1(
    .ena(~we),.iS(raddr1),.iC(mem),.oZ(rdata1)
    );
    selector32_1  sel2(
    .ena(~we),.iS(raddr2),.iC(mem),.oZ(rdata2)
    );            
endmodule

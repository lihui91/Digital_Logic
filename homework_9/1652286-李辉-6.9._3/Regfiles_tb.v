`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/20 19:39:01
// Design Name: 
// Module Name: Regfiles_tb
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


module Regfiles_tb();
reg clk;
reg rst;
reg we;
reg [4:0] raddr1;
reg [4:0] raddr2;
reg [4:0]waddr;
reg [31:0]wdata;
wire [31:0]rdata1;
wire [31:0]rdata2;

Regfiles uut(
.clk(clk),.rst(rst),.we(we),.raddr1(raddr1),
.raddr2(raddr2),.waddr(waddr),.wdata(wdata),
.rdata1(rdata1),.rdata2(rdata2)
);
always
begin
#5 clk=~clk;
end
initial 
begin
clk=1;
raddr1=5'b00000;
raddr2=5'b11111;
rst=0;
//–¥≤‚ ‘
#6
we=1;
waddr=5'b11001;
wdata={{16{1'b1}},{8{1'b0}},{8{1'b1}}};
#10
waddr=5'b00111;
wdata={{8{1'b1}},{8{1'b0}},{8{1'b1}},{8{1'b0}}};
//∂¡≤‚ ‘

#28
we=0;
raddr1=5'b11001;
raddr2=5'b00111;
//rst≤‚ ‘
#12
rst=1;
raddr1=5'b11001;
raddr2=5'b00111;
end
endmodule

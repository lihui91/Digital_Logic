`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/25 16:29:47
// Design Name: 
// Module Name: selector41
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


module selector32_1(//32选一（32位宽）
   input ena,//使能端，高电平有效
   input [4:0] iS,//选择信号
   input [1023:0] iC,//输入信号1024位
   output reg [31:0] oZ//选择输出的信号
    );
   integer i,j;
   always@(*)
   begin
   if(ena==0)
   oZ=32'bx;
   else
       begin
       i=iS*32;
       j=0;
       while(j<=31)
             begin
             oZ[j]=iC[i];
             i=i+1;
             j=j+1;
             end
       end
   end
endmodule

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/11 19:50:16
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] a,//32位输入，操作数1
    input [31:0] b,//32位数，操作数2
    input [3:0] aluc,//4位输入，由aluc控制
    output reg[31:0] r,//32位输出，由a\b经过aluc的操作生成
    output reg zero,//0标志位
    output reg carry,//进位标志位
    output reg negative,//负数标志位
    output reg overflow//溢出标志位
    );
   parameter ADDU=4'b0000;
        parameter ADD=4'b0010;
        parameter SUBU=4'b0001;
        parameter SUB=4'b0011;
        parameter AND=4'b0100;
        parameter OR=4'b0101;
        parameter XOR=4'b0110;
        parameter NOR=4'b0111;
        parameter LUI1=4'b1000;
        parameter LUI2=4'b1001;
        parameter SLT=4'b1011;
        parameter SLTU=4'b1010;
        parameter SRA=4'b1100;
        parameter SLL=4'b1110;
        parameter SLR=4'b1111;
        parameter SRL=4'b1101;
        
         reg [32:0] mm;
         reg[31:0] cc;
           
           always@(*)begin
               case(aluc)
                   ADDU: begin
                       r=a+b;
                       mm=a+b;
                       if(!r)
                       zero=1;
                       else
                       zero=0;
                       if(mm[32]==1)
                       carry=1;
                       else 
                       carry=0;
                       negative=r[31];
                       overflow=0;
                   end
                   SUBU: begin
                       r=a-b;
                       if(!r)
                       zero=1;
                       else
                       zero=0;
                       if(a<b)
                       carry=1;
                       else
                       carry=0;
                       negative=r[31];
                       overflow=0;
                   end
                   ADD: begin
                      r=a+b;
                      if(!r)
                      zero=1;
                      else
                      zero=0;
                      carry=0;
                      negative=r[31];
                      if(a[31]==1&&b[31]==1&&r[31]==0)
                      overflow=1;
                      else if(a[31]==0&&b[31]==0&&r[31]==1)
                      overflow=1;
                      else
                      overflow=0;
                   end
                   SUB: begin
                       r=a-b;
                       if(!r)
                       zero=1;
                       else
                       zero=0;
                       carry=0;
                       negative=r[31];
                       if((a[31]==1&&b[31]==0&&r[31]==0)||(a[31==0]&&b[31]==1&&r[31]==1))
                       overflow=1;
                       else
                       overflow=0;
                   end
                   SRA: begin
                       if(a>0)
                       carry=b[a-1];
                       else
                       carry=0;
                       r=b>>>a;
                       if(!r)
                       zero=1;
                       else
                       zero=0;
                       negative=r[31];
                       overflow=0;
                   end
                   SRL: begin
                      if(a>0)
                      carry=b[a-1];
                      else
                      carry=0;
                      r=b>>a;
                      if(!r)
                      zero=1;
                      else
                      zero=0;
                      negative=r[31];
                      overflow=0;
                   end
                   SLL: begin
                       r=b<<a;
                       if(!r)
                       r=1;
                       else
                       r=0;
                       negative=r[31];
                       overflow=0;
                       if(a>0)
                       carry=b[32-a];
                       else
                       carry=0;
                   end
                   AND: begin
                       r=a&b;
                       if(!r)
                       zero=1;
                       else
                       zero=0;
                       carry=0;
                       negative=r[31];
                       overflow=0;
                   end
                   OR: begin
                       r=a|b;
                       if(!r)
                       zero=1;
                       else
                       zero=0;
                       carry=0;
                       negative=r[31];
                       overflow=0;
                   end
                   XOR: begin
                       r=a^b;
                       if(!r)
                       zero=1;
                       else
                       zero=0;
                       carry=0;
                       negative=r[31];
                       overflow=0;
                   end
                   NOR: begin
                       r=~(a|b);
                       if(!r)
                       zero=1;
                       else
                       zero=0;
                       carry=0;
                       negative=r[31];
                       overflow=0;
                   end
                   SLTU: begin
                       r=a<b?1:0;
                       if((a-b)==0)
                       zero=1;
                       else
                       zero=0;
                       if(a<b)
                       carry=1;
                       else
                       carry=0;
                       negative=r[31];
                       overflow=0;
                   end
                   SLT: begin
                      cc=a-b;
                      if(cc[31]==1)
                      r=1;
                      else
                      r=0;
                      if((a-b)==0)
                      zero=1;
                      else
                      zero=0;
                      carry=0;
                      if(cc[31]==1)
                      negative=1;
                      else
                      negative=0;
                      overflow=0;
                   end
                   LUI1,LUI2: begin
                   r={b[15:0],16'b0};
                   if(!r)
                   zero=1;
                   else
                   zero=0;
                   carry=0;
                   negative=r[31];
                   overflow=0;
                   end
                   default:
                       r=a+b;
               endcase
           end
endmodule

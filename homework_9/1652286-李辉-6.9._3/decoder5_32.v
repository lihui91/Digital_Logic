`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/04 11:06:36
// Design Name: 
// Module Name: decoder
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


module decoder5_32(//��λ��ַ����32λ����
    input [4:0] iData,
    input  iEna,//�ߵ�ƽ��Ч
    output  [31:0] oData
    );
    reg [31:0] odata;
    always @(*)
    begin
    if(iEna==1)
    begin
    odata=0;
    odata[iData]=1;
    end
    end
    assign oData=odata;
endmodule

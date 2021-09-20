`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/04 18:47:17
// Design Name: 
// Module Name: encoder83_Pri_tb
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


module encoder83_Pri_tb();
reg [7:0] iData;
reg iEI;
wire [2:0] oData;
wire oEO;
encoder83_Pri uut(.iData(iData),.iEI(iEI),.oData(oData),.oEO(oEO));

initial
begin
#50 iEI=1;
#50 iEI=0;
end

initial
begin
#100 iData=8'b11111111;
#50 iData=8'b01110101;
#50 iData=8'b00110010;
#50 iData=8'b10101001;
#50 iData=8'b10010010;
#50 iData=8'b11010101;
#50 iData=8'b11011011;
#50 iData=8'b11101100;
#50 iData=8'b11100101;
#50 iData=8'b11110101;
#50 iData=8'b11110011;
#50 iData=8'b11111001;
#50 iData=8'b11111010;
#50 iData=8'b11111101;
#50 iData=8'b11111100;
#50 iData=8'b11111110;
end
endmodule

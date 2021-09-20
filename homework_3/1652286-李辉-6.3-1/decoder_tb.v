`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/04 11:07:16
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb( );
reg [2:0] iData;
reg [1:0] iEna;
wire [7:0] oData;
decoder uut(.iData(iData),.iEna(iEna),.oData(oData));
initial
begin
iData=3'b000;
#200 iData=3'b000;
#50 iData=3'b001;
#50 iData=3'b010;
#50 iData=3'b011;
#50 iData=3'b100;
#50 iData=3'b101;
#50 iData=3'b110;
#50 iData=3'b111;
end

initial
begin
iEna=2'b00;
#50 iEna=2'b00;
#50 iEna=2'b11;
#50 iEna=2'b10;
#50 iEna=2'b01;
end
endmodule

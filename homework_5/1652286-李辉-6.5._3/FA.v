`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/21 22:20:47
// Design Name: 
// Module Name: FA
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


module FA(
    input iA,
    input iB,
    input iC,
    output reg oS,
    output reg oC
    );
    always@(*)
    begin
    oC=(iA&iB)|(iA&iC)|(iB&iC);
    if(iC)
    oS=!(iA^iB);
    else
    oS=(iA^iB);
    end
endmodule

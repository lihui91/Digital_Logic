`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/14 20:22:30
// Design Name: 
// Module Name: logic_gates_3
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


module logic_gates_3(
    input iA,
    input iB,
    output reg oAnd,
    output reg oOr,
    output reg oNot
    );
    always @ (*)
    begin 
    oAnd=iA&iB;
    oOr=iA|iB;
    oNot=~iA;
    end
endmodule

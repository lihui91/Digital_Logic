`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/25 19:28:51
// Design Name: 
// Module Name: de_selector14
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


module de_selector14(
    input iC,
    input iS0,
    input iS1,
    output oZ0,
    output oZ1,
    output oZ2,
    output oZ3
    );
    assign oZ0=(~iS1)&(~iS0)&iC|(~iS0)&iS1|(~iS1)&iS0|iS0&iS1;
    assign oZ1=(~iS1)&(~iS0)|(~iS0)&iS1|(~iS1)&iS0&iC|iS0&iS1;
    assign oZ2=(~iS1)&(~iS0)|(~iS0)&iS1&iC|(~iS1)&iS0|iS0&iS1;
    assign oZ3=(~iS1)&(~iS0)|(~iS0)&iS1|(~iS1)&iS0|iS0&iS1&iC;
endmodule

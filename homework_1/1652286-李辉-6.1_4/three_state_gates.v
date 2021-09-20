`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/16 18:16:11
// Design Name: 
// Module Name: three_state_gates
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


module three_state_gates(
    input iA,
    input iEna,
    output oTri
    );
    assign oTri=(iEna==1)?iA:'bz;
endmodule

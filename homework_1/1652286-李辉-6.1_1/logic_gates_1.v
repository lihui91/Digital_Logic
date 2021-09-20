`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/14 17:57:08
// Design Name: 
// Module Name: logic_gates_1
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


module logic_gates_1
(
   input iA,
   input iB,
   output oAnd,
   output oOr,
   output oNot
   );
   and and_inst(oAnd,iA,iB);
   or or_inst(oOr,iA,iB);
   not not_inst(oNot,iA);
endmodule

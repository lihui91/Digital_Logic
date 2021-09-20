`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/21 22:49:35
// Design Name: 
// Module Name: Adder
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


module Adder(
    input [7:0] iData_a,
    input [7:0] iData_b,
    input iC,
    output reg [8:0] oData,
    output reg oData_C
    );
    always @(*)
    if(iC==0)
    begin
    oData=iData_a+iData_b;
    
    if(oData[8]==1)
    oData_C=1;
    else
    oData_C=0;
    end
    
    else if(iC==1&&iData_a[7]==0&&iData_b[7]==0)
    begin
    oData=iData_a+iData_b;
    if(oData[7]==1)
    oData_C=1;
    else
    oData_C=0;
    end
    
    else if(iC==1&&iData_a[7]==1&&iData_b[7]==0)
    begin
    if(iData_a[6:0]>iData_b[6:0])
    begin
    oData[7:0]=iData_a[6:0]-iData_b[6:0];
    oData[8]=1;
    oData_C=0;
    end
    else if(iData_a[6:0]<iData_b[6:0])
    begin
    oData[7:0]=iData_b[6:0]-iData_a[6:0];
    oData[8]=0;
    oData_C=0;
    end
    else if(iData_a[6:0]==iData_b[6:0])
    begin
    oData=0;
    oData_C=0;
    end
    end
    else if(iC==1&&iData_a[7]==0&&iData_b[7]==1) 
    begin
    if(iData_a[6:0]<iData_b[6:0])
     begin 
     oData[7:0]=iData_b[6:0]-iData_a[6:0];
    oData[8]=1; 
    oData_C=0; 
    end 
    else if(iData_a[6:0]>iData_b[6:0]) 
    begin 
    oData[7:0]=iData_a[6:0]-iData_b[6:0]; 
    oData[8]=0; 
    oData_C=0; 
    end 
    else if(iData_a[6:0]==iData_b[6:0]) 
    begin 
    oData=0; 
    oData_C=0; 
    end 
    end 
    else if(iC==1&&iData_a[7]==1&&iData_b[7]==1) 
    begin
    oData[7:0]=iData_a[6:0]+iData_b[6:0];
    oData[8]=1; 
    if(oData[7]==1) 
    oData_C=1; 
    else oData_C=0;
    end
endmodule

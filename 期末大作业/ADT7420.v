`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 08:09:51
// Design Name: 
// Module Name: ADT7420
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


module ADT7420(
    input wire system_clk,
    output wire SCL,//输出给SDA的时钟线
    inout wire SDA,//传输总线
    output reg [15:0] data,//16位温度数据
    output reg finish_flag
    );
    reg master_control_sda;
    reg sda_r;
    reg scl_r=0;
    reg [8:0]scl_ctr=0;
    reg [2:0]scl_sts;
    reg [3:0]iic_sts;
    reg [4:0]bit_cnt=0;
    reg [7:0]data_read;
    reg new_time=0;
    reg [7:0] sda_data_addr_r;
    reg read_flag=0;
    reg assign_flag=0;
    reg [15:0] flag=0;

    wire [7:0] sda_data_addr=8'h96;
    
    assign SCL=scl_r;
    assign SDA=master_control_sda?sda_r:1'bz;                                                                                                                                                                                                                                
    //状态机的配置
    parameter IDLE=4'd0;
    parameter START=4'd1;
    parameter SEND_A=4'd2;
    parameter S_ACK=4'd3;
    parameter SEND_RA=4'd4;
    parameter S_NACK=4'd5;
    parameter READ_BYTE1=4'd6;
    parameter M_ACK=4'd7;
    parameter READ_BYTE2=4'd8;
    parameter M_NACK=4'd9;
    parameter STOP=4'd10;
    
    `define scl_pos (scl_sts==3'd0)//时钟上升沿
    `define scl_high (scl_sts==3'd1)//高电平
    `define scl_reg (scl_sts==3'd2)//时钟下降沿
    `define scl_low (scl_sts==3'd3)//低电平    
    
    always@(posedge system_clk)begin//分频，将1MHz变为200kHz
        if(scl_ctr<9'd500) scl_ctr<=scl_ctr+1;
        else scl_ctr<=0;
    end    
    
    always@(posedge system_clk)begin
        case(scl_ctr)
        9'd124:scl_sts<=3'd1;
        9'd249:scl_sts<=3'd2;
        9'd374:scl_sts<=3'd3;
        9'd499:scl_sts<=3'd0;
        default:scl_sts<=3'd5;
        endcase
    end
    
    always@(posedge system_clk)begin
        if(scl_sts==3'd0) scl_r<=1'b1;
        else if(scl_sts==3'd2) scl_r<=1'b0;
    end
    
    
    reg [26:0] timer=0;
    always@(posedge system_clk)begin
        if(timer<27'd30000000)begin
            timer<=timer+1;
            if(timer==27'd24999999) finish_flag<=1;
            end
        else
            begin
            timer<=0;
            finish_flag<=0;
            end
    end  
    
    
    always@(posedge system_clk)begin
        if(timer==0)begin
            bit_cnt<=0;
            master_control_sda<=1'b0;
            sda_r<=1'b1;
            read_flag<=1'b0;
      
            flag<=0;
            iic_sts<=IDLE;
    end

    case(iic_sts)
    IDLE:begin
        if(`scl_low)begin
            if(read_flag==1'b1) sda_data_addr_r<=sda_data_addr+1;
            else sda_data_addr_r<=sda_data_addr;
            iic_sts<=START;
            master_control_sda<=1;
            sda_r<=1;
        end
    end    
  
    START:begin
        if(`scl_high)begin
            sda_r<=1'b0;
            bit_cnt<=0;
            iic_sts<=SEND_A;
            assign_flag<=0;
            end
        end


    SEND_A:begin
        if(`scl_low)begin
            master_control_sda<=1'b1;
            case(bit_cnt)
            4'd0:sda_r<=sda_data_addr_r[7];
            4'd1:sda_r<=sda_data_addr_r[6];
            4'd2:sda_r<=sda_data_addr_r[5];
            4'd3:sda_r<=sda_data_addr_r[4];
            4'd4:sda_r<=sda_data_addr_r[3];
            4'd5:sda_r<=sda_data_addr_r[2];
            4'd6:sda_r<=sda_data_addr_r[1];
            4'd7:sda_r<=sda_data_addr_r[0];
            endcase
            assign_flag<=1; 
            if(bit_cnt==4'd8)begin
                master_control_sda<=1'b0;
                iic_sts<=S_ACK;
                bit_cnt<=4'd0;
                assign_flag<=0;
            end
        end
        else if(`scl_high)
            begin
                if(assign_flag==1)begin
                    bit_cnt<=bit_cnt+1;
                    assign_flag<=0;
                end
            end
        end
    
    S_ACK:begin
    if(`scl_high) begin
        if(SDA==0) begin
            if(read_flag==1'b1) begin
                iic_sts<=READ_BYTE1;
                master_control_sda<=1'b0;
                bit_cnt<=0;
                assign_flag<=1;
            end
            else begin
                iic_sts<=SEND_RA;
                sda_r<=1'b0;
                master_control_sda<=1'b1;
                bit_cnt<=0;
                assign_flag<=0;
                sda_data_addr_r<=8'h00;
            end
        end
    end     
    else 
        iic_sts<=S_ACK;
    end    
    
    SEND_RA:begin
        if(`scl_low)begin
            master_control_sda<=1'b1;
                case(bit_cnt)
                4'd0:sda_r<=sda_data_addr_r[7];
                4'd1:sda_r<=sda_data_addr_r[6];
                4'd2:sda_r<=sda_data_addr_r[5];
                4'd3:sda_r<=sda_data_addr_r[4];
                4'd4:sda_r<=sda_data_addr_r[3];
                4'd5:sda_r<=sda_data_addr_r[2];
                4'd6:sda_r<=sda_data_addr_r[1];
                4'd7:sda_r<=sda_data_addr_r[0];
                endcase
                assign_flag<=1;
                if(bit_cnt==4'd8)begin//传输完，关闭传输
                    master_control_sda<=1'b0;
                    iic_sts<=S_NACK;//转向从机回应
                    bit_cnt<=4'd0;//data_bit返回0
                    assign_flag=0;
                    end
                else iic_sts<=SEND_RA;//转向从机回应 
        end
        if(`scl_high)begin
            if(assign_flag==1)begin
                bit_cnt<=bit_cnt+1;
                assign_flag<=0; 
            end
        end
    end

    S_NACK:begin 
        if(`scl_high) begin//当为SCL为高电平时
            iic_sts<=IDLE;
            read_flag<=1;
            master_control_sda<=1'b0;
            bit_cnt<=0;
            assign_flag<=0;
        end    
        else 
            iic_sts<=S_NACK;//保持等待从机反应 
        end

    READ_BYTE1:begin
        if(`scl_high)begin
            master_control_sda<=1'b0;//传输关闭
            if(assign_flag==0)begin
             
                data<=(data<<1)|SDA;//读取数据的寄存器一位一位地从数据线上读取数据
                bit_cnt<=bit_cnt+1;
                assign_flag<=1;
              
            end
            if(bit_cnt==7)begin//传输完毕
                bit_cnt<=0;
                assign_flag<=0;
                iic_sts<=M_ACK;//转向主机反应
                end
            end
        else if(`scl_low)begin
            assign_flag<=0;
        end
    end
    
    
    M_ACK:begin
        if(`scl_low)begin
            case(bit_cnt)
            0:begin
                master_control_sda<=1'b1;
                sda_r<=0;  
                assign_flag<=1;              
            end
            1:begin
                master_control_sda<=1'b0;
                sda_r<=0;
                iic_sts<=READ_BYTE2;
                bit_cnt<=0;
            end
            endcase
        end
        else if(`scl_high) if(assign_flag==1) bit_cnt<=1;
        end
    
    
    READ_BYTE2:begin
        if(`scl_high)begin
            master_control_sda<=1'b0;//传输关闭
            if(assign_flag==0)begin
               
                data<=(data<<1)|SDA;//读取数据的寄存器一位一位地从数据线上读取数据
                bit_cnt<=bit_cnt+1;
                assign_flag<=1;
              
            end
            if(bit_cnt==7)begin//传输完毕
                bit_cnt<=0;
                assign_flag<=0;
                iic_sts<=M_NACK;
            end
        end
        else if(`scl_low)begin
            assign_flag<=0;
        end
    end
    
    
    
    
    M_NACK:begin
    if(`scl_low)begin
        case(bit_cnt)
        0:begin
            master_control_sda<=1'b1;
            sda_r<=1;  
            assign_flag<=1;              
        end
        1:begin
            master_control_sda<=1'b1;
            sda_r<=0;
            iic_sts<=STOP;
            bit_cnt<=0;
        end
        endcase
    end
    else if(`scl_high) if(assign_flag==1) bit_cnt<=1;
    end
    
    STOP:begin
    if(`scl_high)begin
        master_control_sda<=1'b1;
        sda_r<=1;
        read_flag<=0;
        iic_sts<=STOP;
        end
    end
    endcase
    end    
endmodule

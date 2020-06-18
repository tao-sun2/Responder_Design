`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 21:33:26
// Design Name: 
// Module Name: buzzer
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


module buzzer(
input clk,	//外部输入100MHz时钟信号
input rst,	//外部输入复位信号，低电平有效
output reg beep	//蜂鸣器控制信号，1--响，0--不响
		);
 
reg[19:0] cnt;		//20位计数器
 
	//cnt计数器进行0-999999的循环计数，即clk时钟的1000000分频，对应cnt一个周期为100Hz
always @ (posedge clk or negedge rst)	
	if(~rst) cnt <= 20'd0;
	else if(cnt < 20'd999_999) cnt <= cnt+1'b1;
	else cnt <= 20'd0;
 
	//产生频率为100Hz，占空比为50%的蜂鸣器发声信号
always @ (posedge clk ) 
    if(cnt < 20'd500_000) beep <= 1'b1;	//蜂鸣器响
	else beep <= 1'b0;		//蜂鸣器不响
 
endmodule

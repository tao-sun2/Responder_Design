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
input clk,	//�ⲿ����100MHzʱ���ź�
input rst,	//�ⲿ���븴λ�źţ��͵�ƽ��Ч
output reg beep	//�����������źţ�1--�죬0--����
		);
 
reg[19:0] cnt;		//20λ������
 
	//cnt����������0-999999��ѭ����������clkʱ�ӵ�1000000��Ƶ����Ӧcntһ������Ϊ100Hz
always @ (posedge clk or negedge rst)	
	if(~rst) cnt <= 20'd0;
	else if(cnt < 20'd999_999) cnt <= cnt+1'b1;
	else cnt <= 20'd0;
 
	//����Ƶ��Ϊ100Hz��ռ�ձ�Ϊ50%�ķ����������ź�
always @ (posedge clk ) 
    if(cnt < 20'd500_000) beep <= 1'b1;	//��������
	else beep <= 1'b0;		//����������
 
endmodule

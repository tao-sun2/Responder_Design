`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 19:58:42
// Design Name: 
// Module Name: responder_sim
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


module responder_sim();
reg clk,rst,player1,player2,player3,player4,showready;
reg [3:0]number_of_player;
wire stoptimer;
wire [3:0] result;
Responder u(clk,rst,showready,player1,player2,player3,player4,number_of_player,stoptimer,result);
always #2 clk=~clk;
initial fork
clk=0;
rst=1;
number_of_player=4'b0011;
{player1,player2,player3,player4}=4'b0;
 #1 rst=0;
 #3 rst=1;
 #4 showready=0;
 #5 player1=1;
 #10 player2=1;
 #15 rst=0;
 #16 rst=1;
 #20 player1=0;
 #20 player2=0;
 #21 player4=1;
 #25 player3=1;

 join
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/24 22:38:13
// Design Name: 
// Module Name: whole_test
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


module whole_test();
wire clk;
  wire jia;
  wire jian;
  wire nextset;
  wire no;
  wire player1;
  wire player2;
  wire player3;
  wire player4;
  wire rst;
  wire [7:0]seg_en_0;
  wire [7:0]seg_out_0;
  wire set1;
  wire starttimer;
  wire yes;
main1_wrapper test
(clk,
 jia,
   jian,
  nextset,
 no,
 player1,
 player2,
 player3,
 player4,
 rst,
  seg_en_0,
  seg_out_0,
 set1,
  starttimer,
  yes);
    reg clk1=0;
    reg jia1=1;
    reg jian1=1;
    reg nextset1=1;
    reg no1=0;
   reg player11=0;
    reg player21=0;
   reg player31=0;
    reg player41=0;
    reg rst1=0;
 
    reg set11=0;
    reg starttimer1=0;
    reg yes1=0;
   
   initial
   forever #1 clk1=~clk;
   
   initial
   begin
   #5 rst1<=1;
   #10 rst1<=0;
   #20 starttimer1=1;
   
   #30 player11=1;
   #30 starttimer1=0;
   #80 yes1=1;
   
   end
   
   
 

  
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/02 18:12:26
// Design Name: 
// Module Name: test_setting
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


module test_setting();
reg clk,startset,add1,add2,subtract1,subtract2,time1,time2;
wire [7:0]maxtime;
wire endset;
wire[3:0] maxuser;
wire[3:0] scoreadd;
wire [3:0] scoresubtract;
setting u(clk,startset,add1,add2,subtract1,subtract2,time1,time2,maxtime,endset,maxuser,scoreadd,scoresubtract);
always #2clk=~clk;
 initial fork
 clk=0;
 #2startset=1;
 #5add1=1;
 #5add2=0;
 #7subtract2=1;
 #7subtract1=0;
 #9time1=1;
 #9time2=1;
 #11time2=1;
 #12add2=1;
 #14subtract1=1;
 join
endmodule
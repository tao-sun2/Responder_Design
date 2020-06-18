`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/17 21:22:06
// Design Name: 
// Module Name: main
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


module main(
input yes,no,player1,player2,player3,player4,start,clk,startgame,set,setjia,setjian
    );
    wire [7:0]maxtime;wire[3:0] who;
    wire [3:0] maxuser;
    wire[3:0] scorejia;wire [3:0] scorejian;reg show_time,show_who,show_set, show_score, show_ready;
    wire start;
    control_block(yes,no,endtime,starttimer,startgame,clk,stoptime,endset,startset,endgame,show_time,show_who,show_set, show_score, show_ready);
    timer timer1(.clk(clk),.start(start),.maxtime(maxtime),.resttime(resttime),.stoptime(stoptime),.endtime(endtime));
    setting setting1(.clk(clk),.startset(startset),.jia(jia),.jian(jian),.next(next),.rst(rst),.maxtime(maxtime),.endset(endset),.maxuser(maxuser),.scorejia(scorejia),.scorejian(scorejian));
   Compere Compere1(clk,rst,start,set,starttimer, startset);
    Responder Responder1( clk,rst,player1,player2,player3,player4,maxuser, stoptimer, who);
    
endmodule

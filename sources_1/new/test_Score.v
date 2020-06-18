`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/16 23:21:58
// Design Name: 
// Module Name: test_Score
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


module test_Score(input rst,
                   input clk,
                   input enable,
                   input [3:0]player,
                   input ifCorrect,
                   input ifWrong,
                   output [7:0]seg_out,
                   output [7:0]seg_en,
                   output [3:0]num,
                   output [3:0]test222
                   );
                   assign test222=player;
                   wire [31:0]score_out;
                   wire [3:0]testplayer;
                   assign testplayer=player;
                   
Score_design scorePart(
    rst,
    clk,
    enable,
    player,
    ifCorrect,
    ifWrong,
    player,
    score_out
    );
    assign num=score_out;
    seg7 show(rst,    
               clk,
                10000,//state,
                0,      //dataTimer
                //input [7:0] dataChange,
                0,//input [3:0] dataWho,
                testplayer,//input [3:0] currentPlayer,
                score_out,//input [31:0] playersScore,
                0,// input [7:0] settings,
                0,//input [7:0] controller,
                seg_out,//output [7:0]seg_out,
                seg_en,//output [7:0]seg_en,
                num);//output [3:0] number);
endmodule

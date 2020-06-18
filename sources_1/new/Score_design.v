`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/11 19:52:40
// Design Name: 
// Module Name: Score_design
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


module Score_design(//0000????
    input rst,
    input clk,
    input enable,
    input [3:0]player,
    input ifCorrect,
    input ifWrong,
    output [7:0]out
    );
    reg ready;
    reg correct=0;
    reg playerNum;
    reg [3:0]currentScore;
    reg [3:0]player1Score,player2Score,player3Score,player4Score;
    assign out={playerNum,currentScore};
always @(posedge clk,posedge rst)
begin
if(rst)
begin
player1Score=0;
player2Score=0;
player3Score=0;
player4Score=0;
end
else ready<=enable;
end
always @(posedge ifCorrect)
begin
    if(ready)
        begin
        case(player)
        4'b0001:begin player1Score= player1Score+1; currentScore=player1Score;playerNum<=1;end
        4'b0010:begin player2Score= player2Score+1;currentScore=player2Score;playerNum<=2;end
        4'b0011:begin player3Score= player3Score+1;currentScore=player3Score;playerNum<=3;end
        4'b0100:begin player4Score= player4Score+1;currentScore=player4Score;playerNum<=4;end
        endcase
         end
end
always @(posedge ifWrong)
begin
    if(ready)
        begin
        case(player)
        4'b0001:begin player1Score<= player1Score-1; currentScore<=player1Score;playerNum<=1;end
        4'b0010:begin player2Score= player2Score-1;currentScore=player2Score;playerNum<=2;end
        4'b0011:begin player3Score= player3Score-1;currentScore=player3Score;playerNum<=3;end
        4'b0100:begin player4Score= player4Score-1;currentScore=player4Score;playerNum<=4;end
        endcase
      end
end
  
endmodule

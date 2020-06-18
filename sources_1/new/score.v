`timescale 1ns / 1ps


module score(
            input 
            clk,
            yes,
            no,
            rst,
            input [3:0]scorejia,
            [3:0]scorejian,
            input [3:0]maxuser,
            [3:0]who,
            output wire[7:0] player1,
            wire[7:0] player2,
            wire[7:0] player3,
            wire[7:0] player4,
            wire endgame,
            output  [3:0]currentWinner1
    );
    reg[7:0] player11;reg[7:0] player21;reg[7:0] player31;reg[7:0] player41;
    assign player1=(player11/10)*16+player11%10;
    assign player2=(player21/10)*16+player21%10;
    assign player3=(player31/10)*16+player31%10;
    assign player4=(player41/10)*16+player41%10;
   assign endgame=(player1>=10 )||(player2>=10)||(player3>=10) ||(player4>=10);
    
    reg [3:0]currentWinner=4'b0;
    assign currentWinner1=currentWinner;
  
    reg [31:0]counter=0;
    reg clk_out=0;
    always@(posedge clk,posedge rst)                  //分频器
    if(rst)
    begin
    counter<=0;
    clk_out<=1'b0;
    end
    else begin
        if(counter==2)
            begin
            counter<=0;
            clk_out<=~clk_out;
             end
         else
        counter<=counter+1;
    end
    
    
    
    always@(posedge clk)
    begin
    if(endgame)                                                      //judge the winner
    begin
    if(player1>=10) currentWinner<=4'b0001;
    else if(player2>=10) currentWinner<=4'b0010;
    else if (player3>=10) currentWinner<=4'b0011;
    else if(player4>=10) currentWinner<=4'b0100;
    else currentWinner<=4'b0000;//if error,it occurs
    end
    end
    reg [3:0]currentplayer=4'b0000;
    reg [3:0]nextplayer=4'b0000;
    reg [7:0]nextplayer1=4'b0000;
    reg [7:0]nextplayer2=4'b0000;
    reg [7:0]nextplayer3=4'b0000;
    reg [7:0]nextplayer4=4'b0000;
  //  reg [3:0]winnernext;
   // reg nextendgame=0;
    always@(posedge clk_out,posedge rst)
    if(rst)
    begin
    currentplayer<=4'b0000;
    player11<=0;
    player21<=0;
    player31<=0;
    player41<=0;
    //endgame<=0;
    end
    else
    begin
    currentplayer<=nextplayer;
    player11<=nextplayer1;
    player21<=nextplayer2;                                                             
    player31<=nextplayer3;
    player41<=nextplayer4;
  //  endgame<=nextendgame;
    end
    
    always@(posedge yes,posedge no)
    begin
    if(yes)
   begin
    case (who)
    4'b0001: nextplayer1=player11+scorejia;                                      //add score
    4'b0010:nextplayer2=player21+scorejia;  
    4'b0011: nextplayer3=player31+scorejia; 
    4'b0100: nextplayer4=player41+scorejia; 
    endcase
    end
   else  if(no)
    case (who) 
        4'b0001:nextplayer1=(player11>scorejian)?player11-scorejian:4'b0;        //reduce score
        4'b0010: nextplayer2=(player21>scorejian)?player21-scorejian:4'b0;
        4'b0011: nextplayer3=(player31>scorejian)?player31-scorejian:4'b0;
        4'b0100: nextplayer4=(player41>scorejian)?player41-scorejian:4'b0;
        endcase
    else 
    begin
    nextplayer1=player11;                                                         //有限状态机
    nextplayer2=player21;
    nextplayer3=player31;
    nextplayer4=player41;
    end
    end
    endmodule
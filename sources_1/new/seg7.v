`timescale 1ns / 1ps

module seg7(input rst,    
            input clk,
            input [4:0]state,
            input [7:0] dataTimer,
            input [3:0] dataWho,
            input [3:0] currentPlayer,
            input [7:0] player1Score,
            input [7:0] player2Score,
            input [7:0] player3Score,
            input [7:0] player4Score,
            input [7:0] timing,
            input [3:0] addscale,
            input [3:0] minusscale,
            input [3:0] playerNumber,
            input  controller,
            input [3:0]winner,
            output [7:0]seg_out,
            output [7:0] seg_en
             );
            
         //  reg;
           
           reg showfinal=0;
            reg [4:0]clk_out=5'b00000;
            reg [40:0]cnt=0;
              reg [3:0]lightflow=4'b0000;
            always@ (posedge clk or posedge rst)                        //结束状态的
            begin
                if(rst)
                begin
                cnt<=0;
                clk_out<=0;
                showfinal<=0;
                lightflow=4'b0000;
                end
                else if(cnt==2)begin
               
                clk_out<=clk_out+1;
                cnt<=0;
                end
                else begin
                cnt<=cnt+1;
                end
            end

reg [7:0]decimalpoint=8'b00000000;
wire [7:0]decimalCache;
 reg tick=0;
reg [30:0]counter=0;
reg [3:0]segLocation=0;
reg [3:0] num=0;
reg en_point=8'b11111111;



reg [3:0]currentPlayetScore;



reg [7:0] bit_control;
reg [3:0] bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0;
reg[7:0] decimal_p=8'b00000000;
scan_show show(clk,bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0,bit_control,decimal_p,seg_en, seg_out);

reg [3:0]one,ten;

wire [3:0] player1ScoreTen;                         //将两位bcd码转换为数字
wire [3:0] player1ScoreOne;
assign player1ScoreTen={player1Score[7],player1Score[6],player1Score[5],player1Score[4]};
assign player1ScoreOne={player1Score[3],player1Score[2],player1Score[1],player1Score[0]};
wire [3:0] player2ScoreTen;
wire [3:0] player2ScoreOne;
assign player2ScoreTen={player2Score[7],player2Score[6],player2Score[5],player2Score[4]};
assign player2ScoreOne={player2Score[3],player2Score[2],player2Score[1],player2Score[0]};
wire [3:0] player3ScoreTen;
wire [3:0] player3ScoreOne;
assign player3ScoreTen={player3Score[7],player3Score[6],player3Score[5],player3Score[4]};
assign player3ScoreOne={player3Score[3],player3Score[2],player3Score[1],player3Score[0]};
wire [3:0] player4ScoreTen;
wire [3:0] player4ScoreOne;
assign player4ScoreTen={player4Score[7],player4Score[6],player4Score[5],player4Score[4]};
assign player4ScoreOne={player4Score[3],player4Score[2],player4Score[1],player4Score[0]};

always @(posedge clk) 
begin
case(state)
    5'b00001:                                                                       //开始状态，显示“GO”
    begin
    bit_control<=8'b11000000;
   {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'b1111,4'd0,4'd3,4'd4,4'd5,4'd6,4'd7,4'd8};
   end
      5'b00010:                                                                       //结束状态，滚动显示每位玩家的得分，及最终冠军
begin
               case(clk_out)
                     5'b00000:
                        begin
                        bit_control<=8'b00100011;//1
                        {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'd1,4'd1,4'd1,4'd1,player1ScoreTen,player1ScoreOne,player1ScoreTen,player1ScoreOne};
                        end
                    5'b00001:
                        begin
                        bit_control<=8'b01000110;//2
                        {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'd1,4'd1,4'd1,4'd1,player1ScoreTen,player1ScoreTen,player1ScoreOne,player1ScoreOne};
                        end
                    5'b00010:
                        begin
                        bit_control<=8'b10001100;//3
                        {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'd1,4'd1,4'd1,4'd1,player1ScoreTen,player1ScoreOne,player1ScoreTen,player1ScoreOne};
                        end
                     5'b00011:
                        begin
                        bit_control<=8'b00100011;//4
                        {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'd2,4'd2,4'd2,4'd2,player2ScoreTen,player2ScoreOne,player2ScoreTen,player2ScoreOne};
                        end
                      5'b00100:
                         begin
                        bit_control<=8'b01000110;//5
                        {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'd2,4'd2,4'd2,4'd2,player2ScoreTen,player2ScoreTen,player2ScoreOne,player2ScoreOne};
                        end
                       5'b00101:               //6
                         begin
                        bit_control<=8'b10001100;
                        {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'd2,4'd2,4'd2,4'd2,player2ScoreTen,player2ScoreOne,player2ScoreTen,player2ScoreOne};
                        end
                       5'b00110:          //7
                           begin
                           bit_control<=8'b00100011;
                           {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'd3,4'd3,4'd3,4'd3,player3ScoreTen,player3ScoreOne,player3ScoreTen,player3ScoreOne};
                           end
                        5'b00111:        //8
                              begin
                              bit_control<=8'b01000110;
                              {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'd3,4'd3,4'd3,4'd3,player3ScoreTen,player3ScoreTen,player3ScoreOne,player3ScoreOne};
                              end
                         5'b01000:        //9
                                 begin
                                 bit_control<=8'b10001100;
                                 {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'd3,4'd3,4'd3,4'd3,player3ScoreTen,player3ScoreOne,player3ScoreTen,player3ScoreOne};
                                 end
                          5'b01001:     //10
                                    begin
                                    bit_control<=8'b00100011;
                                    {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'd4,4'd4,4'd4,4'd4,player4ScoreTen,player4ScoreOne,player4ScoreTen,player4ScoreOne};
                                    end
                          5'b01010:    //11
                                       begin
                                       bit_control<=8'b01000110;
                                       {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'd4,4'd4,4'd4,4'd4,player4ScoreTen,player4ScoreTen,player4ScoreOne,player4ScoreOne};
                                       end
                            5'b01011:   //12
                                          begin
                                          bit_control<=8'b10001100;
                                          {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={4'd4,4'd4,4'd4,4'd4,player4ScoreTen,player4ScoreOne,player4ScoreTen,player4ScoreOne};
                                          end
       
         default:                      
           begin                                
                             bit_control<=8'b10001111;
                             {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={winner,4'b0,4'b0,4'b0,4'd6,4'd6,4'd6,4'd6}; end
        endcase             
end
        
        5'b00100:            //设置状态
        begin 
          bit_control<=8'b11010101;
           {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}<={{timing[7],timing[6],timing[5],timing[4]},{timing[3],timing[2],timing[1],timing[0]},4'd0,addscale,4'd0,minusscale,4'd0,playerNumber};
         
        end
         5'b01000:                        //计分状态，显示当前玩家及其的房             
                        begin
                        bit_control=8'b10000011; 
                        case(currentPlayer)
                        4'b0001:{bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={currentPlayer,4'b0,4'b0,4'b0,4'b0,4'b0,{player1Score[7],player1Score[6],player1Score[5],player1Score[4]},{player1Score[3],player1Score[2],player1Score[1],player1Score[0]}};
                        4'b0010:{bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={currentPlayer,4'b0,4'b0,4'b0,4'b0,4'b0,{player2Score[7],player2Score[6],player2Score[5],player2Score[4]},{player2Score[3],player2Score[2],player2Score[1],player2Score[0]}};
                        4'b0011:{bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={currentPlayer,4'b0,4'b0,4'b0,4'b0,4'b0,{player3Score[7],player3Score[6],player3Score[5],player3Score[4]},{player3Score[3],player3Score[2],player3Score[1],player3Score[0]}};
                        4'b0100:{bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={currentPlayer,4'b0,4'b0,4'b0,4'b0,4'b0,{player4Score[7],player4Score[6],player4Score[5],player4Score[4]},{player4Score[3],player4Score[2],player4Score[1],player4Score[0]}};
                        default:{bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={currentPlayer,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0};
                        endcase
                        end    
          5'b10000:                     //计时状态
                  begin
                      
                      {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}<={4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,{dataTimer[7],dataTimer[6],dataTimer[5],dataTimer[4]},{dataTimer[3],dataTimer[2],dataTimer[1],dataTimer[0]}};
                      bit_control<=8'b00000011;
                  end
             
      
        default:    //报错状态
        begin 
         bit_control<=8'b11111000;
        {bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0}={{1'b0,1'b0,1'b0,state[4]},{1'b0,1'b0,1'b0,state[3]},{1'b0,1'b0,1'b0,state[2]},{1'b0,1'b0,1'b0,state[1]},{1'b0,1'b0,1'b0,state[0]},4'd6,4'd7,4'd8};
         end
endcase
end
endmodule
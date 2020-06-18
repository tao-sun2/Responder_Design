`timescale 1ns / 1ps

module score_tb();
reg rst=1;
reg clk=0;
reg enable=0;
reg [3:0] player;
reg ifCorrect=0;
reg ifWrong=0;
wire [7:0]seg_out;
wire [7:0]seg_en;
wire [3:0]num;
wire rst1;
wire clk1;
wire enable1;
wire [3:0]player11;
wire ifCorrect1;
wire ifWrong1;
assign rst1=rst;
assign clk1=clk;
assign enable1=enable;
assign player11[3]=player[3];
assign player11[2]=player[2];
assign player11[1]=player[1];
assign player11[0]=player[0];
assign ifCorrect1=ifCorrect;
assign ifWrong1=ifWrong;
test_Score g1(rst1,
              clk1,
              enable1,
              player,
              ifCorrect1,
              ifWrong1,
              seg_out,
              seg_en,
              num
                   );
initial
begin

#1 rst=0; 
forever 
#1 clk<=~clk;
end


initial
begin
rst=1;
clk=0;
enable=0;
player=4'b0001;
ifCorrect=0;
ifWrong=0;
#30 enable<=1;


end

initial
#31 
begin
repeat(6)
# 10 ifCorrect=~ifCorrect;
#70 ifWrong=1;
#71 ifWrong=0;
#75 player=4'b0010;

repeat(20)
# 10 ifCorrect=~ifCorrect;
end

initial
#10000 $finish;

endmodule

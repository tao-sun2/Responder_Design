module Retrieve_sim();
reg rst,clk,switch;
reg [3:0]who;
reg [7:0]score;
wire [11:0] results;
Retrieve u1(rst,clk,who,score,switch,results);
always#2clk=~clk;
initial fork
clk=0;
rst=0;
score=8'b00000000;
who=4'b0000;
#1rst=1;
#1switch=1;
#6who=4'b0010;
#6score=8'b00000110;
#8who=4'b0011;
#8score=8'b00000111;
#15switch=0;
join
endmodule
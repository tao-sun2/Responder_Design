module Retrieve(
input rst,clk,[3:0]who,[7:0]score,
 switch,//when switch==1,it means writing data while when switch==0,it means reading data
output reg[11:0] results
);
reg [5:0]count;
reg [11:0] data[1:20];
reg [10:0]index=1;
always@(posedge clk,negedge rst) begin
    if(~rst)begin//异步复位信号rst实现循环计数
	count=1; 
	index=1;
end
else begin
	if(switch)begin
	data[count]={who,score};
	count=count+1;
end
else begin
	if(index<=count)begin
 	results=data[index];
	index=index+1;
	end
end
end
end   
endmodule
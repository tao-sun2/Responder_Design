`timescale 1ns / 1ps



module timer(
    input clk,starttimer,stoptime,input[7:0]  maxtime,
    output reg[7:0]resttime,wire endtime
    );
    reg [7:0]count;
    reg [39:0]t;
    reg clk1;
    assign endtime=(count===0);
    always@(posedge clk)
    begin
    {resttime[7],resttime[6],resttime[5],resttime[4]}<=count/10;
    {resttime[3],resttime[2],resttime[1],resttime[0]}<=count%10;  
    end
    
    always@(posedge clk)
    begin
    if(!starttimer) begin t=40'b0;clk1=1;end
    t<=t+1;
    if(t==50000000)begin t<=0; clk1=~clk1;end
   //    if(t==2)begin t<=0; clk1=~clk1;end
    end
    
    
     always@(posedge clk1)
     if(!starttimer)
     begin
     count<={maxtime[7],maxtime[6],maxtime[5],maxtime[4]}*4'b1010+{maxtime[3],maxtime[2],maxtime[1],maxtime[0]};
 //    endtime<=1'b0;
     end
     else if(count==7'b0000000||stoptime)
     begin
     count<={maxtime[7],maxtime[6],maxtime[5],maxtime[4]}*4'b1010+{maxtime[3],maxtime[2],maxtime[1],maxtime[0]};
 //    endtime<=1'b1;
     end
     else
     begin
//     endtime<=1'b0;
     count<=count-1;
     end
endmodule

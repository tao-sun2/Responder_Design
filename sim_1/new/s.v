`timescale 1ns / 1ps
module s(

    );
    reg clk,startset;reg  jia,jian,next,rst;
         wire[7:0]maxtime;wire endset;wire[3:0] maxuser;wire[3:0] scorejia;wire[3:0] scorejian;
    
    setting u1(.clk(clk),.startset(startset),.maxtime(maxtime),.rst(rst),.jia(jia),.jian(jian),.next(next),.endset(endset),.maxuser(maxuser),.scorejia(scorejia),.scorejian(scorejian));
    
    always
    begin; 
    #5 clk=~clk;   
    end
    
    initial
    begin
    clk=0;rst=0; startset=1;next=0;
    #10 rst=1;
    #10 rst=0;
    #10 jia=1; #10 jia=0;
    #10 jian=1; #10 jian=0;
    #10 next=1;#10 next=0;
    #10 jia=1; #10 jia=0;
    #10 jian=1; #10 jian=0;
    #10 rst=1;
    #10 rst=0;
    end
    
    
endmodule

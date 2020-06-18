`timescale 1ns / 1ps


module test(

    );

        reg yes,no,endtime,starttimer,startgame,clk,stoptime,endset,startset,endgame;
            wire show_time;
            wire  show_who;
            wire  show_set;
            wire  show_score;
            wire  show_ready;
        control_block u2(yes,no,endtime,starttimer,startgame,clk,stoptime,endset,startset,endgame,show_time,show_who,show_set,show_score,show_ready);
        
        always
                              begin; 
                              #5 clk=~clk;   
                              end
        
        initial
        begin
        clk=0;#5 yes=0;#5 no=0;#5 endtime=0;#5 starttimer=0;#5 startgame=0;#5 stoptime=0;#5 endset=0;#5 startset=0;#5 endgame=0;
        #10 startgame=1; 
        #10 startgame=0;
        #50 starttimer=1;
        #100 starttimer=0;
        #30 stoptime=1;#10 stoptime=0;
        #10 yes=1;
        #30 starttimer=1;
        #10 starttimer=0;
        #50 endtime=1;
        #10 startset=1;#10 startset=0;
        #20 endset=1;#10 endset=0;
        #50 endgame=1;
        end
        
        
    endmodule

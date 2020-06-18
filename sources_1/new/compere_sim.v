module compere_sim();
reg clk,rst,start;
wire to_timer;
Compere u(clk,rst,start,to_timer);
always #2 clk=~clk;
initial fork
rst=1;clk=0;
 #1 rst=1;
 #1 rst=0;
 #3 start=1;
 #7 rst=1;
 #7 start=0;
 #9 rst=0;
 #11 start=1;
 #40 $finish;
 join
endmodule

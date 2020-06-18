`timescale 1ns / 1ps

module songplayer1 ( audio , clk , en);

output    audio;
input     clk;
input     en;


reg  [23:0] counter4Hz,
            counter6MHz;
reg  [13:0]  count,origin;
reg  audiof;


reg  clk_6MHz,
     clk_4Hz;

reg  [4:0]  j;
reg  [7:0]  len;


assign audio= en? audiof : 1'b0 ;  //控制开关

always @(posedge clk)              //6MHz分频
begin
    if(counter6MHz==4)
    begin
        counter6MHz=0;
        clk_6MHz=~clk_6MHz;
    end
    else
    begin
        counter6MHz=counter6MHz+1;
    end
end

always @(posedge clk)                 //4Hz分频
begin
    if(counter4Hz==6250000)              
    begin
        counter4Hz=0;
        clk_4Hz=~clk_4Hz;
    end
    else
    begin
        counter4Hz=counter4Hz+1;
    end
end


always @(posedge clk_6MHz)
begin
    if(count==16383)    
    begin
        count=origin;
        audiof=~audiof;
    end
    else
        count=count+1;
end


always @(posedge clk_4Hz)       
begin
     case(j)
    'd1:origin='d4916;  //low
    'd2:origin='d6168;
    'd3:origin='d7281;
    'd4:origin='d7791;
    'd5:origin='d8730;
    'd6:origin='d9565;
    'd7:origin='d10310;
    'd11:origin='d010647;  //middle
    'd12:origin='d011272;
    'd13:origin='d011831;
    'd14:origin='d012087;
    'd15:origin='d012556;
    'd16:origin='d012974;
    'd17:origin='d013346;
    'd21:origin='d13516;  //high
    'd22:origin='d13829;
    'd23:origin='d14108;
    'd24:origin='d11535;
    'd25:origin='d14470;
    'd26:origin='d14678;
    'd27:origin='d14864;
    default:origin='d16383; // try to modify
    endcase             
end

always @(posedge clk_4Hz)  //乐谱
begin

 begin
     if(len==63)
        len=0;
    else
        len=len+1;
    case(len)
0:j=19;
    1:j=11;
    2:j=11;
    3:j=15;
    4:j=15;
    5:j=16;
    6:j=16;
    7:j=15;
    8:j=0;
    9:j=14;
    10:j=14;
    11:j=13;
    12:j=13;
    13:j=12;
    14:j=12;
    15:j=11;
    16:j=0;
    17:j=15;
    18:j=15;
    19:j=14;
    20:j=14;
    21:j=13;
    22:j=13;
    23:j=12;
    24:j=0;
    25:j=15;
    26:j=15;
    27:j=14;
    28:j=14;
    29:j=13;
    30:j=13;
    31:j=12;
    32:j=0;
    33:j=0;
    34:j=0;
    35:j=0;
    36:j=0;
    37:j=0;
    38:j=0;
    39:j=0;
    40:j=0;
    41:j=0;
    42:j=0;
    43:j=0;
    44:j=0;
    45:j=0;
    46:j=0;
    47:j=0;
    48:j=0;
    49:j=0;
    50:j=0;
    51:j=0;
    52:j=0;
    53:j=0;
    54:j=0;
    55:j=0;
    56:j=0;
    57:j=0;
    58:j=0;
    59:j=0;
    60:j=0;
    61:j=0;
    62:j=0;
    63:j=0;
    default:j=0;
    endcase
end              
end
endmodule

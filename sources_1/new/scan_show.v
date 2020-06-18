`timescale 1ns / 1ps
module scan_show(input clk,
                 input [3:0]bit7,                      //七段数码管的七个不同位上的数字
                 input [3:0]bit6,
                 input [3:0]bit5,
                 input [3:0]bit4,
                 input [3:0]bit3,
                 input [3:0]bit2,
                 input [3:0]bit1,
                 input [3:0]bit0,
                 input [7:0] encontrol,                //控制该位显示不显示，如果是1，则显示
                 input [7:0] en_dp,                   //控制小数点是否显示
                 output reg [7:0]seg_en,
                 output [7:0]seg_out
);
reg tick=0;
reg [30:0]counter=0;
always@(posedge clk)                                  //分频，为了仿真，频率已调高
begin
 if(counter==2)
 begin
 counter<=0;
 tick<=~tick;
 end
 else
 counter<=counter+1;
end

reg [3:0] segLocation=0;
always@(posedge tick)                                      //扫描
begin
if(segLocation==7)                            
segLocation<=0;
else
segLocation<=segLocation+1;
end

reg [3:0]presentNum=0;
numberToSegout numberToSeg1(presentNum,segLocation,en_dp,seg_out);

always@(posedge tick)
begin
    case(segLocation)                                                                            
        0: if(encontrol[0]) begin seg_en<=8'b1111_1110; presentNum<=bit0; end else seg_en<=8'b1111_1111;      //扫描显示，不同数码管的不同位
        1: if(encontrol[1]) begin seg_en<=8'b1111_1101; presentNum<=bit1; end else seg_en<=8'b1111_1111;  
        2: if(encontrol[2]) begin seg_en<=8'b1111_1011; presentNum<=bit2; end else seg_en<=8'b1111_1111;  
        3: if(encontrol[3]) begin seg_en<=8'b1111_0111; presentNum<=bit3; end else seg_en<=8'b1111_1111;  
        4: if(encontrol[4]) begin seg_en<=8'b1110_1111; presentNum<=bit4; end else seg_en<=8'b1111_1111;  
        5: if(encontrol[5]) begin seg_en<=8'b1101_1111; presentNum<=bit5; end else seg_en<=8'b1111_1111;  
        6: if(encontrol[6]) begin seg_en<=8'b1011_1111; presentNum<=bit6; end else seg_en<=8'b1111_1111;  
        7: if(encontrol[7]) begin seg_en<=8'b0111_1111; presentNum<=bit7; end else seg_en<=8'b1111_1111; 
    endcase
end
     
 endmodule

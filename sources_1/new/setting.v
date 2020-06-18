`timescale 1ns / 1ps


module setting(
input clk,startset,input jia1,input jia2,input jian1, input jian2,input time1,input time2,rst,
    output wire[7:0]maxtime,wire endset,wire[3:0] maxuser,wire[3:0] scorejia,wire [3:0] scorejian
    );
    
    reg [7:0]maxtime1;
    reg [3:0]scorejia1;
    reg [3:0]scorejian1;
    reg [3:0]maxuser1=4'b0100;
    assign maxtime=maxtime1;
    assign scorejia=scorejia1;
    assign scorejian=scorejian1;
    assign maxuser=maxuser1;
   always@(posedge clk)
   case({jia1,jia2})
   2'b00:scorejia1=4'b0001;
   2'b01:scorejia1=4'b0010;
   2'b10:scorejia1=4'b0011;
   2'b11:scorejia1=4'b0101;
   endcase
   
    always@(posedge clk)
   case({jian1,jian2})
   2'b00:scorejian1=4'b0001;
   2'b01:scorejian1=4'b0010;
   2'b10:scorejian1=4'b0011;
   2'b11:scorejian1=4'b0100;
   endcase
       always@(posedge clk)
  case({time1,time2})
  2'b00:maxtime1=8'b00110000;
  2'b01:maxtime1=8'b00010000;
  2'b10:maxtime1=8'b01000000;
  2'b11:maxtime1=8'b00000101;
  endcase

  assign endset=~startset;
//    reg[7:0]maxtime1;reg[3:0] maxuser1;reg[3:0] scorejia1;reg[3:0] scorejian1;
//        assign maxtime=(maxtime1/10)*16+maxtime1%10;
//        assign maxuser=(maxuser1/10)*16+maxuser1%10;
//        assign scorejia=(scorejia1/10)*16+scorejia1%10;
//        assign scorejian=(scorejian1/10)*16+scorejian1%10;
//     always@(posedge nextset or posedge rst )   if(rst) t<=4'b1000; else if(startset) 
//        case(t)
//                     4'b1000: t<=4'b0100;
//                     4'b0100: t<=4'b0010;
//                     4'b0010: t<=4'b0001;
//                     4'b0001: t<=4'b1000;
//                     endcase
        
//     always@(posedge jia or posedge jian or posedge rst) if(rst)begin  maxtime1<=8'b0001_1110;maxuser1<=4'b0100;scorejia1<=4'b0010;scorejian1<=4'b0001;end  else
//                begin
//                if(startset&&jia)
//                begin 
//                case(t)
//                4'b1000: maxtime1<=maxtime1+1;
//                4'b0100: maxuser1<=maxuser1+1;
//                4'b0010: scorejia1<=scorejia1+1;
//                4'b0001: scorejian1<=scorejian1+1;
//                endcase
//                end 
                               
//                if(startset&&jian)
//                begin 
//                case(t)
//                4'b1000: maxtime1<=maxtime1-1;
//                4'b0100: maxuser1<=maxuser1-1;
//                4'b0010: scorejia1<=scorejia1-1;
//                4'b0001: scorejian1<=scorejian1-1;
//                endcase
                
//                  end
//                end
endmodule

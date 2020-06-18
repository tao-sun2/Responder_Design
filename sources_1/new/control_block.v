`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/11 23:57:58
// Design Name: 
// Module Name: control_block
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module control_block(
    input yes,no,endtime,starttimer,startgame,clk,stoptime,endset,startset,endgame,rst,
    output  show_time,
    output  show_who,
    output  show_set,
    output  show_score,
    output  show_ready
    );
     reg [4:0]statereg=5'b00001;
    assign show_time=statereg[4];
    assign show_who=statereg[3];
    assign show_set=statereg[2];
    assign show_score=statereg[1];
    assign show_ready=statereg[0];
   
    reg [4:0]statenext;
    always@(posedge clk,posedge rst)
    if(rst)
    statereg<=5'b00001;
    else
    statereg<=statenext;
    
//    always@ *
//    begin
////    if(startgame) {show_time,show_who,show_set,show_score,show_ready}<=5'b00001;else
//        if(endgame) {show_time,show_who,show_set,show_score,show_ready}<=5'b00010;else//������������ʾ�÷�
    
//    ///always@ (posedge starttimer)
//      case(  {show_time,show_who,show_set,show_score,show_ready})
//      5'b00001:if(starttimer){show_time,show_who,show_set,show_score,show_ready}<=5'b10000;//��ʼ��ʱ
 
//            5'b01000:
//           if(startgame)   {show_time,show_who,show_set,show_score,show_ready}<=5'b00001;//�ж���ɽ�����һ��
    
//            5'b10000:
//            if(stoptime){show_time,show_who,show_set,show_score,show_ready}<=5'b01000;// ��������
 
//               5'b10000:
//               if(endtime) {show_time,show_who,show_set,show_score,show_ready}<=5'b00001;  //  ��ʱ����û��������һ�� 

//               5'b00001:
//              if(startset) {show_time,show_who,show_set,show_score,show_ready}<=5'b00100;  //  ��ʼ���� 

//                  5'b00100:
//                  if(endset){show_time,show_who,show_set,show_score,show_ready}<=5'b00001;//��������
//             //     default:{show_time,show_who,show_set,show_score,show_ready}<=5'b00001;
//endcase
//end
always @*
case(statereg)
5'b00001:if(starttimer)statenext=5'b10000;else if(startset)statenext=5'b00100;else if(endgame) statenext=5'b00010;else statenext=5'b00001;//go
5'b10000: if(stoptime)statenext=5'b01000; else if(endtime)statenext=5'b00001;else statenext=5'b10000; //��ʱ
5'b01000:if(startgame)statenext=5'b00001;else statenext=5'b01000;                                   //�Ʒ�
5'b00100:if(endset)statenext=5'b00001;else statenext=5'b00100;                                     //����
5'b00010:statenext=5'b00010;                                                                        //����
endcase

endmodule 
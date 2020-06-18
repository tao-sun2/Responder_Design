module Responder(input clk,rst,showready,player1,player2,player3,player4,
[3:0] number_of_player, //������Χ2-4��������һλBCD���ʾ
output reg stoptimer,reg[3:0] result);
always@(posedge clk,negedge rst)begin
if(~rst)  //�첽��λ�ź�rst���г�ʼ��
    begin
    stoptimer<=1'b0;
    end
else if(showready) result<=4'b0000;
else begin if(stoptimer==0)
begin //ʹ������߼�����¼��һ����Ч����Ľ��,ʹ��ö�ٷ���ʵ������2-4�˲μ�
if( number_of_player==4)begin
    case({player1,player2,player3,player4})
        4'b1000: begin result= 4'b0001;stoptimer=1'b1;end
        4'b0100: begin result= 4'b0010;stoptimer=1'b1;end
        4'b0010: begin result= 4'b0011;stoptimer=1'b1; end
        4'b0001: begin  result= 4'b0100;stoptimer=1'b1; end
        default:  result=result ; 
    endcase 
end
else if( number_of_player==3)begin
      case({player1,player2,player3,player4})
          4'b1000:begin result= 4'b0001;stoptimer=1'b1; end
          4'b0100:begin result= 4'b0010;stoptimer=1'b1;  end
          4'b0010: begin result= 4'b0011;stoptimer=1'b1;end
          4'b1001: begin result= 4'b0001;stoptimer=1'b1;end
          4'b0101: begin result= 4'b0010;stoptimer=1'b1; end
          4'b0011: begin result= 4'b0011;stoptimer=1'b1; end
          default: result=result;
      endcase 
end     
else if( number_of_player==2) begin
      case({player1,player2,player3,player4})
          4'b1000:begin result= 4'b0001;stoptimer=1'b1; end
          4'b0100:begin result= 4'b0010;stoptimer=1'b1; end
          4'b1001:begin result= 4'b0001;stoptimer=1'b1; end
          4'b0101: begin result= 4'b0010;stoptimer=1'b1; end
          4'b1010: begin result= 4'b0001;stoptimer=1'b1; end
          4'b0110: begin result= 4'b0010;stoptimer=1'b1; end
          4'b1011: begin result= 4'b0001;stoptimer=1'b1; end
          4'b0111: begin result= 4'b0010;stoptimer=1'b1; end
          default: result=result;
      endcase
end
end 
end 
end
endmodule
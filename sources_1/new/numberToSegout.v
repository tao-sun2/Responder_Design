module numberToSegout(numDecimal, digit, en_p ,seg_out);
input [3:0] numDecimal;
input [3:0] digit;
input [7:0] en_p;
output [7:0] seg_out;

reg [6:0] seg_outNum;
reg en_point;

assign seg_out = {en_point,seg_outNum};

always @*
begin
    en_point = en_p[digit];
end

always @*
begin
    case(numDecimal)
        4'b0000: seg_outNum = 7'b1000000;
        4'b0001: seg_outNum = 7'b1111001;
        4'b0010: seg_outNum = 7'b0100100;
        4'b0011: seg_outNum = 7'b0110000;
        4'b0100: seg_outNum = 7'b0011001;
        4'b0101: seg_outNum = 7'b0010010;
        4'b0110: seg_outNum = 7'b0000010;
        4'b0111: seg_outNum = 7'b1111000;
        4'b1000:seg_outNum = 7'b0000000;
        4'b1001: seg_outNum= 7'b0010000;
        4'b1010: seg_outNum = 7'b0001000;  
        4'b1011: seg_outNum = 7'b0000011;
        4'b1100: seg_outNum = 7'b1000110;
        4'b1101: seg_outNum= 7'b0100001;
        4'b1110: seg_outNum = 7'b0000110;
        4'b1111: seg_outNum= 7'b1000010; //为了显示GO，这一位显示的是G
        default: seg_outNum = 7'b1111111;
    endcase
end

endmodule

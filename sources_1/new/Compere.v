module Compere(input clk,rst,start,output reg to_timer);
always @(posedge clk,posedge rst) begin
    if(rst)
    begin
    to_timer<=1'b0;
    end
else begin
    if(start) 
    begin
        to_timer<=1'b1;
    end    
    else 
        to_timer<=1'b0;
end
end     
endmodule
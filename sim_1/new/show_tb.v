`timescale 1ns / 1ps
module show_tb();
wire clk;
reg clk1=0;
assign clk=clk1;
wire [3:0]bit7,bit6,bit5,bit4,bit3,bit2,bit1,bit0;
reg[3:0]number=4'b0000;
wire [7:0]seg_en;
wire [7:0]seg_out;
assign bit7=number;
assign bit6=number;
assign bit5=number;
assign bit4=number;
assign bit3=number;
assign bit2=number;
assign bit1=number;
assign bit0=number;
scan_show scan(clk,
                 bit7,
                 bit6,
                 bit5,
                 bit4,
                 bit3,
                 bit2,
                 bit1,
                 bit0,
                 8'b11111111,
                 8'b00000000,
                 seg_en,
                 seg_out
);
initial
forever
#1 clk1=~clk1;

initial
begin
repeat(16)
#20 number=number+1;
end
endmodule

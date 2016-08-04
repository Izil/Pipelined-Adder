`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:48 03/11/2016 
// Design Name: 
// Module Name:    pipeLinedAdder16Bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module pipeLinedAdder16Bit(clk,a,b,cIn,sum,cOut);

input [15:0]a;
input [15:0]b;
input cIn;
input clk;

output wire cOut;
output wire [15:0]sum;

//inputReg;
reg [7:0] irbHigh;
reg [7:0] irbLow;
reg [7:0] iraHigh;
reg [7:0] iraLow;
reg irc;

//pipeLineReg;
reg [7:0] prSum;
reg prc;
reg [7:0]praHigh;
reg [7:0]prbHigh;

//outputReg;
reg [7:0]orSumLow;
reg [7:0]orSumHigh;
reg orcOut;

//middleman wires
wire w_irc;
wire [7:0]w_al;
wire [7:0]w_bl;

wire [7:0]w_prSum;
wire w_prcOut;

wire [7:0]w_orSumHigh;
wire w_orcOut;

initial
begin
	irbHigh = 0;
	irbLow = 0;
	iraHigh = 0;
	iraLow = 0;
	irc = 0;
	
	prSum = 0;
	prc = 0;
	praHigh = 0;
	prbHigh = 0;
	
	orSumHigh = 0;
	orSumLow = 0;
	orcOut = 0;
end
	
assign w_irc = irc;
assign w_al = iraLow;
assign w_bl = irbLow;

assign sum[15:8] = orSumHigh;
assign sum[7:0] = orSumLow;
assign cOut = orcOut;

rippleCarry8Bit u1(w_al,w_bl,w_irc,w_prSum,w_prcOut);
rippleCarry8Bit u2(praHigh,prbHigh,prc,w_orSumHigh,w_orcOut);
	
always@(posedge clk)
begin
	irbHigh <= b[15:8];
	irbLow <= b[7:0];
	iraHigh <= a[15:8];
	iraLow <= a[7:0];
	irc <= cIn;
	
	prbHigh <= irbHigh;
	praHigh <= iraHigh;
	prSum <= w_prSum;
	prc <= w_prcOut;
	
	orSumLow <= prSum;
	orSumHigh <= w_orSumHigh;
	orcOut <= w_orcOut;
	
end	

endmodule

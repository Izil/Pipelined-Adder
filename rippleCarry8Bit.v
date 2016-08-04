`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:42:02 03/10/2016 
// Design Name: 
// Module Name:    rippleCarry8Bit 
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
module rippleCarry8Bit(a,b,cIn,sum,cOut);

input [7:0]a;
input [7:0]b;
input cIn;
output [7:0]sum;
output cOut;

wire [6:0]carries;

fullAdder a0(a[0],b[0],cIn,sum[0],carries[0]);
fullAdder a1(a[1],b[1],carries[0],sum[1],carries[1]);
fullAdder a2(a[2],b[2],carries[1],sum[2],carries[2]);
fullAdder a3(a[3],b[3],carries[2],sum[3],carries[3]);
fullAdder a4(a[4],b[4],carries[3],sum[4],carries[4]);
fullAdder a5(a[5],b[5],carries[4],sum[5],carries[5]);
fullAdder a6(a[6],b[6],carries[5],sum[6],carries[6]);
fullAdder a7(a[7],b[7],carries[6],sum[7],cOut);

endmodule

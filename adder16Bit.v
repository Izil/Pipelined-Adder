`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:49:04 03/11/2016 
// Design Name: 
// Module Name:    adder16Bit 
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
module adder16Bit(a,b,cIn,sum,cOut);

input [15:0]a;
input [15:0]b;
input cIn;

output [15:0]sum;
output cOut;

wire carry;

rippleCarry8Bit a1(a[7:0],b[7:0],cIn,sum[7:0],carry);
rippleCarry8Bit a2(a[15:8],b[15:8],carry,sum[15:8],cOut);

endmodule

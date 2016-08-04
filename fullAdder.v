`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:33:30 03/10/2016 
// Design Name: 
// Module Name:    fullAdder 
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
module fullAdder(x,y,cIn,sum,cOut);

	input x,y,cIn;

	output sum,cOut;

	wire sum,cOut;
	
	assign sum = x^y^cIn;
	assign cOut = ((x&y)|(x&cIn)|(y&cIn));

endmodule

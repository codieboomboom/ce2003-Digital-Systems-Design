`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:33:59 02/04/2019 
// Design Name: 
// Module Name:    top_FSM 
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
module top_FSM( input clk, rst, cancel, fifty, dollar,
					output [6:0] seg,
					output sClk, insert_coin, dispense, money_return);
	
	wire [1:0] st;
	wire clk_out;
	
	VendingMachine Lab1_FSM(.clk(clk_out), .rst(rst), .cancel(cancel) , .fifty(fifty) , .dollar(dollar), .insert_coin(insert_coin), 
	.dispense(dispense), .money_return(money_return),.st(st));
	
	clkgen clkgen (.clk_in (clk), .clk_out(clk_out));
	
	assign sClk = clk_out;
	
	sevenseg seven_seg(.seg(seg), .a(st));


endmodule

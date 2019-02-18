`timescale 1ns/1ps
module VendingMachine (input fifty, dollar, cancel, rst, clk,
						output reg insert_coin, money_return, dispense,
						output reg [1:0] st);
	reg [1:0] nst;					
	parameter INIT= 2'b00, S50c = 2'b01, VEND = 2'b10, RETURN = 2'b11;
	always@(posedge clk)
		begin
			if(!rst)
				st <= INIT;
			else 
				st <= nst;
		end

	always@*
		begin
			nst = st;
			insert_coin = 1'b0;
			money_return = 1'b0;
			dispense = 1'b0;
			case(st)
				INIT:begin
					if(fifty)
						nst = S50c;
					if(dollar)
						nst = VEND;
					end
				S50c:begin
					insert_coin = 1'b1;
					if (fifty)
						nst = VEND;
					if(dollar)
						nst = RETURN;
					if(cancel)
						nst = RETURN;
					end
				VEND:
					dispense = 1'b1;
				RETURN:begin
					money_return = 1'b1;
					nst = INIT;
					end
			endcase
		end
		
endmodule
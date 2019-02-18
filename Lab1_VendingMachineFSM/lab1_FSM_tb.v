`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:50:10 01/31/2019
// Design Name:   VendingMachine
// Module Name:   /home/ise/CE2003_Lab1/lab1_FSM_tb.v
// Project Name:  CE2003_Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VendingMachine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lab1_FSM_tb();
	reg fifty_tb, dollar_tb, cancel_tb, rst_tb, clk;
	wire [1:0] st;
	
	// Instantiate the Unit Under Test (UUT)
	VendingMachine uut (.fifty(fifty_tb),.dollar(dollar_tb),.cancel(cancel_tb),
				.rst(rst_tb), .clk(clk), .st(st));

	initial begin
		// Initialize Inputs
		fifty_tb = 1'b0;
		dollar_tb = 1'b0;
		cancel_tb = 1'b0;
		clk = 1'b0;
		rst_tb = 1'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 rst_tb = 1'b1; //in INIT
		#10 fifty_tb = 1'b1; //TO 50c
		#10 fifty_tb = 1'b0; 
		#10 fifty_tb = 1'b1; // TO VEND
		#10 fifty_tb = 1'b0;
		#10 rst_tb = 1'b1;
		#10 rst_tb = 1'b0; //Reset
		#10 rst_tb = 1'b1;
		#10 dollar_tb = 1'b1; //To VEND
		#10 dollar_tb = 1'b0;
		#10 rst_tb = 1'b1;
		#10 rst_tb = 1'b0; //Reset 
		#10 rst_tb = 1'b1; 
		#10 fifty_tb = 1'b1; //to 50C
		#10 fifty_tb = 1'b0;
		#10 dollar_tb = 1'b1; //to RETURN
		#10 dollar_tb = 1'b0; //To INIT
		#10 rst_tb = 1'b1; 
		#10 fifty_tb = 1'b1; //to 50c
		#10 fifty_tb = 1'b0;
		#10 cancel_tb = 1'b1; //to RETURN
		#10 cancel_tb = 1'b0; //to INIT
		#10 rst_tb = 1'b1;
		$finish();

	end
	
	always #5 clk = ~clk;
      
endmodule


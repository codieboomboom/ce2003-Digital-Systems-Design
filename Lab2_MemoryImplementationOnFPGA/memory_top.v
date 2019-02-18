`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:50 02/18/2019 
// Design Name: 
// Module Name:    memory_top 
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
module memory_top(
    input clk,
    input rst,
    input write_en,
    input save_data,
    input show_reg,
    input [7:0] d_in,
    output [7:0] d_out
    );

wire clk_drive;
wire write_en_deb;
wire save_data_deb;

clock_gen clk_gen(.i_clk(clk),.o_clk(clk_drive));
debounce deb1(.i_clk(clk_drive),.i_swtch(write_en),.o_pulse(write_en_deb));
debounce deb2(.i_clk(clk_drive),.i_swtch(save_data),.o_pulse(save_data_deb));
memory mem(.clk(clk_drive),.rst(rst),.write_en(write_en_deb),.save_data(save_data_deb),.show_reg(show_reg),.d_in(d_in),.d_out(d_out));

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Allie Victorino
// 
// Create Date: 10/04/2026 06:31:01 PM
// Design Name: 
// Module Name: register_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register_file(
    input clk,
    input RegWrite,
    input[3:0] read_reg1,
    input[3:0] read_reg2,
    input[3:0] write_reg,
    input[15:0] write_data,
    output[15:0] read_data1,
    output[15:0] read_data2
    );

    //add array for registers
    //move data from readreg1 to output
    //might split up
    //reg [15:0] regs [0:15]

    always @(posedge clk) begin
        if (RegWrite) begin
	     //redo this
	     //value for data needs to be placed in reg for a write
	//if regwrite flag is not on
    end
endmodule
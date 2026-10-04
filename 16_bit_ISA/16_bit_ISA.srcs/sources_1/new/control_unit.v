`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jacob Bemis
// 
// Create Date: 10/04/2026 05:12:11 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [15:12] opcode,
    input [3:0] func,
    output RegDst,
    output Branch,
    output MemRead,
    output MemToReg,
    output [3:0] ALUOP,
    output MemWrite,
    output ALUSrc,
    output RegWrite
    );
endmodule

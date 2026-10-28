`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: MUX2
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


module MUX2(
    input MemToReg,
    input [15:0] alu_result,
    input [15:0] read_data,
    output reg [15:0] write_data
    );
    always @(*) begin
        case(MemToReg)
            1'b0: write_data <= alu_result;
            1'b1: write_data <= read_data;
            default:;
        endcase
    end
endmodule

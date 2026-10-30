`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: MUX1
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


module MUX1(
    input alu_src,
    input [15:0] read_data2,
    input [15:0] immediate_out,
    output reg [15:0] new_y
    );
    always @(*) begin
        case(alu_src)
        1'b0: new_y <= read_data2;
        1'b1: new_y <= immediate_out;
        default:;
        endcase
    end
endmodule

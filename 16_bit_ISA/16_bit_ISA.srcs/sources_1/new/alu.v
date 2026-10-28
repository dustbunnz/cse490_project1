`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: alu
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


module alu(
    input [1:0] alu_op,
    input cu_zero,
    input [15:0] x,
    input [15:0] y,
    output reg [15:0] result,
    output reg zero
    );
    always @(*) begin
        case(alu_op)
            2'b00: result <= x + y;
            2'b01: result <= x - y;
            2'b10: result <= y << x;
            2'b11: result <= x & y;
            default:;
        endcase
        case(cu_zero)
            1'b0: begin
                case(result == 16'b0)
                    1'b0: zero <= 1'b0;
                    1'b1: zero <= 1'b1;
                    default:;
                endcase
            end
            1'b1: begin
                case(result == 16'b0)
                    1'b0: zero <= 1'b1;
                    1'b1: zero <= 1'b0;
                    default:;
                endcase
            end
            default: zero <= 1'b0;
        endcase
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UB
// Engineer: Jacob Bemis
// 
// Create Date: 10/04/2026 03:00:19 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input clk,
    input rst,
    input [15:0] next_pc,
    output reg [15:0] pc_out
    );


    always @(posedge clk) begin 
        if (rst)
            pc_out <= 16'h0000; // reset 
        else 
            pc_out <= next_pc;
    end 
endmodule

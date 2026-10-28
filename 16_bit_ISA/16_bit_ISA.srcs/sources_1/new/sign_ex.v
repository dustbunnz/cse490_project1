`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: sign_ex
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


module sign_ex(
    input [3:0] immediate_in,
    output [15:0] immediate_out
    );
    assign immediate_out = {immediate_in[3], immediate_in[3], immediate_in[3], immediate_in[3], immediate_in[3], immediate_in[3], immediate_in[3], immediate_in[3], immediate_in[3], immediate_in[3], immediate_in[3], immediate_in[3], immediate_in};
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2026 09:21:01 PM
// Design Name: 
// Module Name: signex_tb
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


module signex_tb();
    reg [3:0] immediate_in;
    wire [15:0] immediate_out;
    sign_ex uut (
        .immediate_in(immediate_in),
        .immediate_out(immediate_out)
    );
    
    initial begin
        immediate_in = 4'b1111;
        #20;
        $display("test pos, should be FFFF: %h",immediate_out);
        
        immediate_in = 4'b0111;
        #20;
        $display("test neg, should be 0000000000000111: %b",immediate_out);
        $finish;
    end
endmodule

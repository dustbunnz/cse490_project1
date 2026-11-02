`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
    reg [1:0] alu_op;
    reg cu_zero;
    reg [15:0] x;
    reg [15:0] y;
    wire [15:0] result;
    wire zero;
    
    alu uut (
        .alu_op(alu_op),
        .x(x),
        .y(y),
        .result(result),
        .zero(zero)
    );
    
    initial begin
    
    alu_op = 2'b00;
    x = 16'd21;
    y = 16'd20;
    #20;
    $display("add test, should be 41: %d",result);
    
    alu_op = 2'b01;
    x = 16'd21;
    y = 16'd20;
    #20;
    $display("sub test, should be 1: %d",result);
    
    alu_op = 2'b10;
    x = 16'b0000000000000001;
    y = 16'd1;
    #20;
    $display("sll test, should be 0000000000000010: %b",result);
    
    alu_op = 2'b11;
    x = 16'h00FF;
    y = 16'hFF00;
    #20;
    $display("and test, should be 0000: %h",result);
    
    $finish;
    end
endmodule

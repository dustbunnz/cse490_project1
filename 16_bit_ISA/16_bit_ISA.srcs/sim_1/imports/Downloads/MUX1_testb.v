`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2026 09:44:04 PM
// Design Name: 
// Module Name: MUX1_testb
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


module MUX1_testb();
    reg alu_src;
    reg [15:0] read_data2;
    reg [15:0] immediate_out;
    wire [15:0] new_y;
    MUX1 uut (
        .alu_src(alu_src),
        .read_data2(read_data2),
        .immediate_out(immediate_out),
        .new_y(new_y)
    );
    initial begin
        read_data2 = 16'hFFFF;
        alu_src = 1'b0;
        #20;
        $display("alu_src off, should be FFFF: %h",new_y);
        
        immediate_out = 16'h0000;
        alu_src = 1'b1;
        #20;
        $display("alu_src on, should be 0000: %h",new_y);
        $finish;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2026 09:55:07 PM
// Design Name: 
// Module Name: MUX2_testb
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


module MUX2_testb();
    reg MemToReg;
    reg [15:0] alu_result;
    reg [15:0] read_data;
    wire [15:0] write_data;
    MUX2 uut (
        .MemToReg(MemToReg),
        .alu_result(alu_result),
        .read_data(read_data),
        .write_data(write_data)
    );
    
    initial begin
        alu_result = 16'hFFFF;
        MemToReg = 1'b0;
        #20
        $display("mem2reg off, should be ffff: %h",write_data);
        read_data = 16'h0000;
        MemToReg = 1'b1;
        #20
        $display("mem2reg on, should be 0000: %h",write_data);
        $finish;
    end
endmodule

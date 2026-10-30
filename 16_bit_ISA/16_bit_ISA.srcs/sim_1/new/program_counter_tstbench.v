`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2026 12:04:32 PM
// Design Name: 
// Module Name: program_counter_tstbench
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


module program_counter_tstbench();

    reg         clk;
    reg         rst;
    reg  [15:0] next_pc;
    wire [15:0] pc_out;

    program_counter uut (
        .clk(clk),
        .rst(rst),
        .next_pc(next_pc),
        .pc_out(pc_out)
    );

    // Clock: 10 time unit period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Start with reset 
        rst = 1; next_pc = 16'h0004;

        @(negedge clk);
        $display("t=%0t rst=%b next_pc=%h pc_out=%h (expect 0000)", $time, rst, next_pc, pc_out);

        rst = 0; next_pc = 16'h0002;
        @(negedge clk);
        $display("t=%0t rst=%b next_pc=%h pc_out=%h (expect 0002)", $time, rst, next_pc, pc_out);

        next_pc = 16'h0004;
        @(negedge clk);
        $display("t=%0t rst=%b next_pc=%h pc_out=%h (expect 0004)", $time, rst, next_pc, pc_out);

        next_pc = 16'h0100;
        @(negedge clk);
        $display("t=%0t rst=%b next_pc=%h pc_out=%h (expect 0100)", $time, rst, next_pc, pc_out);

        rst = 1; next_pc = 16'h0200;
        @(negedge clk);
        $display("t=%0t rst=%b next_pc=%h pc_out=%h (expect 0000)", $time, rst, next_pc, pc_out);

        rst = 0; next_pc = 16'h0006;
        @(negedge clk);
        $display("t=%0t rst=%b next_pc=%h pc_out=%h (expect 0006)", $time, rst, next_pc, pc_out);

        $finish;
    end

endmodule
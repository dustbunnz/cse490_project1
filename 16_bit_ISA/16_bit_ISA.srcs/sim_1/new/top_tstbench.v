`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2026 04:31:34 PM
// Design Name: 
// Module Name: top_tstbench
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


module top_tstbench(
    );

    reg clk;
    reg rst;

    top uut (
        .clk(clk),
        .rst(rst)
    );

    // Clock: 10 ns period (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    // Reset + run
    initial begin
        rst = 1;
        #20;            
        rst = 0;

        #500;           
        $finish;
    end

    // Monitor internal signals via hierarchical references
    initial begin
        $monitor("t=%0t pc=%h instr=%h rd1=%h rd2=%h alu=%h wd=%h",
                 $time,
                 uut.pc_out, uut.instr,
                 uut.read_data1, uut.read_data2,
                 uut.result, uut.write_data);
    end

endmodule

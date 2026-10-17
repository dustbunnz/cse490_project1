`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2026 07:38:03 PM
// Design Name: 
// Module Name: instr_mem_tstbench
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

module instr_mem_tstbench();

    reg  [15:0] addr;
    wire [15:0] instr;

    instr_mem uut (
        .addr(addr),
        .instr(instr)
    );

    integer i;

    initial begin
        addr = 16'h0000;
        #10;

        // walk through the first 16 instructions, 2 bytes apart
        for (i = 0; i < 16; i = i + 1) begin
            addr = i * 2;
            #10;
            $display("t=%0t addr=%h instr=%h", $time, addr, instr);
        end

        #10 $finish;
    end

endmodule
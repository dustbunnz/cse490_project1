`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2026 03:47:20 PM
// Design Name: 
// Module Name: data_mem_tstbench
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

module data_mem_tstbench();

    reg         clk;
    reg  [15:0] addr;
    reg  [15:0] write_data;
    reg         mem_write;
    reg         mem_read;
    wire [15:0] read_data;

    data_mem uut (
        .clk(clk),
        .addr(addr),
        .write_data(write_data),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .read_data(read_data)
    );

    // Clock: 10 time unit period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initialize
        addr = 0; write_data = 0; mem_write = 0; mem_read = 0;

        // ---- Testing writing to memory ----
        @(negedge clk);
        addr = 16'h0000; write_data = 16'h00A2; mem_write = 1; mem_read = 0;

        @(negedge clk);
        addr = 16'h0002; write_data = 16'hF00D; mem_write = 1; mem_read = 0;

        @(negedge clk);
        addr = 16'h0004; write_data = 16'h5EA1; mem_write = 1; mem_read = 0;

        @(negedge clk);
        addr = 16'h0004; write_data = 16'h0001; mem_write = 1; mem_read = 1;

        @(negedge clk);
        addr = 16'h0002; write_data = 16'h4321; mem_write = 1; mem_read = 0;

        // ---- Testing reading memory ----
        @(negedge clk);
        addr = 16'h0000; mem_write = 0; mem_read = 1;
        #1 $display("t=%0t addr=%h read_data=%h", $time, addr, read_data);

        @(negedge clk);
        addr = 16'h0002; mem_write = 0; mem_read = 1;
        #1 $display("t=%0t addr=%h read_data=%h", $time, addr, read_data);

        @(negedge clk);
        addr = 16'h0004; mem_write = 0; mem_read = 1;
        #1 $display("t=%0t addr=%h read_data=%h", $time, addr, read_data);

        @(negedge clk);
        addr = 16'h0002; mem_write = 0; mem_read = 1;
        #1 $display("t=%0t addr=%h read_data=%h", $time, addr, read_data);

        @(negedge clk);
        $finish;
    end

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Allie Victorno
// 
// Create Date: 10/17/2026 08:32:21 PM
// Design Name: 
// Module Name: register_file_testbench
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

module register_file_testbench();
    //this will need to be beefier in the future
    //works as of 22:18, oct 18th

    reg clk;
    reg RegWrite;
    reg[3:0] read_reg1;
    reg[3:0] read_reg2;
    reg[3:0] write_reg;
    reg[15:0] write_data;
    wire[15:0] read_data1;
    wire[15:0] read_data2;

    register_file dut (
        .clk(clk),
        .RegWrite(RegWrite),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    //used this tutorial for reference/learning: https://www.fpgatutorial.com/how-to-write-a-basic-verilog-testbench/

    initial begin
        clk = 1'b0;
        forever #1 clk = ~clk;
    end

    initial begin
        $monitor("time=%0t RegWrite=%b write_data=%h read_data1=%h", $time, RegWrite, write_data, read_data1);
        
        RegWrite = 1'b0;
        write_reg = 4'd0;
        read_reg1 = 4'd0;
        write_data = 16'h0000;
        #20;

        //no regwrite
        write_data = 16'haaaa;
        #20;

        //yes regwrite
        RegWrite = 1'b1;
        #20;

        $finish;
    end

endmodule : register_file_testbench
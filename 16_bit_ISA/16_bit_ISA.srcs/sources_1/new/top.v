`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2026 06:20:10 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst
    );
    
    wire [15:0] next_pc, pc_out;
    wire [15:0] instr;
    wire [15:0] write_data, read_data1, read_data2;
    wire [15:0] immediate_out;
    wire Branch, Zero, Jump, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite;
    wire [1:0] ALUOP;
    wire [15:0] new_y, result;
    wire zero_flag;
    wire [15:0] read_data;
    
    program_counter PC (
        .clk(clk), .rst(rst),
        .next_pc(next_pc), .pc_out(pc_out)
    );

    instr_mem IM (
        .addr(pc_out), .instr(instr)
    );

    
    register_file RF (
        .clk(clk), .RegWrite(RegWrite), 
        .read_reg1(instr[7:4]), .read_reg2(instr[11:8]),
        .write_reg(instr[11:8]), .write_data(write_data),
        .read_data1(read_data1), .read_data2(read_data2) 
    );
    
    sign_ex SE(
        .immediate_in(instr[3:0]), .immediate_out(immediate_out)
    );
    
    control_unit CU (
        .opcode(instr[15:12]), .func(instr[3:0]),
        .Branch(Branch), .Zero(Zero), .Jump(Jump), 
        .MemRead(MemRead), .MemToReg(MemToReg), .ALUOP(ALUOP),
        .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite)
    );

    
    alu ALU (
        .alu_op(ALUOP), .cu_zero(Zero), .x(read_data1), .y(new_y),
        .result(result), .zero(zero_flag)
    );
    
    MUX1 M1 (
        .alu_src(ALUSrc), .read_data2(read_data2), .immediate_out(immediate_out),
        .new_y(new_y) 
    );
    
    MUX2 M2 (
        .alu_result(result), .read_data(read_data),
        .write_data(write_data), .MemToReg(MemToReg)
    );


    PC_calc NEXTPC (
        .pc(pc_out), .imm(immediate_out), .Jmp_addr(instr[11:0]),
        .Jump(Jump), .Branch(Branch), .Zero(zero_flag),
        .next_pc(next_pc)
    );

    data_mem DM (
        .clk(clk), .addr(result), .write_data(read_data2),
        .mem_write(MemWrite), .mem_read(MemRead),
        .read_data(read_data)
    );

endmodule

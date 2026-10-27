`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 02:44:00 PM
// Design Name: 
// Module Name: control_unit_tstbench
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


module control_unit_tstbench(

    );
    
    reg  [3:0] opcode;
    reg  [3:0] func;
    
    wire       Branch;
    wire       Zero;
    wire       Jump;
    wire       MemRead;
    wire       MemToReg;
    wire [1:0] ALUOP;
    wire       MemWrite;
    wire       ALUSrc;
    wire       RegWrite;
    
    
    control_unit uut (
        .opcode   (opcode),
        .func     (func),
        .Branch   (Branch),
        .Zero     (Zero),
        .Jump     (Jump),
        .MemRead  (MemRead),
        .MemToReg (MemToReg),
        .ALUOP    (ALUOP),
        .MemWrite (MemWrite),
        .ALUSrc   (ALUSrc),
        .RegWrite (RegWrite)
    );
    integer i;
    
    initial begin 
    // Testing R-Type
   opcode = 4'b0000;
   for (i = 0; i < 15; i = i+1) begin
        func = 4'b0000 + i;
        #10
        $display("opcode=%b func=%b | Br=%b Zero=%b Jmp=%b MRd=%b M2R=%b ALUOP=%b MWr=%b ALUSrc=%b RegW=%b",
         opcode, func, Branch, Zero, Jump, MemRead, MemToReg, ALUOP, MemWrite, ALUSrc, RegWrite);
    end
    
    // Testing the other opcodes 
    for (i = 0; i < 15; i = i+1) begin
        opcode = 4'b0001 + i;
        #10
        $display("opcode=%b func=%b | Br=%b Zero=%b Jmp=%b MRd=%b M2R=%b ALUOP=%b MWr=%b ALUSrc=%b RegW=%b",
         opcode, func, Branch, Zero, Jump, MemRead, MemToReg, ALUOP, MemWrite, ALUSrc, RegWrite);
    end    
  
    #10
    $finish;
    end
    
    
endmodule

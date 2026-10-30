`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 03:51:25 PM
// Design Name: 
// Module Name: PC_calc_tstbench
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


module PC_calc_tstbench(
    );


    reg  [15:0] pc;
    reg  [15:0] imm;
    reg  [11:0] Jmp_addr;
    reg         Jump;
    reg         Branch;
    reg         Zero;

    wire [15:0] next_pc;

    // Unit under test
    PC_calc uut (
        .pc(pc),
        .imm(imm),
        .Jmp_addr(Jmp_addr),
        .Jump(Jump),
        .Branch(Branch),
        .Zero(Zero),
        .next_pc(next_pc)
    );

    initial begin
        pc = 16'h0000; imm = 16'h0000; Jmp_addr = 12'h000;
        Jump = 0; Branch = 0; Zero = 0;
        #10;

        // Sequential (pc + 2)
        pc = 16'h0010;
        #10;

        // Zero set
        Zero = 1;
        #10;

        // Branch taken, forward
        imm = 16'h0004; 
        Branch = 1; 
        Zero = 1;
        #10;

        // Branch taken, backward
        imm = 16'hFFFC;
        #10;

        // Branch not taken 
        Zero = 0;
        #10;

        // Jump
        Branch = 0; 
        Jump = 1; 
        Jmp_addr = 12'h008;
        #10;

        // Jump with max offset
        Jmp_addr = 12'hFFF;
        #10;

        // Branch taken and Jump both set (branch has priority)
        imm = 16'h0006; 
        Branch = 1; 
        Zero = 1; 
        Jump = 1; 
        Jmp_addr = 12'h010;
        #10;

        // Branch not taken, Jump set (jump wins)
        Zero = 0;
        #10;

        // pc wrap-around
        Jump = 0; 
        Branch = 0;
        pc = 16'hFFFE;
        #10;

        $finish;
    end

endmodule
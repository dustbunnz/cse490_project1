`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2026 05:08:55 PM
// Design Name: 
// Module Name: PC_calc
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


module PC_calc(
    input [15:0] pc,
    input [15:0] imm,
    input [11:0] Jmp_addr, 
    input Jump,
    input Branch,
    input Zero,
    output reg [15:0] next_pc
    );
    
    wire [15:0] pc_incre = pc + 2; 
    wire [15:0] pc_jmp = (Jmp_addr << 1) + pc_incre;
    wire [15:0] pc_bnch = (imm << 1) + pc_incre;
    
    always @(*) begin 
        if (Branch == 1 && Zero == 1) begin
            next_pc = pc_bnch;
        end else if (Jump == 1) begin 
            next_pc = pc_jmp;
        end else begin
            next_pc = pc_incre;
        end
        end
            
    
    
endmodule

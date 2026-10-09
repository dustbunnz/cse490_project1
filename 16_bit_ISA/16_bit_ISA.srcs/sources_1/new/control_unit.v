`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jacob Bemis
// 
// Create Date: 10/04/2026 05:12:11 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input wire [15:12] opcode,
    input wire [3:0] func,
    //output reg RegDst, -- might not need this, cuz we are only using two registers per instruction 
    output reg Branch,
    output reg Zero,// 1 -> inverts Zero flag in ALU, 0 -> Does nothing 
    output reg Jump,
    output reg MemRead,
    output reg MemToReg,
    output reg [1:0] ALUOP,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
    );
 
 always @(*) begin
 
        // TODO: Add reset for each signal
       case(opcode) 
       4'b0000 : begin 
            RegWrite = 1;
            ALUSrc = 0; // ALU takes second register
            case(func)
                4'b0000 : ALUOP = 2'b00; // add
                4'b0001 : ALUOP = 2'b01; // sub
                4'b0010 : ALUOP = 2'b10; // left shift
                4'b0011 : ALUOP = 2'b11; // and
            endcase
        end  
        4'b0001 : begin // lw
            RegWrite = 1;
            ALUSrc = 1; // ALU takes immediate
            ALUOP = 2'b00;
            MemRead = 1;
            MemToReg = 1; 
            MemWrite = 0;   
        end
        4'b0010 : begin // sw
            RegWrite = 0;
            ALUSrc = 1; // ALU takes immediate
            ALUOP = 2'b00;
            MemRead = 0;
            MemToReg = 0; 
            MemWrite = 1;
        end                                      
        4'b0011 : begin // addi
              RegWrite = 1;
              ALUSrc = 1;
              ALUOP = 2'b00;
              MemToReg = 0;
        end
        4'b0100 : begin // beq
              ALUSrc = 0;
              ALUOP = 2'b01;
              Branch = 1;
        end
        4'b0101 : begin // bne
              ALUSrc = 0;
              ALUOP = 2'b01;
              Zero = 1;
              Branch = 1;                              
        end                                  
       4'b0110 : begin // jmp
              Jump = 1;
       end             
    endcase 
    end            
                          
    
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UB
// Engineer: Jacob Bemis
// 
// Create Date: 10/04/2026 03:59:26 PM
// Design Name: 
// Module Name: instr_mem
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


module instr_mem(
    input [15:0] addr,
    output [15:0] instr
    );


reg[15:0] mem [0:254];

initial begin 
    $readmemh("../../../../instr_mem.txt", mem); // will create txt file later
end

assign instr = mem[addr[8:1]]; // assigns the output to the instruction stored at the memory address. Only memory addresses from 2 to 254 will be accessed
endmodule    
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jacob Bemis
// 
// Create Date: 10/04/2026 04:51:54 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input [15:0] addr,
    input [15:0] write_data,
    input mem_write,
    input mem_read,
    output reg [15:0] read_data
    );


   reg [15:0] mem [0:255]; // Memory array


always @(*) begin  
    if (mem_write == 1 && mem_read == 0) begin
        mem[addr] = write_data; // sw
    end else if (mem_read == 1 && mem_write == 0) begin 
        read_data = mem[addr]; // lw
    end
end                 

endmodule

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
    input clk,
    input clk_en,
    input [15:0] addr,
    input [15:0] write_data,
    input mem_write,
    input mem_read,
    output  [15:0] read_data
    );


   reg [15:0] mem [0:255]; // Memory array
   
always @(posedge clk) begin
    if (clk_en) begin
    if (mem_write == 1) begin 
        mem[addr[7:0]] <= write_data; // sw
    end 
    end
end    
    
assign read_data = mem_read ? mem[addr[7:0]] : 16'b0; // lw                   

endmodule

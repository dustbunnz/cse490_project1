`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2026 07:08:08 PM
// Design Name: 
// Module Name: fpga_top
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


module fpga_top #(parameter COUNT = 1_000_000 )(
    input clk,
    input rst,
    input step,
    input [3:0] reg_num,
    output [15:0] reg_val
    );
    
    reg sync;
    reg [31:0] counter = 0;
    reg stable;
    
    
    always @(posedge clk) begin 
         sync <= step;
    end 
    
    always @(posedge clk) begin 
         if (counter == COUNT) begin
            stable <= sync;
            counter <= 0;
        end else
            counter <= counter + 1;                        
    end 
    
    reg prev_state = 0;
    
    always @(posedge clk) prev_state <= stable;
    wire pulse = stable ^ prev_state;
    
    wire [255:0] reg_mem;
    
    top top_file (
        .clk(clk), .clk_en(pulse), .rst(rst),
        .reg_mem(reg_mem)
    );
    
    assign reg_val = reg_mem[reg_num*16 +: 16];
    
endmodule

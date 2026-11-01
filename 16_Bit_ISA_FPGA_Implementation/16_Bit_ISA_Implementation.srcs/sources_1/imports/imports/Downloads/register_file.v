`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Allie Victorino
// 
// Create Date: 10/04/2026 06:31:01 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
    input clk,
    input clk_en,
    input rst,
    input RegWrite,
    input[3:0] read_reg1,
    input[3:0] read_reg2,
    input[3:0] write_reg,
    input[15:0] write_data,
    output[15:0] read_data1,
    output[15:0] read_data2,
    output [255:0] mem_array
    );
    
    
    reg [15:0] regs [0:15];
    
    integer i;
    initial begin
    for (i = 0; i < 16; i = i + 1)
        regs[i] = 16'b0;
    end

    //read_data1 <= regs[read_reg1];
    //read_data2 <= regs[read_reg2];
    //fixed after referencing pointer slides
    assign read_data1 = regs[read_reg1];
    assign read_data2 = regs[read_reg2];

    always @(posedge clk)
    begin
        if (rst) begin
            for (i = 0; i < 16; i = i + 1)
                regs[i] <= 16'b0;
        end if (clk_en) begin
        case(RegWrite)
            1'b1: regs[write_reg] <= write_data;
            default:;
        endcase
        end
    end
    
    genvar j;
    generate
    for (j = 0; j < 16; j = j + 1) begin
        assign mem_array[j*16 +: 16] = regs[j];
    end
endgenerate

endmodule
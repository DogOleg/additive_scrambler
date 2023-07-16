`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2023 04:04:51 PM
// Design Name: 
// Module Name: scrambler
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


module scrambler #(localparam [31:0] polinom, localparam [31:0] init)
(
    input in,
    input set,
    input clk,
    input rst_,
    output logic out    
);

logic [31:0] key_reg;
logic XOR;
always @(posedge clk or negedge rst_)
begin
    if (!rst_) begin
        key_reg = '0;
    end else begin
        if (set) begin
            key_reg <= init;
            XOR <= 0;
        end
    end

end

always_comb
begin
    for (int i = 0; i < 32; i = i + 1)
    begin
        if (polinom[i] == 1) begin
            XOR = XOR ^ key_reg[i];
        end
    end
    out = in ^ XOR;
end
    



endmodule

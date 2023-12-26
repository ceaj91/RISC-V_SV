`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2023 08:14:24 AM
// Design Name: 
// Module Name: extend
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


module extend(
    input logic [31:7] instr,
    input logic [1:0] immsrc,
    output logic [31:0] immext
    );
    
    always_comb
        case(immsrc)
//                // I-type
//        3'b000:   immext = {{20{instr[31]}}, instr[31:20]};
//                // S-type
//        3'b001:   immext = {{20{instr[31]}}, instr[31:25], instr[11:7]};
//                //B-type branches
//        3'b010:  immext = {{20{instr[31]}},instr[7], instr[30:25],instr[11:8], 1'b0};
//                //J-type jal
//        3'b011:   immext = { {12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0 };
//                //U-type auipc
//        3'b100:  immext = { instr[31:12] , {12{1'b0}} };
        
//        default: immext = 32'bx;
        2'b00:immext = {{20{instr[31]}}, instr[31:20]};
        2'b01:immext = {{20{instr[31]}}, instr[31:25], instr[11:7]};
        2'b10:immext = {{20{instr[31]}},instr[7], instr[30:25],instr[11:8], 1'b0};
        2'b11:immext = { {12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0 };
        default: immext = 32'bx;
        endcase
endmodule

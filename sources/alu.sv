`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2023 09:32:18 AM
// Design Name: 
// Module Name: alu
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


module alu(input logic [31:0] SrcA,SrcB,
           input logic [2:0] ALUControl,
           output logic [31:0] ALUResult,
           output logic Zero
//           output logic LTZ
    );
    
    logic signed [31:0]arithmetic_shift_right;
    
    assign arithmetic_shift_right = $signed(SrcA) >>>  SrcB[4:0];
    always_comb
        case(ALUControl)
//            4'b0000: ALUResult = signed'(SrcA) + signed'(SrcB);
//            4'b0001: ALUResult = signed'(SrcA)-signed'(SrcB);
//            4'b0010: ALUResult = SrcA & SrcB;
//            4'b0011: ALUResult = SrcA | SrcB;
//            4'b0100: ALUResult = SrcA ^ SrcB;
//            4'b0101: if(signed'(SrcA) < signed'(SrcB))
//                        ALUResult = 32'd1;
//                    else
//                        ALUResult = 32'd0;
//            4'b0110: ALUResult = SrcA >> SrcB[4:0]; //shift right logical
//            4'b0111: ALUResult = SrcA << SrcB[4:0];//shift left   logical 
//            4'b1000: ALUResult = arithmetic_shift_right;//shift right arithmetic
//            //4'b1001: if(unsigned'(SrcA) < unsigned'(SrcB))
//                        ALUResult = 32'd1;
//                    else
//                        ALUResult = 32'd0;

            
//            default : ALUResult = 32'bx;

            3'b000:ALUResult = signed'(SrcA) + signed'(SrcB);
            3'b001:ALUResult = signed'(SrcA)-signed'(SrcB);
            3'b010:ALUResult = SrcA & SrcB;
            3'b011:ALUResult = SrcA | SrcB;
            3'b100:ALUResult = SrcA ^ SrcB;
            //2'b100:
            3'b101:if(signed'(SrcA) < signed'(SrcB))
                        ALUResult = 32'd1;
                    else
                        ALUResult = 32'd0;
            3'b110: ALUResult = SrcA >> SrcB[4:0];
            3'b111: ALUResult = SrcA << SrcB[4:0];
            default : ALUResult = 32'bx;
        endcase
        
     always_comb
        if(ALUResult === 32'd0)
            Zero = 1'b1;
        else
            Zero = 1'b0;
          
//      always_comb
//        if(ALUResult[31] === 1'b1)
//            LTZ = 1'b1;
//        else
//            LTZ = 1'b0;  
            
endmodule

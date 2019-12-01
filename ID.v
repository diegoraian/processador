//Banco de Registradores

module BancoDeRegistradores(clock, reset, hazard, enderecoEscrita, dadosEscrita, enderecoLeitura, dadosLeitura,registradorEscrita, link, dadosLink)      
//Parâmetros
input wire clock,
input wire reset,
input wire hazard,
input wire link,
input wire [31:0] dadosLink;
input wire [31:0] enderecoEscrita;
input wire [31:0] dadosEscrita;
input wire [4:0]  enderecoLeitura;
output wire [31:0] dadosLeitura;
input wire  registradorEscrita;

reg[31:0] registradores [31:0];

assign readData = registradores[enderecoLeitura];

always @(negedge clock) begin
  if(reset) begin
      registradores[0] <= 32'h00000000;
      registradores[1] <= 32'h00000000;
      registradores[2] <= 32'h00000000;
      registradores[3] <= 32'h00000000;
      registradores[4] <= 32'h00000000;
      registradores[5] <= 32'h00000000;
      registradores[6] <= 32'h00000000;
      registradores[7] <= 32'h00000000;
      registradores[8] <= 32'h00000000;
      registradores[9] <= 32'h00000000;
      registradores[10] <= 32'h00000000;
      registradores[11] <= 32'h00000000;
      registradores[12] <= 32'h00000000;
      registradores[13] <= 32'h00000000;
      registradores[14] <= 32'h00000000;
      registradores[15] <= 32'h00000000;
      registradores[16] <= 32'h00000000;
      registradores[17] <= 32'h00000000;
      registradores[18] <= 32'h00000000;
      registradores[19] <= 32'h00000000;
      registradores[20] <= 32'h00000000;
      registradores[21] <= 32'h00000000;
      registradores[22] <= 32'h00000000;
      registradores[23] <= 32'h00000000;
      registradores[24] <= 32'h00000000;
      registradores[25] <= 32'h00000000;
      registradores[26] <= 32'h00000000;
      registradores[27] <= 32'h00000000;
      registradores[28] <= 32'h00000000;
      registradores[29] <= 32'h00000000;
      registradores[30] <= 32'h00000000;
      registradores[31] <= 32'h00000000;
  end else begin
      if(link)
        registradores[31] <= dadosLink;

      if (registradorEscrita && enderecoEscrita != 32'h00000000)
        registradores[enderecoEscrita] <= dadosEscrita;
  end
end

endmodule;


/**
	Controladode de memória de instruções
**/
      module ControladorDeMemoriaDeInstrucoes(opcode,funct, hazard, ULAOp,  IsImd, IsShift, Link, MemRead, MemWrite, PCSrc, RegWrite );
          input  wire [5:0] opcode,
          input  wire [5:0] funct,
          input  wire       hazard,  
        	output reg  [3:0] ULAOp,
          output reg        IsImd,
          output reg        IsShift,
          output wire       Link,
          output wire       MemRead,
          output wire       MemWrite,
          output reg  [1:0] PCSrc,
          output reg        RegWrite
        assign Link     = ~hazard & (opcode == `JPC);
    		assign MemRead  = ~hazard & (opcode == `LW);
    		assign MemWrite = ~hazard & (opcode == `SW);

        always @(*) begin
            if (hazard)
                begin 
                  ULAOp <= 0; 
                  IsImd <= 0; 
                  IsShift <= 0; 
                  PCSrc <= 0; 
                  RegWrite <= 0; 
                end
            else 
              begin
                case (opcode)
                  6'b000000: case (funct)
                      					`ADD:  begin ULAOp <= `ULA_ADD; IsImd <= 0; IsShift <= 0; PCSrc <= 0; RegWrite <= 1; end
                      					`SUB:  begin ULAOp <= `ULA_SUB; IsImd <= 0; IsShift <= 0; PCSrc <= 0; RegWrite <= 1; end
                      					`AND:  begin ULAOp <= `ULA_AND; IsImd <= 0; IsShift <= 0; PCSrc <= 0; RegWrite <= 1; end
                      					`OR:   begin ULAOp <= `ULA_OR;  IsImd <= 0; IsShift <= 0; PCSrc <= 0; RegWrite <= 1; end
                    						`SHR:  begin ULAOp <= `ULA_SHR; IsImd <= 0; IsShift <= 1; PCSrc <= 0; RegWrite <= 1; end
                                `SHL;  begin ULAOp <= `ULA_SHL; IsImd <= 0; IsShift <= 1; PCSrc <= 0; RegWrite <= 1; end
                    	   				default:  
                                  		 begin ULAOp <= 0;        IsImd <= 0; IsShift <= 0; PCSrc <= 0; RegWrite <= 0; end
                  					 endcase
                  `JR:   begin ULAOp <= `ULA_JR;  IsImd <= 0; IsShift <= 0; PCSrc <= 2; RegWrite <= 0; end
                  `JPC:  begin ULAOp <= `ULA_JPC; IsImd <= 0; IsShift <= 0; PCSrc <= 2; RegWrite <= 0; end
                  `LW:   begin ULAOp <= `ULA_LW;  IsImd <= 1; IsShift <= 0; PCSrc <= 0; RegWrite <= 1; end
                  `SW:   begin ULAOp <= `ULA_SW;  IsImd <= 1; IsShift <= 0; PCSrc <= 0; RegWrite <= 0; end
                	default:   
                    		 begin ULAOp <= 0;       IsImd <= 0; IsShift <= 0; PCSrc <= 0; RegWrite <= 0; end
                endcase
            end
        end

endmodule
      
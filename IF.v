//
//	PC - Contador de programa
//
module PC(input wire [31:0]  entrada, output reg [31:0] saida, input wire clk, input wire reset, input wire hazard);
	always @ (posedge clk or posedge rst)
		begin
			if(reset) begin
				saida <= 0;
      else  if (~hazard)
        begin
					saida <= entrada;
				end
		end
endmodule;
      
      
      
      
/*
    Modulo: MemoriaDeInstrução
    Este módulo tem como objetivo guardar todas as instruções que serão utilizadas pelo nosso processador
*/
module MemoriaDeInstrucao (input wire [31:0] instrucao, input wire [31:0] endereco, input wire clock, input wire reset);

  reg[31:0] memoria [255:0];
  assign  instrucao = memoria[endereco[9:2]];
  
  always @(negedge clk) begin
    if (reset) begin
          $readmemb("programa.txt",instructionMemory);
    end
  end

endmodule;

module mux_32bit_2in(
    input wire control,
    input wire [31:0] a,b,
    output wire [31:0] selected
);

    assign selected = (control)?b:a;

endmodule

/*
* Esse mux faz a
*/

module mux_32bit_4in(
    input wire [1:0] control,
    input wire [31:0] a,b,c,d,
    output wire [31:0] selected
);

    assign selected = (control[1]) ? (control[0]?d:c) : (control[0]?b:a);

endmodule      
      
module IF(input  wire clock, 
                               input wire reset, 
                               output wire [31:0] contador, 
                               output wire [31:0] instrucao, 
                               input wire hazard, 
                               input wire BranchTaken, 
                               input wire [31:0] PCBranch,
                               //Entradas de Desvios
                               input wire [31:0] jumpAddress,
                               input wire [31:0] jumpReg);
  
  wire [31:0] fioInstrucaoAtual;
  wire [31:0] fioInstrucaoAtualMais4;
  wire [31:0] fioProximaInstrucao;
  
  assign fioInstrucaoAtualMais4 = fioInstrucaoAtual + 4;
  assign contador = fioInstrucaoAtualMais4;
  
  PC moduloPC(fioInstrucaoAtual, fioProximaInstrucao , clock, hazard)
  MemoriaDeInstrucao moduloMemoriaDeInstrucao(instrucao, fioInstrucaoAtual, clock, reset);

  mux_32bit_2in muxDesvio(BranchTaken, fioInstrucaoAtualMais4, PCBranch, branchAddress);
  mux_32bit_4in desvioContadorInstrucao((BranchTaken) ? 2'b01, fioInstrucaoAtual, fioInstrucaoAtualMais4, branchAddress,jumpAddress,jumpReg,fioProximaInstrucao);
endmodule;
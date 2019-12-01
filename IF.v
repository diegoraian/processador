module IF(clock, reset, contador, instrucao, hazard,PCSrc,BranchTaken, PCBranch,jumpAddress,jumpReg);
  
  //Entradas
  input  wire clock;
  input wire reset;
  output wire [31:0] contador; 
  output wire [31:0] instrucao; 
  input wire hazard;
  input  wire  [1:0] PCSrc;
  input wire BranchTaken;
  input wire [31:0] PCBranch;
  //Entradas de Desvios
  input wire [31:0] jumpAddress;
  input wire [31:0] jumpReg;
		 
//fios internos
  wire [31:0] fioInstrucaoAtual;
  wire [31:0] fioInstrucaoAtualMais4;
  wire [31:0] fioProximaInstrucao;
  
  assign fioInstrucaoAtualMais4 = fioInstrucaoAtual + 4;
  assign contador = fioInstrucaoAtualMais4;
  
  PC moduloPC(fioInstrucaoAtual, fioProximaInstrucao , clock, hazard);
  MemoriaDeInstrucoes moduloMemoriaDeInstrucoes(instrucao, fioInstrucaoAtual, clock, reset);

  mux_32bit_2in muxDesvio(BranchTaken, fioInstrucaoAtualMais4, PCBranch, branchAddress);
  mux_32bit_4in desvioContadorInstrucao(((BranchTaken) ? 2'b01: PCSrc) ,  fioInstrucaoAtualMais4, branchAddress,jumpAddress,jumpReg,fioProximaInstrucao);
endmodule
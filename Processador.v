module Processador(input wire clock, input wire reset);


    IF estagioBuscaDeInstrucao(clock, reset, contador, instrucao, hazard, BranchTaken, PCBranch, jumpAddress, jumpReg);

endmodule
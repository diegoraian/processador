module MemoriaDeInstrucoes(instrucao, endereco, clock, reset);
  output wire [31:0] instrucao;
  input wire [31:0] endereco;
  input wire clock;
  input wire reset;
  
  reg[31:0] memoria [255:0];
  assign  instrucao = memoria[endereco[9:2]];
  
  always @(negedge clock) begin
    if (reset) 
          $readmemb("programa.txt",memoria);
    
  end

endmodule
/**
	ARQUIVO constantes.v
*/
  `define NOP    6'b010000
  `define MOV    6'b010000
  `define ADD    6'b010001
  `define SUB    6'b010010
  `define MUL	 6'b010011
  `define DIV    6'b010101
  `define OR     6'b010110
  `define SHL    6'b010111
  `define SHR    6'b011000
  `define CMP    6'b011001
  `define NOT    6'b011100
  `define JR     6'b100001
  `define JPC    6'b100010
  `define BRFL   6'b100100
  `define CALL   6'b101001
  `define RET    6'b101010
  `define SW     6'b110001
  `define LW     6'b111010
      
    //Operações da ULA
  //==============================
  `define ULA_ADD 0
  `define ULA_SUB 1
  `define ULA_MUL 2
  `define ULA_DIV 3
  `define ULA_AND 4
  `define ULA_OR  5
  `define ULA_LW  7
  `define ULA_SW  8
  `define ULA_SHR 10
  `define ULA_SHL 11
  `define ULA_JUMP 12;      

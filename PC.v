//
//	PC - Contador de programa
//
module PC(input wire [31:0]  entrada, output reg [31:0] saida, input wire clock, input wire reset, input wire hazard);
	always @ (posedge clock or posedge reset) begin
		if(reset) 
			saida <= 0;
      else if (~hazard) 
			saida <= entrada;
	end
endmodule
      
      
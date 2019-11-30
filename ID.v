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
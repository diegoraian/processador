module PC(input[31:0]  entrada,output[31:0] saida, input clk, input rst);
	reg[31:0] contatoInterno;
	always @ (posedge clk or posedge rst)
		begin
			if(!rst) begin
				register <= 0;
			else begin
				clk <= clk + 1;
			end
			
		end
	assign saida = register;
endmodule;
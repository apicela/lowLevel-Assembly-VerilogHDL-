/*	Sistema Digitais para Computação
*	Projeto 6 - Somador de 4 bit
*
*	Alunos:
*	- Augusto Soares
*	- Jamil Souza
*	CEFETMG - 2022
*/


module Somador_4_bits(SW, HEX1, HEX0);

	//declarando:
	input [17:0]SW;
	output[0:6]HEX1, HEX0;
	wire [3:0]S,Ts;
	wire [3:0]A,B;
	wire TE;
	wire[4:0] resultado;
	wire [3:0] dezena, unidade;
	
	//variáveis auxiliares para facilitar na digitação.
	assign A = SW[17:14];
	assign B = SW[3:0];
	assign TE = SW[10];

	somador_1_bit bloco0(A[0],B[0],TE,S[0],Ts[0]);//processos de soma dos números binários: primeira casa.
	somador_1_bit bloco1(A[1],B[1],Ts[0],S[1],Ts[1]);//processos de soma dos números binários: segunda casa.
	somador_1_bit bloco2(A[2],B[2],Ts[1],S[2],Ts[2]);//processos de soma dos números binários: terceira casa.
	somador_1_bit bloco3(A[3],B[3],Ts[2],S[3],Ts[3]);//processos de soma dos números binários: quarta casa.

	assign resultado = {Ts[3],S[3],S[2],S[1],S[0]};//concatenação de todos os resultados por casa.

	assign dezena = resultado/4'b1010; // Foi usado a divisão no valor total para que fosse possível achar o valor em binário do algarismo da dezena, assim, ele será transposto para decimal separadamente.
	assign unidade = resultado%4'b1010;// Foi usado módulo no valor total para que fosse possível achar o valor em binário do algarismo da unidade, assim, ele será transposto para decimal separadamente.

	bit_decoder_2 blocoA(unidade,HEX0);//Decodificador atuando para o algarismo da unidade.
	bit_decoder_2 blocoB(dezena,HEX1); //Decodificador atuando para o algarismo da dezena.

endmodule


//------------------------------------------------------------


module somador_1_bit(A,B,TE,S,Ts);

	//declarando:
	input A,B,TE;
	output S,Ts;

	assign S = A ^ B ^ TE; //expressão booleana para o resultado da soma.
	assign Ts = A&B | A&TE | B&TE; //expressão booleana para o carry.
	
	
endmodule


//------------------------------------------------------------


module bit_decoder_2(valor,display);
	
	//declarando:
	input [3:0]valor;
	output reg [0:6]display;


	/* HEX[0] = A
		HEX[1] = B
		HEX[2] = C
		HEX[3] = D
		HEX[4] = E
		HEX[5] = F
		HEX[6] = G
		
		onde:
		
			A
		F		B
			G
		E		C
			D
			
	*/

	
	//definição de controle de display.
	always @(*)

	begin
		case(valor)
		
	4'b0000 : display=7'b0000001; 
   4'b0001 : display=7'b1001111;
   4'b0010 : display=7'b0010010;
   4'b0011 : display=7'b0000110;
   4'b0100 : display=7'b1001100;
   4'b0101 : display=7'b0100100;
   4'b0110 : display=7'b0100000;
   4'b0111 : display=7'b0001101;
   4'b1000 : display=7'b0000000;
   4'b1001 : display=7'b0000100; 
			
		endcase
	end

endmodule
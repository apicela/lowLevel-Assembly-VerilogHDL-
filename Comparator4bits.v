/*	Sistema Digitais para Computação
*	Projeto 3 - comparador maior-menor-igual 4 bits
*
*	Alunos:
*	- Augusto Soares
*	- Jamil Souza
*	CEFETMG - 2022
*/

module comparador_4_bits(SW,LEDR);
input [17:0]SW;
output [17:0]LEDR;
wire [3:0] A, B, resultIG,resultMA,resultME;

assign A = SW[17:14];
assign B = SW[3:0];
assign LEDR[5] = resultIG[0];
assign LEDR[0] = resultMA[3] | resultMA[2] | resultMA[1] | resultMA[0];
assign LEDR[10] = resultME[3] | resultME[2] | resultME[1] | resultME[0];

comparador_1_bit block3(1'b1,A[3],B[3],resultIG[3],resultMA[3],resultME[3]);
comparador_1_bit block2(resultIG[3],A[2],B[2],resultIG[2],resultMA[2],resultME[2]);
comparador_1_bit block1(resultIG[2],A[1],B[1],resultIG[1],resultMA[1],resultME[1]);
comparador_1_bit block0(resultIG[1],A[0],B[0],resultIG[0],resultMA[0],resultME[0]);

endmodule

module comparador_1_bit(enable,A,B,IG,MA,ME);

input enable,A,B;
output IG,MA,ME;

assign IG = enable & (A ^~ B);
assign MA = enable & (A & !B);
assign ME = enable & (!A & B);

endmodule

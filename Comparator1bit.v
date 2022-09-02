/*	Sistema Digitais para Computação
*	Projeto 2 - comparador maior-menor-igual
*
*	Alunos:
*	- Augusto Soares
*	- Jamil Souza
*	CEFETMG - 2022
*/

module proj_2_comparador(A,B,S1,S2,S3);

input A,B;
output S1,S2,S3;

assign S1 =  A ~^  B;
assign S2 =  A  & !B;
assign S3 = !A  &  B;

endmodule
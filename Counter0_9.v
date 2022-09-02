/*	Sistema Digitais para Computação
*	Projeto 8 - Contador de 0-9
*
*	Alunos:
*	- Augusto Soares
*	- Jamil Souza
*	CEFETMG - 2022
*/


module Contador_09(Q,SW,clock_50);
input [17:0]SW,clock_50;
output reg [3:0]Q;
wire clock, reset, preset ;

assign reset = SW[10];
//assign clock = clock_50;
assign preset = SW[0];

initial
begin 
Q = 4'b0000;
end

always@ (posedge clock_50 or posedge reset)

begin

	if(reset != 1'b0)
	
		begin
		Q = 4'b0000;
		end

	else if(Q == 9)

		begin
		Q = 4'b0000;
		end
	
	else 
	
	begin
	Q=Q+1;
	end

end
endmodule

 
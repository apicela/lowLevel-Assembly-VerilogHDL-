/*	Sistema Digitais para Computação
*	Projeto 4 - Display  7 segmentos CASE 
*
*	Alunos:
*	- Jamil Souza
*	CEFETMG - 2022
*/

module displaycase(SW,HEX7);
input [17:14]SW;
output reg [6:0]HEX7;
 

assign A = SW[17];
assign B = SW[16];
assign C = SW[15];
assign D = SW[14];

always@ (A,B,C,D)
begin
		case({A,B,C,D})
			4'b0000: HEX7 = 7'b1000000; //0
			4'b0001: HEX7 = 7'b1111001; //1
			4'b0010: HEX7 = 7'b0100100; //2
			4'b0011: HEX7 = 7'b0110000; //3
			4'b0100: HEX7 = 7'b0011001; //4
			4'b0101: HEX7 = 7'b0010010; //5
			4'b0110: HEX7 = 7'b0000011; //6
			4'b0111: HEX7 = 7'b1111000; //7
			4'b1000: HEX7 = 7'b0000000; //8
			4'b1001: HEX7 = 7'b0011000; //9
endcase
end

endmodule

/* Projeto 5 - Somador 1 bit
Jamil de Souza

*/
module somador_1_bit(SW, HEX7);

input [17:15]SW;
output [6:0]HEX7;
wire S,Cout;

assign A = SW[15];
assign B = SW[16];
assign Cin = SW[17];

assign S = (A^B)^Cin;
assign Cout = A&Cin | A&B | Cin&B;

endmodule

module operacao(Cout,S,HEX7[6:0]);
// 1 apaga e 0 acende

/* 
		A
   F     B
		G 
	E		C
		D	
A = HEX[0]
B = 1
C = 2
D = 3
E = 4
F = 5
G = 6		
*/	

input Cout,S;
output reg [6:0]HEX7;

always @(Cout,S)

begin 
		case({Cout,S})
		2'b00: HEX7= 7'b1000000;
		2'b01: HEX7= 7'b1111001;
		2'b10: HEX7= 7'b0100100;
		2'b11: HEX7= 7'b0110000;
		endcase
		
end

endmodule
		
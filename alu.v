module alu(ina, inb, op, zf, out);
	input wire [7:0] ina, inb;
	input wire [7:0] op;
	output reg zf;
	output reg[7:0] out;

`include "def.h"
`include "paras.h"
`include "commands.h"

always @(*) begin
	case(op)
	SET : begin
		out <= ina;
	end
	
	ADD : begin
		out <= ina + inb;
	end
	
	SUB : begin
		out <= inb - ina;
	end
	
	ADDREG : begin
		out <= ina + inb;
	end
	
	WRITE : begin
		out <= ina;
	end
	
	MOD : begin
		out <= inb % 3;
	end
	
	DIV : begin
		out <= inb / 3;
	end
	
	CHECK : begin
		if(ina == inb) zf<= 1;
		else zf <= 0;
	end
	
	CHECKR : begin
		if(ina == inb) zf <= 1;
		else zf <= 0;
	end
	
	COPY : begin
		out <= inb;
	end
	
	INV : begin
		out <= -1 * inb;
	end
	
	AUP : begin
		if( ina/3 >= inb/3 ) out <= ina/3 - inb/3;
		else out <= inb/3 - ina/3;
	end
	
	ADW : begin
		if( (ina%3) >= (inb%3)) out = ina%3 - inb%3;
		else out = inb%3 - ina%3;
	end
	
	LESS : begin
		if(ina < inb) zf <= 1;
		else zf <= 0;
	end
	
	default : begin
		out <= 0;
		zf <= 0;
	end
	endcase
	end

endmodule

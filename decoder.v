module decoder(op, zf, pc_in, pc_we, pc,src0, src1, dst, reg_we, sel1, sel2, data, alu_op, mem_we, rst_n, clk);
	input wire [23:0] op;
	input wire zf, clk;
	output reg [7:0] pc_in;
	output reg pc_we;
	input wire [7:0] pc;
	output reg [7:0] src0, src1, dst;
	output reg reg_we;
	output reg sel1, sel2;
	output reg [7:0] data;
	output reg [7:0] alu_op;
	output reg mem_we;
	
	input wire rst_n;
	reg [7:0] stack[15:0];
	reg [3:0] stack_count;
	
`include "commands.h"
`include "paras.h"
	
	output wire [7:0] tester_stack;
	
	integer i;
always @(op or rst_n) begin
	if(!rst_n) begin
		stack_count <= 0;
		for(i=0; i<16; i=i+1)
			stack[i] <= 0;
	end else begin
	src0 <= 255;
	src1 <= 255;
	pc_we <= 0;
	reg_we <= 0;
	mem_we <= 0;
	sel1 <= 0;
	sel2 <= 0;
	pc_in <= 0;
	alu_op <= 255;
	data <= 255;
	case (op[23:16])
	CALL : begin
		alu_op <= 255;
		stack[stack_count] <= pc + 1;
		stack_count <= stack_count+1;
		pc_in <= op[15:8];
		pc_we <= 1;
	end
	
	RETURN : begin
		alu_op <= 255;
		pc_in <= stack[stack_count - 1];
		stack_count <= (stack_count - 1);
		pc_we <= 1;
	end	
	
	SET : begin
		alu_op <= op[23:16];
		data <= op[7:0];
		sel1 <= 0;
		sel2 <= 0;
		dst <= op[15:8];
		reg_we <= 1;
	end
	
	ADD : begin
		alu_op <= op[23:16];
		sel1 <= 0;
		sel2 <= 0;
		data <= op[7:0];
		dst <= op[15:8];
		src1 <= op[15:8];
		reg_we <= 1;
	end
	
	SUB : begin
		alu_op <= op[23:16];
		sel1 <= 0;
		sel2 <= 0;
		data <= op[7:0];
		dst <= op[15:8];
		src1 <= op[15:8];
		reg_we <= 1;
	end
	
	ADDREG : begin
		alu_op <= op[23:16];
		sel1 <= 1;
		sel2 <= 0;
		src0 <= op[15:8];
		src1 <= op[7:0];
		dst <= op[15:8];
		reg_we <= 1;
	end
	
	LOAD : begin
		alu_op <= op[23:16];
		src1 <= op[15:8];
		dst <= op[7:0];
		reg_we <= 1;
		sel2 <= 1;
	end
	
	WRITE : begin
		alu_op <= op[23:16];
		src0 <= op[7:0];
		src1 <= op[15:8];
		sel1 <= 1;
		mem_we <= 1;
	end
	
	MOD : begin
		alu_op <= op[23:16];
		dst <= op[7:0];
		reg_we <= 1;
		src1 <= op[15:8];
	end
	
	DIV : begin
		alu_op <= op[23:16];
		dst <= op[7:0];
		reg_we <= 1;
		src1 <= op[15:8];
	end
	
	CHECK : begin
		alu_op <= op[23:16];
		src1 <= op[15:8];
		data <= op[7:0];
	end

	CHECKR : begin
		alu_op <= op[23:16];
		src0 <= op[15:8];
		src1 <= op[7:0];
		sel1 <= 1;
	end

	COPY : begin
		alu_op <= op[23:16];
		dst <= op[7:0];
		reg_we <= 1;
		src1 <= op[15:8];
	end

	JNZ : begin
		pc_in <= op[15:8];
		pc_we <= zf;
	end

	INV : begin
		alu_op <= op[23:16];
		dst <= op[7:0];
		reg_we <= 1;
		src1 <= op[15:8];
	end

	GOTO : begin
		pc_in <= op[15:8];
		pc_we <= 1;
	end

	AUP : begin
		alu_op <= op[23:16];
		dst <= w;
		reg_we <= 1;
		src0 <= op[15:8];
		src1 <= op[7:0];
		sel1 <= 1;
	end

	ADW : begin
		alu_op <= op[23:16];
		dst <= w;
		reg_we <= 1;
		src0 <= op[15:8];
		src1 <= op[7:0];
		sel1 <= 1;
	end

	LESS : begin
		alu_op <= op[23:16];
		src0 <= op[15:8];
		src1 <= op[7:0];
		sel1 <= 1;
	end
	
	default : begin
		pc_we <= 0;
	end

	endcase
	end
end

assign tester_stack = stack[stack_count];

endmodule

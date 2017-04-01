module register(src0, src1, dst, we, data, clk, rst_n, outa, outb);
	input wire clk, rst_n;
	input wire [7:0] src0, src1;
	input wire [7:0] dst;
	input wire we;
	input wire [7:0] data;
	output wire [7:0] outa, outb;
`include "paras.h"
	reg [7:0] regis [255:0];
	wire [7:0] W,check_reg,LOG_COUNT,POS,NEXTPOS,ADDRESS,DIRECTION, INVERSE_DIRECTION, TMP, SUM, COUNT, MAX_DEPTH;
	integer i;
always @(posedge clk) begin
	if(!rst_n) begin
		for(i = 0; i <= 255; i=i+1)
				regis[i] = 7;
		regis[pos] = 1;
	end else begin
		if(we) begin
			regis[dst] <= data;
		end else begin
			regis[dst] <= regis[dst];
		end
	end
end

assign outa = regis[src0];
assign outb = regis[src1];
assign check_reg = regis[CHECK_REG];
assign W = regis[w];
assign LOG_COUNT = regis[log_count];
assign POS = regis[pos];
assign NEXTPOS = regis[nextpos];
assign ADDRESS = regis[address];
assign DIRECTION = regis[direction];
assign INVERSE_DIRECTION = regis[inverse_direction];
assign TMP = regis[tmp];
assign SUM = regis[sum];
assign COUNT = regis[count];
assign MAX_DEPTH = regis[max_depth];

endmodule

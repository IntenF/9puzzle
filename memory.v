module memory(in, out, addr, rst_n, clk, we);
	input wire clk, rst_n, we;
	input wire [7:0] in;
	input wire [7:0] addr;
	output wire [7:0] out;

	reg [7:0] mem [255:0];
	integer i;

	output wire [7:0] route0,route1,route2,route3,route4,route5,route6,route7,route8,route9,route10,route11,route12,route13,route14,route15,route16,route17,route18,route19,route20,route21,route22,route23,route24,route25,route26,route27,route28,route29,route30,route31;
	output wire [7:0] pazzle00,pazzle01,pazzle02,pazzle10,pazzle11,pazzle12,pazzle20,pazzle21,pazzle22;
always @(posedge clk)begin
	if(!rst_n) begin
		for(i = 0; i <= 255; i=i+1)
			mem[i] = 0;
		//ƒpƒYƒ‹‚Ì‰ŠúÝ’è‚ð‚·‚é
		mem[0] = 2;
		mem[1] = 6;
		mem[2] = 4;
		mem[3] = 3;
		mem[4] = 5;
		mem[5] = 1;
		mem[6] = 7;
		mem[7] = 8;
		mem[8] = 0;
	end else begin
		if(we) begin
			mem[addr] <= in;
		end else begin
			mem[addr] <= mem[addr];
		end
	end
end

assign out = mem[addr];

assign pazzle00 = mem[0];
assign pazzle01 = mem[1];
assign pazzle02 = mem[2];
assign pazzle10 = mem[3];
assign pazzle11 = mem[4];
assign pazzle12 = mem[5];
assign pazzle20 = mem[6];
assign pazzle21 = mem[7];
assign pazzle22 = mem[8];

assign route0 = mem[16];
assign route1 = mem[17];
assign route2 = mem[18];
assign route3 = mem[19];
assign route4 = mem[20];
assign route5 = mem[21];
assign route6 = mem[22];
assign route7 = mem[23];
assign route8 = mem[24];
assign route9 = mem[25];
assign route10 = mem[26];
assign route11 = mem[27];
assign route12 = mem[28];
assign route13 = mem[29];
assign route14 = mem[30];
assign route15 = mem[31];
assign route16 = mem[32];
assign route17 = mem[33];
assign route18 = mem[34];
assign route19 = mem[35];
assign route20 = mem[36];
assign route21 = mem[37];
assign route22 = mem[38];
assign route23 = mem[39];
assign route24 = mem[40];
assign route25 = mem[41];
assign route26 = mem[42];
assign route27 = mem[43];
assign route28 = mem[44];
assign route29 = mem[45];
assign route30 = mem[46];
assign route31 = mem[47];
endmodule

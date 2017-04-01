module imem(pc, op);
	input wire [7:0] pc;
	output reg [23:0] op;

`include "def.h"
`include "paras.h"
`include "commands.h"

//define labels
parameter [7:0] MAIN = 1,
			LOOP = 4,
			GOUP = 23,
			GODOWN = 27,
			GORIGHT = 31,
			GOLEFT = 35,
			GOEND = 39,
			PROC_END = 56,
			PUSH_LOG = 58,
			UP_OK = 63,
			UP_OK_FALSE = 68,
			DOWN_OK = 70,
			DOWN_OK_FALSE = 75,
			RIGHT_OK = 77,
			RIGHT_OK_FALSE = 82,
			LEFT_OK = 84,
			LEFT_OK_FALSE = 89,
			TRYMOVE = 91,
			MOVE_UP = 106,
			MOVE_DOWN = 110,
			MOVE_RIGHT = 114,
			MOVE_LEFT = 118,
			YES_MOVE = 122,
			MOVE_GIVE_UP = 133,
			UNMOVE = 135,
			CHECK_ALL = 149,
			CHECK_LOOP = 150,
			CHECK_NEXT = 156,
			CHECK_ALL_END = 160,
			MANHATTAN = 162,
			MANHATTAN_LOOP = 164,
			MANHATTAN_NEXT_TABLE = 172,
			MANHATTAN_END = 176;


//begin program
always@(pc) begin
	case(pc)
	0: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	//MAIN
	1: begin
		op[23:16] <= CALL;
		op[15:8] <= MANHATTAN;
		op[7:0] <= 8'b0;
	end

	2: begin
		op[23:16] <= COPY;
		op[15:8] <= w;
		op[7:0] <= max_depth;
	end

	3: begin
		op[23:16] <= ADD;
		op[15:8] <= max_depth;
		op[7:0] <= 1;
	end

	//LOOP
	4: begin
		op[23:16] <= CALL;
		op[15:8] <= CHECK_ALL;
		op[7:0] <= 8'b0;
	end

	5: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	6: begin
		op[23:16] <= JNZ;
		op[15:8] <= PROC_END;
		op[7:0] <= 8'b0;
	end

	7: begin
		op[23:16] <= CALL;
		op[15:8] <= MANHATTAN;
		op[7:0] <= 8'b0;
	end

	8: begin
		op[23:16] <= ADDREG;
		op[15:8] <= w;
		op[7:0] <= log_count;
	end

	9: begin
		op[23:16] <= LESS;
		op[15:8] <= w;
		op[7:0] <= max_depth;
	end

	10: begin
		op[23:16] <= JNZ;
		op[15:8] <= GOUP;
		op[7:0] <= 8'b0;
	end

	11: begin
		op[23:16] <= CALL;
		op[15:8] <= UNMOVE;
		op[7:0] <= 8'b0;
	end

	12: begin
		op[23:16] <= SET;
		op[15:8] <= address;
		op[7:0] <= 16;
	end

	13: begin
		op[23:16] <= ADDREG;
		op[15:8] <= address;
		op[7:0] <= log_count;
	end

	14: begin
		op[23:16] <= LOAD;
		op[15:8] <= address;
		op[7:0] <= w;
	end

	15: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= UP;
	end

	16: begin
		op[23:16] <= JNZ;
		op[15:8] <= GODOWN;
		op[7:0] <= 8'b0;
	end

	17: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= DOWN;
	end

	18: begin
		op[23:16] <= JNZ;
		op[15:8] <= GORIGHT;
		op[7:0] <= 8'b0;
	end

	19: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= RIGHT;
	end

	20: begin
		op[23:16] <= JNZ;
		op[15:8] <= GOLEFT;
		op[7:0] <= 8'b0;
	end

	21: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= LEFT;
	end

	22: begin
		op[23:16] <= JNZ;
		op[15:8] <= GOEND;
		op[7:0] <= 8'b0;
	end

	//GOUP
	23: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= UP;
	end

	24: begin
		op[23:16] <= CALL;
		op[15:8] <= TRYMOVE;
		op[7:0] <= 8'b0;
	end

	25: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	26: begin
		op[23:16] <= JNZ;
		op[15:8] <= LOOP;
		op[7:0] <= 8'b0;
	end

	//GODOWN
	27: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= DOWN;
	end

	28: begin
		op[23:16] <= CALL;
		op[15:8] <= TRYMOVE;
		op[7:0] <= 8'b0;
	end

	29: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	30: begin
		op[23:16] <= JNZ;
		op[15:8] <= LOOP;
		op[7:0] <= 8'b0;
	end

	//GORIGHT
	31: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= RIGHT;
	end

	32: begin
		op[23:16] <= CALL;
		op[15:8] <= TRYMOVE;
		op[7:0] <= 8'b0;
	end

	33: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	34: begin
		op[23:16] <= JNZ;
		op[15:8] <= LOOP;
		op[7:0] <= 8'b0;
	end

	//GOLEFT
	35: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= LEFT;
	end

	36: begin
		op[23:16] <= CALL;
		op[15:8] <= TRYMOVE;
		op[7:0] <= 8'b0;
	end

	37: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	38: begin
		op[23:16] <= JNZ;
		op[15:8] <= LOOP;
		op[7:0] <= 8'b0;
	end

	//GOEND
	39: begin
		op[23:16] <= CALL;
		op[15:8] <= UNMOVE;
		op[7:0] <= 8'b0;
	end

	40: begin
		op[23:16] <= SET;
		op[15:8] <= address;
		op[7:0] <= 16;
	end

	41: begin
		op[23:16] <= ADDREG;
		op[15:8] <= address;
		op[7:0] <= log_count;
	end

	42: begin
		op[23:16] <= LOAD;
		op[15:8] <= address;
		op[7:0] <= w;
	end

	43: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= UP;
	end

	44: begin
		op[23:16] <= JNZ;
		op[15:8] <= GODOWN;
		op[7:0] <= 8'b0;
	end

	45: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= DOWN;
	end

	46: begin
		op[23:16] <= JNZ;
		op[15:8] <= GORIGHT;
		op[7:0] <= 8'b0;
	end

	47: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= RIGHT;
	end

	48: begin
		op[23:16] <= JNZ;
		op[15:8] <= GOLEFT;
		op[7:0] <= 8'b0;
	end

	49: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= LEFT;
	end

	50: begin
		op[23:16] <= JNZ;
		op[15:8] <= GOEND;
		op[7:0] <= 8'b0;
	end

	51: begin
		op[23:16] <= SET;
		op[15:8] <= log_count;
		op[7:0] <= 0;
	end

	52: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 32;
	end

	53: begin
		op[23:16] <= LESS;
		op[15:8] <= max_depth;
		op[7:0] <= w;
	end

	54: begin
		op[23:16] <= ADD;
		op[15:8] <= max_depth;
		op[7:0] <= 1;
	end

	55: begin
		op[23:16] <= JNZ;
		op[15:8] <= LOOP;
		op[7:0] <= 8'b0;
	end

	//PROC_END
	56: begin
		op[23:16] <= COPY;
		op[15:8] <= log_count;
		op[7:0] <= CHECK_REG;
	end

	57: begin
		op[23:16] <= GOTO;
		op[15:8] <= PROC_END;
		op[7:0] <= 8'b0;
	end

	//PUSH_LOG
	58: begin
		op[23:16] <= SET;
		op[15:8] <= address;
		op[7:0] <= 16;
	end

	59: begin
		op[23:16] <= ADDREG;
		op[15:8] <= address;
		op[7:0] <= log_count;
	end

	60: begin
		op[23:16] <= WRITE;
		op[15:8] <= address;
		op[7:0] <= w;
	end

	61: begin
		op[23:16] <= ADD;
		op[15:8] <= log_count;
		op[7:0] <= 1;
	end

	62: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//UP_OK
	63: begin
		op[23:16] <= DIV;
		op[15:8] <= pos;
		op[7:0] <= w;
	end

	64: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 0;
	end

	65: begin
		op[23:16] <= JNZ;
		op[15:8] <= UP_OK_FALSE;
		op[7:0] <= 8'b0;
	end

	66: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	67: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//UP_OK_FALSE
	68: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 0;
	end

	69: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//DOWN_OK
	70: begin
		op[23:16] <= DIV;
		op[15:8] <= pos;
		op[7:0] <= w;
	end

	71: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 2;
	end

	72: begin
		op[23:16] <= JNZ;
		op[15:8] <= DOWN_OK_FALSE;
		op[7:0] <= 8'b0;
	end

	73: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	74: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//DOWN_OK_FALSE
	75: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 0;
	end

	76: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//RIGHT_OK
	77: begin
		op[23:16] <= MOD;
		op[15:8] <= pos;
		op[7:0] <= w;
	end

	78: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 2;
	end

	79: begin
		op[23:16] <= JNZ;
		op[15:8] <= RIGHT_OK_FALSE;
		op[7:0] <= 8'b0;
	end

	80: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	81: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//RIGHT_OK_FALSE
	82: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 0;
	end

	83: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//LEFT_OK
	84: begin
		op[23:16] <= MOD;
		op[15:8] <= pos;
		op[7:0] <= w;
	end

	85: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 0;
	end

	86: begin
		op[23:16] <= JNZ;
		op[15:8] <= LEFT_OK_FALSE;
		op[7:0] <= 8'b0;
	end

	87: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	88: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//LEFT_OK_FALSE
	89: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 0;
	end

	90: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//TRYMOVE
	91: begin
		op[23:16] <= COPY;
		op[15:8] <= w;
		op[7:0] <= direction;
	end

	92: begin
		op[23:16] <= INV;
		op[15:8] <= w;
		op[7:0] <= inverse_direction;
	end

	93: begin
		op[23:16] <= COPY;
		op[15:8] <= log_count;
		op[7:0] <= w;
	end

	94: begin
		op[23:16] <= ADD;
		op[15:8] <= w;
		op[7:0] <= 15;
	end

	95: begin
		op[23:16] <= LOAD;
		op[15:8] <= w;
		op[7:0] <= w;
	end

	96: begin
		op[23:16] <= CHECKR;
		op[15:8] <= w;
		op[7:0] <= inverse_direction;
	end

	97: begin
		op[23:16] <= JNZ;
		op[15:8] <= MOVE_GIVE_UP;
		op[7:0] <= 8'b0;
	end

	98: begin
		op[23:16] <= CHECK;
		op[15:8] <= direction;
		op[7:0] <= UP;
	end

	99: begin
		op[23:16] <= JNZ;
		op[15:8] <= MOVE_UP;
		op[7:0] <= 8'b0;
	end

	100: begin
		op[23:16] <= CHECK;
		op[15:8] <= direction;
		op[7:0] <= DOWN;
	end

	101: begin
		op[23:16] <= JNZ;
		op[15:8] <= MOVE_DOWN;
		op[7:0] <= 8'b0;
	end

	102: begin
		op[23:16] <= CHECK;
		op[15:8] <= direction;
		op[7:0] <= RIGHT;
	end

	103: begin
		op[23:16] <= JNZ;
		op[15:8] <= MOVE_RIGHT;
		op[7:0] <= 8'b0;
	end

	104: begin
		op[23:16] <= CHECK;
		op[15:8] <= direction;
		op[7:0] <= LEFT;
	end

	105: begin
		op[23:16] <= JNZ;
		op[15:8] <= MOVE_LEFT;
		op[7:0] <= 8'b0;
	end

	//MOVE_UP
	106: begin
		op[23:16] <= CALL;
		op[15:8] <= UP_OK;
		op[7:0] <= 8'b0;
	end

	107: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	108: begin
		op[23:16] <= JNZ;
		op[15:8] <= YES_MOVE;
		op[7:0] <= 8'b0;
	end

	109: begin
		op[23:16] <= GOTO;
		op[15:8] <= MOVE_GIVE_UP;
		op[7:0] <= 8'b0;
	end

	//MOVE_DOWN
	110: begin
		op[23:16] <= CALL;
		op[15:8] <= DOWN_OK;
		op[7:0] <= 8'b0;
	end

	111: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	112: begin
		op[23:16] <= JNZ;
		op[15:8] <= YES_MOVE;
		op[7:0] <= 8'b0;
	end

	113: begin
		op[23:16] <= GOTO;
		op[15:8] <= MOVE_GIVE_UP;
		op[7:0] <= 8'b0;
	end

	//MOVE_RIGHT
	114: begin
		op[23:16] <= CALL;
		op[15:8] <= RIGHT_OK;
		op[7:0] <= 8'b0;
	end

	115: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	116: begin
		op[23:16] <= JNZ;
		op[15:8] <= YES_MOVE;
		op[7:0] <= 8'b0;
	end

	117: begin
		op[23:16] <= GOTO;
		op[15:8] <= MOVE_GIVE_UP;
		op[7:0] <= 8'b0;
	end

	//MOVE_LEFT
	118: begin
		op[23:16] <= CALL;
		op[15:8] <= LEFT_OK;
		op[7:0] <= 8'b0;
	end

	119: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	120: begin
		op[23:16] <= JNZ;
		op[15:8] <= YES_MOVE;
		op[7:0] <= 8'b0;
	end

	121: begin
		op[23:16] <= GOTO;
		op[15:8] <= MOVE_GIVE_UP;
		op[7:0] <= 8'b0;
	end

	//YES_MOVE
	122: begin
		op[23:16] <= COPY;
		op[15:8] <= direction;
		op[7:0] <= w;
	end

	123: begin
		op[23:16] <= CALL;
		op[15:8] <= PUSH_LOG;
		op[7:0] <= 8'b0;
	end

	124: begin
		op[23:16] <= COPY;
		op[15:8] <= pos;
		op[7:0] <= nextpos;
	end

	125: begin
		op[23:16] <= ADDREG;
		op[15:8] <= nextpos;
		op[7:0] <= direction;
	end

	126: begin
		op[23:16] <= LOAD;
		op[15:8] <= nextpos;
		op[7:0] <= w;
	end

	127: begin
		op[23:16] <= WRITE;
		op[15:8] <= pos;
		op[7:0] <= w;
	end

	128: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 8;
	end

	129: begin
		op[23:16] <= WRITE;
		op[15:8] <= nextpos;
		op[7:0] <= w;
	end

	130: begin
		op[23:16] <= COPY;
		op[15:8] <= nextpos;
		op[7:0] <= pos;
	end

	131: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	132: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//MOVE_GIVE_UP
	133: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 0;
	end

	134: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//UNMOVE
	135: begin
		op[23:16] <= SUB;
		op[15:8] <= log_count;
		op[7:0] <= 1;
	end

	136: begin
		op[23:16] <= SET;
		op[15:8] <= address;
		op[7:0] <= 16;
	end

	137: begin
		op[23:16] <= ADDREG;
		op[15:8] <= address;
		op[7:0] <= log_count;
	end

	138: begin
		op[23:16] <= LOAD;
		op[15:8] <= address;
		op[7:0] <= w;
	end

	139: begin
		op[23:16] <= INV;
		op[15:8] <= w;
		op[7:0] <= direction;
	end

	140: begin
		op[23:16] <= COPY;
		op[15:8] <= pos;
		op[7:0] <= nextpos;
	end

	141: begin
		op[23:16] <= ADDREG;
		op[15:8] <= nextpos;
		op[7:0] <= direction;
	end

	142: begin
		op[23:16] <= LOAD;
		op[15:8] <= nextpos;
		op[7:0] <= w;
	end

	143: begin
		op[23:16] <= WRITE;
		op[15:8] <= pos;
		op[7:0] <= w;
	end

	144: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 8;
	end

	145: begin
		op[23:16] <= WRITE;
		op[15:8] <= nextpos;
		op[7:0] <= w;
	end

	146: begin
		op[23:16] <= COPY;
		op[15:8] <= nextpos;
		op[7:0] <= pos;
	end

	147: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	148: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//CHECK_ALL
	149: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 0;
	end

	//CHECK_LOOP
	150: begin
		op[23:16] <= COPY;
		op[15:8] <= w;
		op[7:0] <= address;
	end

	151: begin
		op[23:16] <= LOAD;
		op[15:8] <= address;
		op[7:0] <= tmp;
	end

	152: begin
		op[23:16] <= CHECKR;
		op[15:8] <= w;
		op[7:0] <= tmp;
	end

	153: begin
		op[23:16] <= JNZ;
		op[15:8] <= CHECK_NEXT;
		op[7:0] <= 8'b0;
	end

	154: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 0;
	end

	155: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//CHECK_NEXT
	156: begin
		op[23:16] <= CHECK;
		op[15:8] <= w;
		op[7:0] <= 8;
	end

	157: begin
		op[23:16] <= JNZ;
		op[15:8] <= CHECK_ALL_END;
		op[7:0] <= 8'b0;
	end

	158: begin
		op[23:16] <= ADD;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	159: begin
		op[23:16] <= GOTO;
		op[15:8] <= CHECK_LOOP;
		op[7:0] <= 8'b0;
	end

	//CHECK_ALL_END
	160: begin
		op[23:16] <= SET;
		op[15:8] <= w;
		op[7:0] <= 1;
	end

	161: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	//MANHATTAN
	162: begin
		op[23:16] <= SET;
		op[15:8] <= count;
		op[7:0] <= 0;
	end

	163: begin
		op[23:16] <= SET;
		op[15:8] <= sum;
		op[7:0] <= 0;
	end

	//MANHATTAN_LOOP
	164: begin
		op[23:16] <= COPY;
		op[15:8] <= count;
		op[7:0] <= address;
	end

	165: begin
		op[23:16] <= LOAD;
		op[15:8] <= address;
		op[7:0] <= tmp;
	end

	166: begin
		op[23:16] <= CHECK;
		op[15:8] <= tmp;
		op[7:0] <= 8;
	end

	167: begin
		op[23:16] <= JNZ;
		op[15:8] <= MANHATTAN_NEXT_TABLE;
		op[7:0] <= 8'b0;
	end

	168: begin
		op[23:16] <= AUP;
		op[15:8] <= tmp;
		op[7:0] <= count;
	end

	169: begin
		op[23:16] <= ADDREG;
		op[15:8] <= sum;
		op[7:0] <= w;
	end

	170: begin
		op[23:16] <= ADW;
		op[15:8] <= tmp;
		op[7:0] <= count;
	end

	171: begin
		op[23:16] <= ADDREG;
		op[15:8] <= sum;
		op[7:0] <= w;
	end

	//MANHATTAN_NEXT_TABLE
	172: begin
		op[23:16] <= CHECK;
		op[15:8] <= count;
		op[7:0] <= 8;
	end

	173: begin
		op[23:16] <= JNZ;
		op[15:8] <= MANHATTAN_END;
		op[7:0] <= 8'b0;
	end

	174: begin
		op[23:16] <= ADD;
		op[15:8] <= count;
		op[7:0] <= 1;
	end

	175: begin
		op[23:16] <= GOTO;
		op[15:8] <= MANHATTAN_LOOP;
		op[7:0] <= 8'b0;
	end

	//MANHATTAN_END
	176: begin
		op[23:16] <= COPY;
		op[15:8] <= sum;
		op[7:0] <= w;
	end

	177: begin
		op[23:16] <= RETURN;
		op[15:8] <= 8'b0;
		op[7:0] <= 8'b0;
	end

	endcase
end

endmodule

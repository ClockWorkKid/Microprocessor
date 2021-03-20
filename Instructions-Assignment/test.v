// ****************************** Testbench Code ****************************** //

module test;
          
	reg osc_clock;			
	reg reset;					
	reg [3:0] data_in;			// input to COM		

	reg prog_clock;			
	reg [7:0] prog_port;		// programming port used to load instructions
	reg [3:0] prog_add;			// programming address
	
	wire [3:0] data_out;		// output from COM
	
	reg [7:0] PROG_MEM[15:0];		// instruction memory
    reg [3:0] DATA_MEM[15:0];		// data memory

	// *************** ASSEMBLY CODE TO MACHINE LANGUAGE *************** //

	parameter NONE = 4'b0000;

	parameter ADD_A_B	= 4'd0;
	parameter SUB_A_B	= 4'd1;
	parameter XCHG_B_A	= 4'd2;
	parameter IN_A		= 4'd3;
	parameter OUT_A		= 4'd4;
	parameter INC_A		= 4'd5;
	parameter MOV_A_ADD	= 4'd6;
	parameter MOV_A_BYT	= 4'd7;
	parameter JZ_ADD	= 4'd8;
	parameter PUSH_B	= 4'd9;
	parameter POP_B		= 4'd10;
	parameter RCL_B		= 4'd11;
	parameter CALL_ADD	= 4'd12;
	parameter RET		= 4'd13;
	parameter AND_A_ADD	= 4'd14;
	parameter HLT		= 4'd15;
    
  
	initial begin
		// ------------- INSTRUCTIONS ------------- //
		PROG_MEM[0]  = {MOV_A_ADD	,	4'b0000 };
		PROG_MEM[1]  = {XCHG_B_A	, 	NONE	};
		PROG_MEM[2]  = {MOV_A_ADD	,	4'b0001	};
		PROG_MEM[3]  = {ADD_A_B		,	NONE	};

		PROG_MEM[4]  = {AND_A_ADD	,	4'b0011	};
		PROG_MEM[5]  = {OUT_A		, 	NONE	};
		PROG_MEM[6]  = {HLT			, 	NONE	};
		PROG_MEM[7]  = {NONE		, 	NONE	};

		PROG_MEM[8]  = {NONE		, 	NONE	};
		PROG_MEM[9]  = {NONE		, 	NONE	};
		PROG_MEM[10] = {NONE		, 	NONE	};
		PROG_MEM[11] = {NONE		, 	NONE	};

		PROG_MEM[12] = {NONE		, 	NONE	};
		PROG_MEM[13] = {NONE		, 	NONE	};
		PROG_MEM[14] = {NONE		, 	NONE	};
		PROG_MEM[15] = {NONE		, 	NONE	};

		// ---------------- MEMORY ---------------- //
		DATA_MEM[0]  = 4'd5;
		DATA_MEM[1]  = 4'd6;
		DATA_MEM[2]  = 4'd0;
		DATA_MEM[3]  = 4'd12;

		DATA_MEM[4]  = 4'd0;
		DATA_MEM[5]  = 4'd0;
		DATA_MEM[6]  = 4'd0;
		DATA_MEM[7]  = 4'd0;

		DATA_MEM[8]  = 4'd0;
		DATA_MEM[9]  = 4'd0;
		DATA_MEM[10] = 4'd0;
		DATA_MEM[11] = 4'd0;

		DATA_MEM[12] = 4'd0;
		DATA_MEM[13] = 4'd0;
		DATA_MEM[14] = 4'd0;
		DATA_MEM[15] = 4'd0;
	end
   
endmodule

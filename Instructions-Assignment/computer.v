// ******************************************************************************* //
// ************************* 4-bit Microprocessor design ************************* //
// ******************************************************************************* //

module computer (data_in, data_out, osc_clock, reset);
          
  input osc_clock;				// external clock source
  input reset;					// zero initialize stuff
  input [3:0] data_in;			// input from some peripheral

  output [3:0] data_out;		// output to some output device
  
  reg [3:0] A, B, TMP;
  reg [7:0] PROG_MEM[15:0];		// instruction memory
  reg [3:0] DATA_MEM[15:0];		// data memory
  reg [3:0] STAK_MEM[15:0];		// stack memory
  reg [3:0] IP;					// instruction pointer
  reg [3:0] SP;					// stack pointer
  
  reg [3:0] INS;				// PROG_MEM[7:4] upper 4 bits are instruction 
  reg [3:0] ADD;				// PROG_MEM[3:0] lower 4 bits are address
  
  reg HALT_FLAG;				// HALT flag
  reg ZF;						// ZERO flag
  reg clock;					// controller clock
  
  // *************** ASSEMBLY CODE TO MACHINE LANGUAGE *************** //
  
  parameter nil = 4'b0000;
  
  parameter ADD_A_B		= 4'd0;
  parameter SUB_A_B		= 4'd1;
  parameter XCHG_B_A	= 4'd2;
  parameter IN_A		= 4'd3;
  parameter OUT_A		= 4'd4;
  parameter INC_A		= 4'd5;
  parameter MOV_A_ADD	= 4'd6;
  parameter MOV_A_BYT	= 4'd7;
  parameter JZ_ADD		= 4'd8;
  parameter PUSH_B		= 4'd9;
  parameter POP_B		= 4'd10;
  parameter RCL_B		= 4'd11;
  parameter CALL_ADD	= 4'd12;
  parameter RET			= 4'd13;
  parameter AND_A_ADD	= 4'd14;
  parameter HLT			= 4'd15;
  
  // ********************* SYSTEM INITIALIZATION ********************* //
  always @(posedge reset) begin
    
    // ------------- INSTRUCTIONS ------------- //
    PROG_MEM[0]  = {MOV_A_ADD	,	4'b0000 };
    PROG_MEM[1]  = {XCHG_B_A	, 	nil		};
    PROG_MEM[2]  = {MOV_A_ADD	,	4'b0001	};
    PROG_MEM[3]  = {ADD_A_B		,	nil		};
    
    PROG_MEM[4]  = {OUT_A		, 	nil		};
    PROG_MEM[5]  = {HLT			, 	nil		};
    PROG_MEM[6]  = {nil			, 	nil		};
    PROG_MEM[7]  = {nil			, 	nil		};
    
    PROG_MEM[8]  = {nil			, 	nil		};
    PROG_MEM[9]  = {nil			, 	nil		};
    PROG_MEM[10] = {nil			, 	nil		};
    PROG_MEM[11] = {nil			, 	nil		};
    
    PROG_MEM[12] = {nil			, 	nil		};
    PROG_MEM[13] = {nil			, 	nil		};
    PROG_MEM[14] = {nil			, 	nil		};
    PROG_MEM[15] = {nil			, 	nil		};
    
    // ---------------- MEMORY ---------------- //
    DATA_MEM[0]  = 4'd5;
    DATA_MEM[1]  = 4'd6;
    DATA_MEM[2]  = 4'd0;
    DATA_MEM[3]  = 4'd0;
    
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
  
  // ************************ CONTROLLER CLOCK *********************** //
  always @(posedge osc_clock) begin
    if (HALT_FLAG == 0)
      clock = !clock;
    else
      clock = 0;
  end
  
  // ********************* INSTRUCTION FETCH STEP ******************** //
  
  always @(negedge clock) begin
    INS <= PROG_MEM[IP][7:4];	// load instruction
    ADD <= PROG_MEM[IP][3:0];	// load address
  end
    
  // ************** INSTRUCTION DECODING AND EXECUTION *************** // 
  
  assign data_out = (INS == 4)? A : 4'bZZZZ; // OUT A (instruction == 4)
  
  always @(posedge clock) begin
    
    IP = IP + 1;
    
    if (reset == 1) begin
		HALT_FLAG = 0;			// do not halt condition
		IP = 0;					// instruction pointer to start of PROG_MEM
		SP = 0;					// stack pointer to start of STAK_MEM
		A = 0;
		B = 0;
    end
    
    else if (INS == 0) begin	// ADD A, B
      A = A + B;
      if (A == 0)
        ZF = 1;
    end
    
    else if (INS == 1) begin	// SUB A, B
      A = A - B;
      if (A == 0)
        ZF = 1;
    end
    
    else if (INS == 2) begin	// XCHG B, A
      TMP = A;
      A = B;
      B = TMP;
      if (B == 0)
        ZF = 1;
    end
    
    else if (INS == 3) begin	// IN A
      A = data_in;
      if (A == 0)
        ZF = 1;
    end

    else if (INS == 5) begin	// INC A
      A = A + 1;
      if (A == 0)
        ZF = 1;
    end
    
    else if (INS == 6) begin	// MOV A, [ADDRESS]
      A = DATA_MEM[ADD];
      if (A == 0)
        ZF = 1;
    end
    
    else if (INS == 7) begin	// MOV A, BYTE
      A = ADD;
      if (A == 0)
        ZF = 1;
    end
    
    else if (INS == 8) begin	// JZ ADDRESS
      if (ZF == 1)
      	IP = ADD;
    end
    
    else if (INS == 9) begin	// PUSH B
      STAK_MEM[SP] = B;
      SP = SP + 1;
      if (B == 0)
        ZF = 1;
    end

    else if (INS == 10) begin	// POP B
      SP = SP - 1;
      B = STAK_MEM[SP];
      if (B == 0)
        ZF = 1;
    end

    else if (INS == 11)	begin	// RCL B  
      B = {B[2:0], B[3]};
      if (A == 0)
        ZF = 1;
    end
    
    else if (INS == 12)	begin	// CALL ADDRESS
      STAK_MEM[SP] = IP;
      IP = ADD;
      SP = SP + 1;
    end
    
    else if (INS == 13) begin	// RET
      SP = SP - 1;
      IP = STAK_MEM[SP];
    end
    
    else if (INS == 14) begin	// AND A, [ADDRESS]
      A = A & DATA_MEM[ADD];
      if (A == 0)
        ZF = 1;
    end
    
    else if (INS == 15)			// HLT
      HALT_FLAG = 1;
    
  end
  
endmodule

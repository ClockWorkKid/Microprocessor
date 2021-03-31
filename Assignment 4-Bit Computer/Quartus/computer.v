// ******************************************************************************* //
// ************************* 4-bit Microprocessor design ************************* //
// ******************************************************************************* //

module computer (data_in, data_out, osc_clock, reset, prog_in, prog_clk, prog_add);
          
  input osc_clock;				// external clock source
  input reset;					// zero initialize stuff
  input [3:0] data_in;			// input from some peripheral
  
  input prog_clk;				// programming clock
  input [7:0] prog_in;			// programming port used to load instructions
  input [3:0] prog_add;			// programming address
  
  output reg[3:0] data_out;		// output to some output device
  
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
  
  
  // ************ LOADING PROGRAM AND DATA INTO MEMORY *************** //
  
  always @(posedge prog_clk) begin

	PROG_MEM[prog_add] = prog_in;
	DATA_MEM[prog_add] = data_in;
	
  end

  // ********************* INSTRUCTION FETCH STEP ******************** //
  
  always @(negedge osc_clock) begin
    INS <= PROG_MEM[IP][7:4];	// load instruction
    ADD <= PROG_MEM[IP][3:0];	// load address
  end
    
  // ************** INSTRUCTION DECODING AND EXECUTION *************** // 
  
  always @(posedge osc_clock) begin
 
    if (reset == 1) begin
		HALT_FLAG = 0;			// do not halt condition
		IP = 0;					// instruction pointer to start of PROG_MEM
		SP = 0;					// stack pointer to start of STAK_MEM
		A = 0;
		B = 0;
		data_out = 4'bZZZZ;
    end
    
    else if (reset == 0 && HALT_FLAG == 0) begin
    	IP = IP + 1;
    	
		if (INS == 0) begin	// ADD A, B
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

		else if (INS == 4) begin			// OUT A
		  data_out = A;
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
		
		else if (INS == 15)	begin	// HLT
		  HALT_FLAG = 1;
		end
	end
		
    
    
  
  end
  

endmodule

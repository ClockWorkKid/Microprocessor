module testbench();
          
	reg osc_clock = 0;			
	reg reset = 1;					
	reg [3:0] data_in;			// input to COM		

    wire prog_clk;
  	reg load_program = 0;
	reg [7:0] prog_in;			// programming port used to load instructions
	reg [3:0] prog_add;			// programming address
	
	wire [3:0] data_out;		// output from COM
	
	reg [7:0] PROG_MEM[15:0];		// instruction memory
    reg [3:0] DATA_MEM[15:0];		// data memory
	
  	assign prog_clk = load_program;
  
	computer COM(data_in, data_out, osc_clock, reset, prog_in, prog_clk, prog_add);
  
    integer counter;
  	integer clk;
	
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
      PROG_MEM[0]  = {MOV_A_BYT 	,	4'b0001 };
      PROG_MEM[1]  = {XCHG_B_A 		, 	NONE	};
      PROG_MEM[2]  = {MOV_A_BYT		,	4'b0100	};
      PROG_MEM[3]  = {SUB_A_B		,	NONE	};

      PROG_MEM[4]  = {JZ_ADD		,	4'd6	};
      PROG_MEM[5]  = {CALL_ADD		, 	4'd3	};
      PROG_MEM[6]  = {HLT			, 	NONE	};
	  PROG_MEM[7]  = {NONE			, 	NONE	};
      
      PROG_MEM[8]  = {NONE			, 	NONE	};
      PROG_MEM[9]  = {NONE			, 	NONE	};
      PROG_MEM[10] = {NONE			, 	NONE	};
      PROG_MEM[11] = {NONE			, 	NONE	};

      PROG_MEM[12] = {NONE			, 	NONE	};
	  PROG_MEM[13] = {NONE			, 	NONE	};
	  PROG_MEM[14] = {NONE			, 	NONE	};
	  PROG_MEM[15] = {NONE			, 	NONE	};

	// ---------------- MEMORY ---------------- //
      DATA_MEM[0]  = 4'd5;
      DATA_MEM[1]  = 4'd1;
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

  
  initial begin							// program the computer
    $dumpfile("dump.vcd");
    $dumpvars;
    
    for (counter = 0; counter < 16; counter = counter+1) begin
      # 1 load_program = 0;
      data_in = DATA_MEM[counter];
      prog_in = PROG_MEM[counter];
      prog_add = counter;
      # 1 load_program = 1;
    end
    
    # 1 reset = 0;

    # 32 $finish;
  
  end
  
  always # 1 osc_clock = !osc_clock;		// clock input to computer

endmodule

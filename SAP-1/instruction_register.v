// SAP-1 Instruction Register

/*
Instruction Register reads an instruction from RAM when enable_load == 0

Upper 4 bits of an instruction are always available on the output to controller sequence decoder
Controller sequence reads those instructions as necessary

Lower 4 bits are available on BUS when enable_output == 0

Register resets to 0 when clear == 1

Register activates on positive edge of clock

*/

module instruction_register(clock, clear, enable_load, enable_output, from_BUS, to_BUS, to_controller);
  
  input clock, clear, enable_load, enable_output;
  input [7:0] from_BUS;
  output [3:0] to_BUS, to_controller;
  
  reg[7:0] instructions;
  
  assign to_controller = instructions[7:4];
  assign to_BUS = enable_output ? 4'bZZZZ : instructions[3:0];
  
  always @(posedge clock) begin
    
    if (clear == 1'b1)
		instructions <= 8'b00000000;
    else if (enable_load == 1'b0)
		instructions <= from_BUS;
  end
    
endmodule

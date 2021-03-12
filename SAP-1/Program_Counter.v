// SAP-1 Program Counter

/*
Counter increments at a negative clock pulse when count == 1

Counter resets to 0 when clear == 0

Counter outputs program address to bus when enable_output == 1

Register data always available on RAM address 4 bits 
*/

module Program_Counter(clock, clear, count, enable_output, to_BUS);
  
  input clock, clear, count, enable_output;
  output [3:0] to_BUS;
  
  reg[3:0] counter;
  
  assign to_BUS = enable_output ? counter : 4'bZZZZ;
  
  always @(negedge clock) begin
    
    if (clear == 1'b0)
		counter <= 4'b0000;
    else if (count == 1'b1)
		counter <= counter + 4'b0001;
  end
    
endmodule

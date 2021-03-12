// SAP-1 Accumulator Design

/*
Accumulator loads 8 bits from bus using the input_from_BUS bits when enable_load == LOW

Accumulator outputs 8 bits to bus using the output_to_BUS bits when enable_output == HIGH

Accumulator data always available on output_to_ALU 8 bits 
*/

module Accumulator(from_BUS, to_BUS, register, enable_load, enable_output, clock);
  
  input enable_load, enable_output, clock;
  input [7:0] from_BUS;
  
  output reg[7:0] register;
  output tri[7:0] to_BUS;
  
  assign to_BUS = enable_output ? register : 8'bZZZZZZZZ;

  always @(posedge clock) begin
    
    if (enable_load == 1'b0)
      register <= from_BUS;
  end
    
endmodule

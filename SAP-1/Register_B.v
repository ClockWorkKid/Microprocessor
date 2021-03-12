// SAP-1 Register B Design

/*
Register loads 8 bits from bus using the from_BUS bits when enable_load == LOW

Register data always available on output_to_ALU 8 bits 
*/

module register_B(from_BUS, register, enable_load, clock);
  
  input enable_load, clock;
  input [7:0] from_BUS;
  
  output reg[7:0] register;
  
  always @(posedge clock) begin
    
    if (enable_load == 1'b0)
      register <= from_BUS;

  end
    
endmodule
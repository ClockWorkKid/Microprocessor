// SAP-1 Memory Access Register

/*
Register loads lower 4 bits from bus when enable_load == LOW

Register data always available on RAM address 4 bits 
*/

module MAR(from_BUS, register, enable_load, clock);
  
  input enable_load, clock;
  input [3:0] from_BUS;
  
  output reg[3:0] register;
  
  always @(posedge clock) begin
    
    if (enable_load == 1'b0)
      register <= from_BUS;

  end
    
endmodule

// SAP-1 RAM Design

/*
For this module, we will stick to a ROM type memory that only stored data

Later a read/write enabled RAM will be implemented

Register data always available on output 8 bits display 

RAM outputs data to BUS when enable_output == LOW
*/

module SAP_1(address, to_bus, enable_output);
  
  input [3:0] address;
  input enable_output;
  
  output [7:0] to_bus;
  
  parameter bytes = 16;
  
  wire [7:0] memory[bytes-1:0];	// 16X8 data storage
  
  assign to_bus = enable_output? 8'bZZZZZZZZ : memory[address];
  
  // RAM Data //
  assign memory[0] = 8'b11110000;
  assign memory[1] = 8'b11110001;
  assign memory[2] = 8'b11110010;
  assign memory[3] = 8'b11110100;
  
  assign memory[4] = 8'b11111000;
  assign memory[5] = 8'b11110011;
  assign memory[6] = 8'b11110110;
  assign memory[7] = 8'b11111100;
  
  assign memory[8] = 8'b11110111;
  assign memory[9] = 8'b11111110;
  assign memory[10] = 8'b11111001;
  assign memory[11] = 8'b11111101;
  
  assign memory[12] = 8'b11111111;
  assign memory[13] = 8'b00000000;
  assign memory[14] = 8'b00010000;
  assign memory[15] = 8'b01000000;
  
endmodule

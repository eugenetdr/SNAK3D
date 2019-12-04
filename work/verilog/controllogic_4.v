/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module controllogic_4 (
    input [17:0] opcode,
    output reg [1:0] asel,
    output reg [1:0] bsel,
    output reg [5:0] alufn,
    output reg wesnkhd,
    output reg wesnkpos,
    output reg wefood,
    output reg wescr,
    output reg wernd,
    output reg wetmr,
    output reg halt,
    output reg reset
  );
  
  
  
  always @* begin
    alufn = opcode[12+5-:6];
    asel = opcode[10+1-:2];
    bsel = opcode[8+1-:2];
    wesnkhd = opcode[7+0-:1];
    wesnkpos = opcode[6+0-:1];
    wefood = opcode[5+0-:1];
    wescr = opcode[4+0-:1];
    wernd = opcode[3+0-:1];
    wetmr = opcode[2+0-:1];
    halt = opcode[1+0-:1];
    reset = opcode[0+0-:1];
  end
endmodule
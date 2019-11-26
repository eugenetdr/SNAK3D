/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module sel4_2 (
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,
    input [1:0] sel,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    out = 1'h0;
    
    case (sel)
      2'h0: begin
        out = a;
      end
      2'h1: begin
        out = b;
      end
      2'h2: begin
        out = c;
      end
      2'h3: begin
        out = d;
      end
    endcase
  end
endmodule

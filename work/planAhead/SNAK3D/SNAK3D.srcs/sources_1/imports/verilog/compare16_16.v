/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compare16_16 (
    input z,
    input v,
    input n,
    input [5:0] alufn,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    out[0+15-:16] = 1'h0;
    
    case (alufn[1+1-:2])
      2'h1: begin
        out[0+0-:1] = z;
      end
      2'h2: begin
        out[0+0-:1] = n ^ v;
      end
      2'h3: begin
        out[0+0-:1] = z | (n ^ v);
      end
    endcase
  end
endmodule

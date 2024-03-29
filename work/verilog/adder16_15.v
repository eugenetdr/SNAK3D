/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder16_15 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  reg [15:0] s;
  
  reg [15:0] xb;
  
  always @* begin
    s = 1'h0;
    z = 1'h0;
    xb = b ^ {5'h10{alufn[0+0-:1]}};
    s = a + xb + alufn[0+0-:1];
    if (s == 1'h0) begin
      z = 1'h1;
    end
    if (alufn[0+1-:2] == 2'h2) begin
      s = a * b;
    end
    out = s;
    v = (a[15+0-:1] && xb[15+0-:1] && !s[15+0-:1]) || (!a[15+0-:1] && !xb[15+0-:1] && s[15+0-:1]);
    n = s[15+0-:1];
  end
endmodule

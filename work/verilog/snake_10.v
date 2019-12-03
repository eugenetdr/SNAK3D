/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module snake_10 (
    input clk,
    input rst,
    input [3:0] dx,
    input [3:0] dy,
    input [3:0] dz,
    input wesnkhd,
    input wesnkpos,
    output reg [11:0] snk_hd_pos,
    output reg [11:0] snk_bd_pos,
    output reg [11:0] snk_tl_pos
  );
  
  
  
  reg [3:0] M_hd_x_d, M_hd_x_q = 1'h0;
  reg [3:0] M_hd_y_d, M_hd_y_q = 1'h0;
  reg [3:0] M_hd_z_d, M_hd_z_q = 1'h0;
  reg [11:0] M_hd_pos_d, M_hd_pos_q = 1'h0;
  reg [11:0] M_bd_pos_d, M_bd_pos_q = 1'h0;
  reg [11:0] M_tl_pos_d, M_tl_pos_q = 1'h0;
  
  always @* begin
    M_hd_x_d = M_hd_x_q;
    M_hd_y_d = M_hd_y_q;
    M_hd_z_d = M_hd_z_q;
    M_hd_pos_d = M_hd_pos_q;
    M_tl_pos_d = M_tl_pos_q;
    M_bd_pos_d = M_bd_pos_q;
    
    if (wesnkhd) begin
      M_hd_x_d = (M_hd_x_q + dx);
      M_hd_y_d = (M_hd_y_q + dy);
      M_hd_z_d = (M_hd_z_q + dz);
      if ((M_hd_x_q + dx) == 4'hf) begin
        M_hd_x_d = 3'h4;
      end
      if ((M_hd_x_q + dx) == 3'h5) begin
        M_hd_x_d = 1'h0;
      end
      if ((M_hd_y_q + dy) == 4'hf) begin
        M_hd_y_d = 3'h4;
      end
      if ((M_hd_y_q + dy) == 3'h5) begin
        M_hd_y_d = 1'h0;
      end
      if ((M_hd_z_q + dz) == 4'hf) begin
        M_hd_z_d = 3'h4;
      end
      if ((M_hd_z_q + dz) == 3'h5) begin
        M_hd_z_d = 1'h0;
      end
    end
    if (wesnkpos) begin
      M_hd_pos_d = {M_hd_x_q, M_hd_y_q, M_hd_z_q};
      M_bd_pos_d = M_hd_pos_q;
      M_tl_pos_d = M_bd_pos_q;
    end
    snk_hd_pos = M_hd_pos_q;
    snk_bd_pos = M_bd_pos_q;
    snk_tl_pos = M_tl_pos_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_hd_x_q <= 1'h0;
      M_hd_y_q <= 1'h0;
      M_hd_z_q <= 1'h0;
      M_hd_pos_q <= 1'h0;
      M_bd_pos_q <= 1'h0;
      M_tl_pos_q <= 1'h0;
    end else begin
      M_hd_x_q <= M_hd_x_d;
      M_hd_y_q <= M_hd_y_d;
      M_hd_z_q <= M_hd_z_d;
      M_hd_pos_q <= M_hd_pos_d;
      M_bd_pos_q <= M_bd_pos_d;
      M_tl_pos_q <= M_tl_pos_d;
    end
  end
  
endmodule
/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module controls_7 (
    input clk,
    input rst,
    input [5:0] buttons,
    output reg [3:0] dx,
    output reg [3:0] dy,
    output reg [3:0] dz
  );
  
  
  
  localparam X_POS_direction = 3'd0;
  localparam X_NEG_direction = 3'd1;
  localparam Y_POS_direction = 3'd2;
  localparam Y_NEG_direction = 3'd3;
  localparam Z_NEG_direction = 3'd4;
  localparam Z_POS_direction = 3'd5;
  
  reg [2:0] M_direction_d, M_direction_q = X_POS_direction;
  
  reg [3:0] M_x_d, M_x_q = 1'h0;
  reg [3:0] M_y_d, M_y_q = 1'h0;
  reg [3:0] M_z_d, M_z_q = 1'h0;
  
  reg x_pos;
  
  reg x_neg;
  
  reg y_pos;
  
  reg y_neg;
  
  reg z_pos;
  
  reg z_neg;
  
  always @* begin
    M_direction_d = M_direction_q;
    M_x_d = M_x_q;
    M_y_d = M_y_q;
    M_z_d = M_z_q;
    
    x_pos = buttons[2+0-:1];
    x_neg = buttons[3+0-:1];
    y_pos = buttons[0+0-:1];
    y_neg = buttons[1+0-:1];
    z_pos = buttons[4+0-:1];
    z_neg = buttons[5+0-:1];
    
    case (M_direction_q)
      X_POS_direction: begin
        M_x_d = 1'h1;
        M_y_d = 1'h0;
        M_z_d = 1'h0;
        if (y_pos) begin
          M_direction_d = Y_POS_direction;
        end
        if (y_neg) begin
          M_direction_d = Y_NEG_direction;
        end
        if (z_pos) begin
          M_direction_d = Z_POS_direction;
        end
        if (z_neg) begin
          M_direction_d = Z_NEG_direction;
        end
      end
      X_NEG_direction: begin
        M_x_d = 4'hf;
        M_y_d = 1'h0;
        M_z_d = 1'h0;
        if (y_pos) begin
          M_direction_d = Y_POS_direction;
        end
        if (y_neg) begin
          M_direction_d = Y_NEG_direction;
        end
        if (z_pos) begin
          M_direction_d = Z_POS_direction;
        end
        if (z_neg) begin
          M_direction_d = Z_NEG_direction;
        end
      end
      Y_POS_direction: begin
        M_x_d = 1'h0;
        M_y_d = 1'h1;
        M_z_d = 1'h0;
        if (x_pos) begin
          M_direction_d = X_POS_direction;
        end
        if (x_neg) begin
          M_direction_d = X_NEG_direction;
        end
        if (z_pos) begin
          M_direction_d = Z_POS_direction;
        end
        if (z_neg) begin
          M_direction_d = Z_NEG_direction;
        end
      end
      Y_NEG_direction: begin
        M_x_d = 1'h0;
        M_y_d = 4'hf;
        M_z_d = 1'h0;
        if (x_pos) begin
          M_direction_d = X_POS_direction;
        end
        if (x_neg) begin
          M_direction_d = X_NEG_direction;
        end
        if (z_pos) begin
          M_direction_d = Z_POS_direction;
        end
        if (z_neg) begin
          M_direction_d = Z_NEG_direction;
        end
      end
      Z_POS_direction: begin
        M_x_d = 1'h0;
        M_y_d = 1'h0;
        M_z_d = 1'h1;
        if (x_pos) begin
          M_direction_d = X_POS_direction;
        end
        if (x_neg) begin
          M_direction_d = X_NEG_direction;
        end
        if (y_pos) begin
          M_direction_d = Y_POS_direction;
        end
        if (y_neg) begin
          M_direction_d = Y_NEG_direction;
        end
      end
      Z_NEG_direction: begin
        M_x_d = 1'h0;
        M_y_d = 1'h0;
        M_z_d = 4'hf;
        if (x_pos) begin
          M_direction_d = X_POS_direction;
        end
        if (x_neg) begin
          M_direction_d = X_NEG_direction;
        end
        if (y_pos) begin
          M_direction_d = Y_POS_direction;
        end
        if (y_neg) begin
          M_direction_d = Y_NEG_direction;
        end
      end
    endcase
    dx = M_x_q;
    dy = M_y_q;
    dz = M_z_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_direction_q <= 1'h0;
    end else begin
      M_direction_q <= M_direction_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_x_q <= 1'h0;
      M_y_q <= 1'h0;
      M_z_q <= 1'h0;
    end else begin
      M_x_q <= M_x_d;
      M_y_q <= M_y_d;
      M_z_q <= M_z_d;
    end
  end
  
endmodule

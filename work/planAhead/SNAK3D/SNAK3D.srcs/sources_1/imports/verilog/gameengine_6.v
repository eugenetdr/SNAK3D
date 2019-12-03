/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module gameengine_6 (
    input clk,
    input rst,
    input time_out,
    input [15:0] aluout,
    output reg [15:0] opcode
  );
  
  
  
  localparam OPC_CMP_TIME_FRAME = 16'hd400;
  
  localparam OPC_CMP_FOOD = 16'hcd40;
  
  localparam OPC_INCREMENT_SCORE = 16'h0284;
  
  localparam OPC_MOVE_SNK_HD = 16'h0020;
  
  localparam OPC_UPDATE_SNK_POS = 16'h0010;
  
  localparam OPC_SPAWN_FOOD = 16'h0008;
  
  localparam OPC_RENDER = 16'h000b;
  
  localparam WAIT_FRAME_gamefsm = 4'd0;
  localparam CHECK_TIME_gamefsm = 4'd1;
  localparam GAME_OVER_gamefsm = 4'd2;
  localparam CHECK_EAT_gamefsm = 4'd3;
  localparam INCREMENT_SCORE_gamefsm = 4'd4;
  localparam SPAWN_FOOD_gamefsm = 4'd5;
  localparam MOVE_SNK_HD_gamefsm = 4'd6;
  localparam UPDATE_SNAKE_POS_gamefsm = 4'd7;
  localparam CHECK_WRAP_gamefsm = 4'd8;
  localparam RENDER_gamefsm = 4'd9;
  
  reg [3:0] M_gamefsm_d, M_gamefsm_q = WAIT_FRAME_gamefsm;
  
  always @* begin
    M_gamefsm_d = M_gamefsm_q;
    
    opcode = 1'h0;
    
    case (M_gamefsm_q)
      WAIT_FRAME_gamefsm: begin
        opcode = 16'hd400;
        if (aluout == 1'h1) begin
          M_gamefsm_d = CHECK_TIME_gamefsm;
        end
      end
      CHECK_TIME_gamefsm: begin
        if (time_out == 1'h1) begin
          M_gamefsm_d = GAME_OVER_gamefsm;
        end else begin
          M_gamefsm_d = CHECK_EAT_gamefsm;
        end
      end
      CHECK_EAT_gamefsm: begin
        opcode = 16'hcd40;
        if (aluout == 1'h1) begin
          M_gamefsm_d = INCREMENT_SCORE_gamefsm;
        end else begin
          M_gamefsm_d = MOVE_SNK_HD_gamefsm;
        end
      end
      INCREMENT_SCORE_gamefsm: begin
        opcode = 16'h0284;
        M_gamefsm_d = SPAWN_FOOD_gamefsm;
      end
      SPAWN_FOOD_gamefsm: begin
        opcode = 16'h0008;
        M_gamefsm_d = MOVE_SNK_HD_gamefsm;
      end
      MOVE_SNK_HD_gamefsm: begin
        opcode = 16'h0020;
        M_gamefsm_d = UPDATE_SNAKE_POS_gamefsm;
      end
      UPDATE_SNAKE_POS_gamefsm: begin
        opcode = 16'h0010;
        M_gamefsm_d = RENDER_gamefsm;
      end
      RENDER_gamefsm: begin
        opcode = 16'h000b;
        M_gamefsm_d = WAIT_FRAME_gamefsm;
      end
      GAME_OVER_gamefsm: begin
        M_gamefsm_d = GAME_OVER_gamefsm;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_gamefsm_q <= 1'h0;
    end else begin
      M_gamefsm_q <= M_gamefsm_d;
    end
  end
  
endmodule

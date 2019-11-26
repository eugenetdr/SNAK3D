/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [16-1:0] M_alu_out;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu16_1 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n)
  );
  
  wire [16-1:0] M_aselector_out;
  reg [16-1:0] M_aselector_a;
  reg [16-1:0] M_aselector_b;
  reg [16-1:0] M_aselector_c;
  reg [16-1:0] M_aselector_d;
  reg [2-1:0] M_aselector_sel;
  sel4_2 aselector (
    .a(M_aselector_a),
    .b(M_aselector_b),
    .c(M_aselector_c),
    .d(M_aselector_d),
    .sel(M_aselector_sel),
    .out(M_aselector_out)
  );
  
  wire [16-1:0] M_bselector_out;
  reg [16-1:0] M_bselector_a;
  reg [16-1:0] M_bselector_b;
  reg [16-1:0] M_bselector_c;
  reg [16-1:0] M_bselector_d;
  reg [2-1:0] M_bselector_sel;
  sel4_2 bselector (
    .a(M_bselector_a),
    .b(M_bselector_b),
    .c(M_bselector_c),
    .d(M_bselector_d),
    .sel(M_bselector_sel),
    .out(M_bselector_out)
  );
  
  wire [2-1:0] M_clogic_asel;
  wire [2-1:0] M_clogic_bsel;
  wire [6-1:0] M_clogic_alufn;
  wire [1-1:0] M_clogic_wesnkhd;
  wire [1-1:0] M_clogic_wesnkpos;
  wire [1-1:0] M_clogic_wefood;
  wire [1-1:0] M_clogic_wescr;
  wire [1-1:0] M_clogic_wernd;
  wire [1-1:0] M_clogic_wetmr;
  reg [16-1:0] M_clogic_opcode;
  controllogic_4 clogic (
    .opcode(M_clogic_opcode),
    .asel(M_clogic_asel),
    .bsel(M_clogic_bsel),
    .alufn(M_clogic_alufn),
    .wesnkhd(M_clogic_wesnkhd),
    .wesnkpos(M_clogic_wesnkpos),
    .wefood(M_clogic_wefood),
    .wescr(M_clogic_wescr),
    .wernd(M_clogic_wernd),
    .wetmr(M_clogic_wetmr)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_5 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [16-1:0] M_game_opcode;
  reg [1-1:0] M_game_time_out;
  reg [16-1:0] M_game_aluout;
  gameengine_6 game (
    .clk(clk),
    .rst(rst),
    .time_out(M_game_time_out),
    .aluout(M_game_aluout),
    .opcode(M_game_opcode)
  );
  wire [4-1:0] M_control_dx;
  wire [4-1:0] M_control_dy;
  wire [4-1:0] M_control_dz;
  reg [6-1:0] M_control_buttons;
  controls_7 control (
    .clk(clk),
    .rst(rst),
    .buttons(M_control_buttons),
    .dx(M_control_dx),
    .dy(M_control_dy),
    .dz(M_control_dz)
  );
  wire [12-1:0] M_snake_snk_hd_pos;
  wire [12-1:0] M_snake_snk_bd_pos;
  wire [12-1:0] M_snake_snk_tl_pos;
  reg [4-1:0] M_snake_dx;
  reg [4-1:0] M_snake_dy;
  reg [4-1:0] M_snake_dz;
  reg [1-1:0] M_snake_wesnkhd;
  reg [1-1:0] M_snake_wesnkpos;
  snake_8 snake (
    .clk(clk),
    .rst(rst),
    .dx(M_snake_dx),
    .dy(M_snake_dy),
    .dz(M_snake_dz),
    .wesnkhd(M_snake_wesnkhd),
    .wesnkpos(M_snake_wesnkpos),
    .snk_hd_pos(M_snake_snk_hd_pos),
    .snk_bd_pos(M_snake_snk_bd_pos),
    .snk_tl_pos(M_snake_snk_tl_pos)
  );
  wire [1-1:0] M_score_out;
  reg [1-1:0] M_score_wescr;
  reg [16-1:0] M_score_aluout;
  score_9 score (
    .clk(clk),
    .rst(rst),
    .wescr(M_score_wescr),
    .aluout(M_score_aluout),
    .out(M_score_out)
  );
  wire [6-1:0] M_timer_game_time;
  wire [1-1:0] M_timer_time_out;
  wire [16-1:0] M_timer_clk_count;
  wire [16-1:0] M_timer_frame_period;
  reg [1-1:0] M_timer_wetmr;
  timer_10 timer (
    .clk(clk),
    .rst(rst),
    .wetmr(M_timer_wetmr),
    .game_time(M_timer_game_time),
    .time_out(M_timer_time_out),
    .clk_count(M_timer_clk_count),
    .frame_period(M_timer_frame_period)
  );
  wire [12-1:0] M_food_food_pos;
  reg [1-1:0] M_food_wefood;
  food_11 food (
    .clk(clk),
    .rst(rst),
    .wefood(M_food_wefood),
    .food_pos(M_food_food_pos)
  );
  wire [5-1:0] M_render_cols;
  wire [25-1:0] M_render_rows;
  reg [12-1:0] M_render_snk_hd_pos;
  reg [12-1:0] M_render_snk_bd_pos;
  reg [12-1:0] M_render_snk_tl_pos;
  reg [12-1:0] M_render_food_pos;
  reg [1-1:0] M_render_wernd;
  render_12 render (
    .clk(clk),
    .rst(rst),
    .snk_hd_pos(M_render_snk_hd_pos),
    .snk_bd_pos(M_render_snk_bd_pos),
    .snk_tl_pos(M_render_snk_tl_pos),
    .food_pos(M_render_food_pos),
    .wernd(M_render_wernd),
    .cols(M_render_cols),
    .rows(M_render_rows)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_bselector_d = 1'h0;
    M_control_buttons = io_button[0+4-:5];
    M_game_aluout = M_alu_out;
    M_alu_alufn = M_clogic_alufn;
    M_alu_a = M_aselector_out;
    M_alu_b = M_bselector_out;
    M_clogic_opcode = M_game_opcode;
    M_aselector_sel = M_clogic_asel;
    M_bselector_sel = M_clogic_bsel;
    M_snake_dx = M_control_dx;
    M_snake_dy = M_control_dy;
    M_snake_dz = M_control_dz;
    M_snake_wesnkhd = M_clogic_wesnkhd;
    M_snake_wesnkpos = M_clogic_wesnkpos;
    M_score_aluout = M_alu_out;
    M_score_wescr = M_clogic_wescr;
    M_timer_wetmr = M_clogic_wetmr;
    M_food_wefood = M_clogic_wefood;
    M_render_snk_hd_pos = M_snake_snk_hd_pos;
    M_render_snk_bd_pos = M_snake_snk_bd_pos;
    M_render_snk_tl_pos = M_snake_snk_tl_pos;
    M_render_food_pos = M_food_food_pos;
    M_render_wernd = M_clogic_wernd;
    M_aselector_b = M_snake_snk_hd_pos;
    M_aselector_c = M_score_out;
    M_bselector_c = 1'h1;
    M_game_time_out = M_timer_time_out;
    M_aselector_a = M_timer_frame_period;
    M_bselector_a = M_timer_clk_count;
    M_aselector_d = 1'h0;
    M_bselector_b = M_food_food_pos;
    io_led[16+0+5-:6] = M_timer_game_time;
    io_led[8+0+3-:4] = M_snake_snk_hd_pos[8+3-:4];
    io_led[0+4+3-:4] = M_snake_snk_hd_pos[4+3-:4];
    io_led[0+0+3-:4] = M_snake_snk_hd_pos[0+3-:4];
  end
endmodule

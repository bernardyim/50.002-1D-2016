/*
   This file was generated automatically by the Mojo IDE version B1.3.4.
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
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  reg [23:0] result;
  
  reg [7:0] alufn;
  
  reg [7:0] a;
  
  reg [7:0] b;
  
  reg [7:0] xb;
  
  integer overflow;
  
  integer n;
  
  integer z;
  
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
    alufn = io_dip[16+7-:8];
    a = io_dip[8+7-:8];
    b = io_dip[0+7-:8];
    result = 24'h000000;
    overflow = 1'h0;
    xb = 8'h00;
    n = 1'h0;
    z = 1'h0;
    if (alufn[1+4-:5] == 5'h00) begin
      xb = (b ^ {4'h8{alufn[0+0-:1]}});
      result[0+7-:8] = (a + xb + alufn[0+0-:1]);
      overflow = (a[7+0-:1] & xb[7+0-:1] & ~result[7+0-:1]) | (~a[7+0-:1] & ~xb[7+0-:1] & result[7+0-:1]);
      n = result[7+0-:1];
      z = result[0+7-:8] == 8'h00;
    end
    if (alufn[0+5-:6] == 6'h18) begin
      result[0+7-:8] = a & b;
    end
    if (alufn[0+5-:6] == 6'h1e) begin
      result[0+7-:8] = a | b;
    end
    if (alufn[0+5-:6] == 6'h16) begin
      result[0+7-:8] = a ^ b;
    end
    if (alufn[0+5-:6] == 6'h1a) begin
      result[0+7-:8] = a;
    end
    if (alufn[0+5-:6] == 6'h20) begin
      result[0+7-:8] = a << b;
    end
    if (alufn[0+5-:6] == 6'h21) begin
      result[0+7-:8] = a >> b;
    end
    if (alufn[0+5-:6] == 6'h23) begin
      result[0+7-:8] = $signed(a) >>> b;
    end
    if (alufn[0+5-:6] == 6'h33) begin
      result[0+7-:8] = a == b;
    end
    if (alufn[0+5-:6] == 6'h35) begin
      result[0+7-:8] = a < b;
    end
    if (alufn[0+5-:6] == 6'h37) begin
      result[0+7-:8] = a <= b;
    end
    if (alufn[0+5-:6] == 6'h12) begin
      result[0+7-:8] = a * b;
    end
    if (alufn[0+5-:6] == 6'h13) begin
      if (b == 1'h0) begin
        io_led[8+7+0-:1] = 1'h1;
      end else begin
        result[0+7-:8] = a / b;
      end
    end
    if (alufn[0+5-:6] == 6'h14) begin
      result[0+7-:8] = a - (a / b) * b;
    end
    if (alufn[0+5-:6] == 6'h1b) begin
      result[0+7-:8] = b;
    end
    if (alufn[0+5-:6] == 6'h36) begin
      result[0+7-:8] = a > b;
    end
    if (alufn[0+5-:6] == 6'h38) begin
      result[0+7-:8] = a >= b;
    end
    if (alufn[0+5-:6] == 6'h02) begin
      result = a + b;
      if (result > 24'h0000ff) begin
        overflow = 1'h1;
      end
    end
    if (alufn[0+5-:6] == 6'h03) begin
      result = a - b;
      if (result > 24'h0000ff) begin
        overflow = 1'h1;
      end
    end
    io_led[8+0+0-:1] = overflow;
    io_led[8+1+0-:1] = z;
    io_led[8+2+0-:1] = n;
    if (a == b) begin
      io_led[8+3+0-:1] = 1'h1;
    end
    io_led[0+7-:8] = result[0+7-:8];
  end
endmodule

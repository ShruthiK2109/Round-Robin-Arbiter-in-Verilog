`timescale 1ns/1ps

module Round_Robin_Arbiter_tb;

  logic         clk;
  logic         reset;
  logic [3:0]   req_i;
  logic [3:0]   gnt_o;

  // Instantiate the round robin arbiter (assuming the top-level module is named day15)
  Round_Robin_Arbiter uut (
    .clk(clk),
    .reset(reset),
    .req_i(req_i),
    .gnt_o(gnt_o)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    $dumpfile("round_robin_arbiter.vcd"); // for GTKWave
    $dumpvars(0, Round_Robin_Arbiter_tb);

    clk   = 0;
    reset = 1;
    req_i = 4'b0000;

    // Reset pulse
    @(posedge clk);
    reset = 0;

    // Random requests
    repeat (20) begin
      req_i = $urandom_range(0, 4'hF); // 0000 to 1111
      @(posedge clk);
    end

    $finish;
  end

  // Monitor output
  initial begin
    $display("Time\tclk\treset\treq_i\tgnt_o");
    $monitor("%0t\t%b\t%b\t%04b\t%04b", $time, clk, reset, req_i, gnt_o);
  end

endmodule
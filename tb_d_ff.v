module tb_d_flipflop;
    reg clk, reset, d;
    wire q;

    // Instantiate the D flip-flop (changed `.*` to explicit port mapping)
    d_flipflop d_flipflop_Inst (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation (toggle every 5 ns)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        d = 0;

        // Apply test stimulus
        #20 reset = 0;  // Release reset
        #10 d = 1;      // Set D to 1
        #10 d = 0;      // Set D to 0
        #10 d = 1;      // Set D to 1
        #10 d = 0;      // Set D to 0
        #10 d = 1;      // Set D to 1
        #10 d = 0;      // Set D to 0
        #50             // Wait for some time
        $stop;          // Stop the simulation
    end
endmodule


module test_D_Flip_Flop;

    reg D, Clk;
    wire Q, notQ;

    // Instantiate the D Flip-Flop
    D_Flip_Flop uut (
        .D(D),
        .Clk(Clk),
        .Q(Q),
        .notQ(notQ)
    );

    initial begin
        // Initialize the signals
        Clk = 0;
        D = 0;

        $display("Time\tClk\tD\tQ\tnotQ");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, Clk, D, Q, notQ);

        // Simulate D Flip-Flop behavior
        
        // First, let's toggle the clock and observe the behavior
        #10 D = 1; Clk = 1;  // Rising edge: Q should capture D = 1
        #10 Clk = 0;         // Falling edge: Q should hold the previous value (1)
        #10 D = 0; Clk = 1;  // Rising edge: Q should capture D = 0
        #10 Clk = 0;         // Falling edge: Q should hold the previous value (0)
        
        // Continue toggling the clock and changing D
        #10 D = 1; Clk = 1;  // Rising edge: Q should capture D = 1
        #10 Clk = 0;         // Falling edge: Q should hold the previous value (1)
        #10 D = 0; Clk = 1;  // Rising edge: Q should capture D = 0
        #10 Clk = 0;         // Falling edge: Q should hold the previous value (0)

        // Finish the simulation
        $finish;
    end

endmodule

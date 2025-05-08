module test_SR_Latch;

    reg S, R;
    wire Q, notQ;

    // Instantiate the SR latch module
    SR_Latch uut (
        .S(S),
        .R(R),
        .Q(Q),
        .notQ(notQ)
    );

    initial begin
        // Display header
        $display("Time\tS\tR\tQ\tnotQ");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, S, R, Q, notQ);

        // Apply test inputs
        S = 0; R = 0; #10; // Forbidden state for NAND latch
        S = 0; R = 1; #10; // Reset
        S = 1; R = 0; #10; // Set
        S = 1; R = 1; #10; // Hold

        // Repeat some cases to test memory
        S = 1; R = 1; #10; // Hold
        S = 0; R = 0; #10; // Forbidden

        $finish;
    end

endmodule

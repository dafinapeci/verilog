
module test_D_Latch;

    reg D, En;
    wire Q, notQ;

    D_Latch uut (
        .D(D),
        .En(En),
        .Q(Q),
        .notQ(notQ)
    );

    initial begin
        $display("Time\tEn\tD\tQ\tnotQ");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, En, D, Q, notQ);

        En = 0; D = 0; #10; // En low -> Q should hold (no change)
        En = 1; D = 0; #10; // Load 0 into Q
        En = 0; D = 1; #10; // En low -> Q holds 0
        En = 1; D = 1; #10; // Load 1 into Q
        En = 0; D = 0; #10; // En low -> Q holds 1

        $finish;
    end

endmodule

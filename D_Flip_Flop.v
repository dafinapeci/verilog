module D_Flip_Flop (
    input D,      
    input Clk,      
    output Q,
    output notQ
);

wire Y, notY;
wire notClk;

not g1(notClk, Clk);

D_Latch master (
        .D(D),
        .En(Clk),
        .Q(Y),
        .notQ(notY)
    );

D_Latch slave (
        .D(Y),
        .En(notClk),
        .Q(Q),
        .notQ(notQ)
    );

endmodule

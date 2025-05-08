// Ornek: 22118080094 Dafina Peci

module SR_Latch_NAND (
    input S,      // Active LOW Set
    input R,      // Active LOW Reset
    output Q,
    output notQ
);

    nand g1(Q, S, notQ);
    nand g2(notQ, R, Q);

endmodule

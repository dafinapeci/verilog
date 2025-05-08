
// Ornek: 22118080094 Dafina Peci

module D_Latch (
    input D,      // Active LOW Set
    input En,      // Active LOW Reset
    output Q,
    output notQ
);

wire notD;
not g1(notD, D);

wire DnandEn, notDnandEn;

nand g2(DnandEn, D, En);
nand g3(notDnandEn, notD, En);

SR_Latch_NAND uut(.S(DnandEn),
        .R(notDnandEn),
        .Q(Q),
        .notQ(notQ)
    );
endmodule 
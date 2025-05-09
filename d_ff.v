module d_flipflop (
    input clk,
    input reset,
    input d,
    output reg q  // reg needed because q is updated in always block
);

    always @(posedge clk or posedge reset) begin
        if (reset) 
            q <= 1'b0; // Reset state
        else 
            q <= d; // Capture D value at rising edge of clock
    end

endmodule


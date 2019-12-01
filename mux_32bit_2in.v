module mux_32bit_2in(
    input wire control,
    input wire [31:0] a,b,
    output wire [31:0] selected
);

    assign selected = (control)?b:a;

endmodule
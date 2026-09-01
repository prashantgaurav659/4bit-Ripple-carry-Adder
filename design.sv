// 1-Bit Full Adder Module
module full_adder(
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule

// Main 4-Bit Ripple Carry Adder Module
module ripple_carry_adder_4bit(
    input [3:0] A, B, // 4-bit inputs
    input Cin,        // 1-bit input carry
    output [3:0] Sum, // 4-bit output sum
    output Cout       // 1-bit output carry
);
    // Chote full adders ko aapas mein jodne ke liye internal wires
    wire c1, c2, c3;

    // 4 Full Adders ko instance (jodna) karna
    full_adder fa0 (A, B, Cin, Sum, c1);
    full_adder fa1 (A, B, c1,  Sum, c2);
    full_adder fa2 (A, B, c2,  Sum, c3);
    full_adder fa3 (A, B, c3,  Sum, Cout);

endmodule

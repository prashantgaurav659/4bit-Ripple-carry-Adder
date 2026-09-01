module tb_ripple_carry_adder;

    // Inputs (Reg banate hain testbench mein)
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs (Wire banate hain testbench mein)
    wire [3:0] Sum;
    wire Cout;

    // Design Under Test (DUT) ko connect karna
    ripple_carry_adder_4bit dut (
        .A(A), .B(B), .Cin(Cin), 
        .Sum(Sum), .Cout(Cout)
    );

    initial begin
        // Waveform/Graph file generate karne ke liye lines
        $dumpfile("dump.vcd");
        $dumpvars(1, tb_ripple_carry_adder);

        // Console par heading print karne ke liye
        $display("Time\t A \t B \t Cin \t Sum \t Cout");
        $display("--------------------------------------------");

        // Test Case 1: 2 + 3 (Cin = 0)
        A = 4'b0010; B = 4'b0011; Cin = 1'b0; #10;
        $display("%0dns\t %d \t %d \t  %b  \t  %d  \t  %b", $time, A, B, Cin, Sum, Cout);

        // Test Case 2: 5 + 5 (Cin = 0)
        A = 4'b0101; B = 4'b0101; Cin = 1'b0; #10;
        $display("%0dns\t %d \t %d \t  %b  \t  %d  \t  %b", $time, A, B, Cin, Sum, Cout);

        // Test Case 3: 15 + 1 (Max value check - Carry check)
        A = 4'b1111; B = 4'b0001; Cin = 1'b0; #10;
        $display("%0dns\t %d \t %d \t  %b  \t  %d  \t  %b", $time, A, B, Cin, Sum, Cout);

        $finish; // Simulation rokne ke liye
    end

endmodule

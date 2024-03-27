`include "full_half.v"

module full_half_tb;
reg A,B,Cin;
wire S, Cout;
FA dut(A,B,Cin,S,Cout);
initial
begin
    $dumpfile("full_adder.vcd");
    $dumpvars(1,full_half_tb);
#10
A<=1;B<=1;Cin<=0;
#10
A<=0;B<=0;Cin<=1;
#10
$finish();
end

endmodule
module HA(
    input A,B,
    output X,Y
);

xor(X,A,B);
and(Y,A,B);

endmodule


module FA(
    input A,B,Cin,
    output S, Cout
);

wire w1,w2,w3;

HA ha1(A,B,w1,w2);
HA ha2(w1,Cin,S,w3);
or(Cout, w3,w2);

endmodule
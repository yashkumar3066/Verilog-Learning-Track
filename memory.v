module memory(
    input en,rw,[3:0]datain,[5:0]addr,
    output reg [3:0]dataout
);

    reg [3:0]mem[0:63];

    always@(en,rw) begin
        if(en)begin
            if(rw)begin
                dataout=mem[addr];
            end
            else begin
                mem[addr]=datain;
            end
        end
        else begin
            dataout=4'bZ;
        end
        end
    
    


endmodule
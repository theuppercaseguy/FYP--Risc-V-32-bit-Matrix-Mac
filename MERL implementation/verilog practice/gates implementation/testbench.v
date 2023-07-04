module tb();


    //design call

    reg A,B; //inputs with reg
    wire Y; //outputs with wire

    //design initaion
    //module_name userName signals

    gate designundertest(
        .A(),
        .B(),
        .Y()
    );

    //provide stimulus
    initial begin //aik hi dafa chalta start me
        A <= 1'b0;
        B <= 1'b0;
        #100;//delay

        A <= 1'b0;
        B <= 1'b1;
        #100;//delay

        A <= 1'b1;
        B <= 1'b0;
        #100;//delay

        A <= 1'b1;
        B <= 1'b1;
        #100;//delay

    end

    initial begin
        $dumpfile("dump.vcd");//store variable change dump

        //mention varibale to dump
        $dumpvars(0);//all variables
    end

endmodule



`timescale 1ns / 1ps


module comparator_dataflow_N_bit #(parameter N=20) ( 
//N ???? ??  ?????? ????? N ?? ?? ??? 32? ???. ??? default ??
//N ?? ???? ?? ??? ???. ex)8? ??? 8?? ???? ?
    input [N-1:0] A, B,
    output equal, greater, less
    );

    assign equal = (A==B) ? 1:0; //xnor
    assign greater = (A>B) ? 1:0; // A*notB
    assign less = (A<B) ? 1:0; // notA*B
endmodule

module comparator_dataflow_N_bit_test (
    input [1:0] A, B,
    output equal, greater, less 
    );
    
    comparator_dataflow_N_bit #(.N(2)) c_16 (.A(A), .B(B), .equal(equal), .greater(greater), .less(less));
    // ??? ??, (????? ?? ?), ????, (??? ??)

endmodule


module comparator_N_bit_b #(parameter N = 2) (
    input [N-1:0] A, B,
    output reg equal, greater, less //always??? ???? ??? reg type?? ??
    );

    always @(A, B) begin //A,B? ?? ??? begin~end ?? ??? 1? ?? 
        // equal = (A == B) ? 1'b1 : 1'b0 ;
        // always? ?? assign? ? ? ??
        if (A == B) begin // ()?? ??? ??? begin~end ?? ??
            equal = 1;
            greater = 0;
            less = 0;
        end

        else if (A > B) begin // ()?? ??? ??? begin~end ?? ??
            equal = 0;
            greater = 1;
            less = 0;
        end

        else begin      // default ?? ? ?? ?. if ~ else if ~ else ?? ?? ??
            equal = 0;
            greater = 0;
            less = 1;
        end
    end
endmodule

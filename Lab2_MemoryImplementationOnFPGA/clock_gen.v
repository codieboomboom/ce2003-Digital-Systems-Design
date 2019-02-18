//Module  : clock generator
//Function : Generates 400 Hz clock from 100 Mhz clock

module clock_gen(
input    i_clk,
output   o_clk
);


reg [10:0] clock_scaller;

assign o_clk = clock_scaller[10];


always @(posedge i_clk)
begin
    clock_scaller  <=   clock_scaller + 1'b1;
end

endmodule

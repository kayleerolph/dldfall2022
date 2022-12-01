module FSM (clk, reset, sel);

    input logic clk;
    input logic reset;
    
    output logic sel;

    typedef enum        logic  {S0, S1} statetype;
    statetype state, nextstate;

    always_ff @(posedge clk, posedge reset)
        if (reset) state <= S0;
        else       state <= nextstate;

    always_comb 
        case (state)
            S0: begin
                nextstate <= S1;
                sel <= 1'b0;
            end

            S1: begin
                nextstate <= S1;
                sel <= 1'b1;
            end
            
            default: begin
                nextstate <= S0;
                sel <= 1'b0;
            end
        endcase
endmodule

module MUX (grid, Rgrid, sel, grid_out);
    input logic [63:0] grid;
    input logic [63:0] Rgrid;
    input logic sel;
    
    output logic [63:0] grid_out;

    assign grid_out = sel ? Rgrid : grid;


    
endmodule

module Register (clk, min, mout);

input logic clk;
input logic [63:0] min;

output logic [63:0] mout;

always @(posedge clk)
begin
mout <= min;
end

endmodule

module GOL (clk, reset, seed, Fgrid);

input logic clk;
input logic reset;
input logic [63:0] seed;

output logic [63:0] Fgrid;

logic sel;
logic [63:0] Rgrid;
logic [63:0] grid_out;
logic [63:0] grid_evolve;

FSM step1 (clk, reset, sel);

MUX step2 (seed, Rgrid, sel, grid_out);

datapath step3 (grid_out, grid_evolve);

Register step4 (clk, grid_evolve, Rgrid);

assign Fgrid = Rgrid;

endmodule

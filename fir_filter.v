module fir_filter #(parameter N = 4) (
    input clk,
    input rst,
    input signed [7:0] x,               // Input sample
    output reg signed [15:0] y          // Filtered output
);

    // Example coefficients (fixed values): h = [1, 2, 3, 4]
    reg signed [7:0] h [0:N-1];
    reg signed [7:0] x_reg [0:N-1];     // Shift register

    integer i;

    initial begin
        h[0] = 8'd1;
        h[1] = 8'd2;
        h[2] = 8'd3;
        h[3] = 8'd4;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < N; i = i + 1)
                x_reg[i] <= 8'd0;
            y <= 16'd0;
        end else begin
            // Shift samples
            for (i = N-1; i > 0; i = i - 1)
                x_reg[i] <= x_reg[i-1];
            x_reg[0] <= x;

            // Multiply and accumulate
            y <= 0;
            for (i = 0; i < N; i = i + 1)
                y <= y + x_reg[i] * h[i];
        end
    end
endmodule

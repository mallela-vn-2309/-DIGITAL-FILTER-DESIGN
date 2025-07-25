module tb_fir_filter;
    reg clk, rst;
    reg signed [7:0] x;
    wire signed [15:0] y;

    fir_filter uut(.clk(clk), .rst(rst), .x(x), .y(y));

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    task apply_input(input signed [7:0] sample);
        begin
            @(negedge clk);
            x = sample;
        end
    endtask

    initial begin
        rst = 1; x = 0;
        #20;
        rst = 0;

        // Apply input stream
        apply_input(8'd1);
        apply_input(8'd2);
        apply_input(8'd3);
        apply_input(8'd4);
        apply_input(8'd0);
        apply_input(8'd0);

        #100;
        $finish;
    end

    initial begin
        $monitor("T=%0t | x=%d -> y=%d", $time, x, y);
    end
endmodule

# -DIGITAL-FILTER-DESIGN
# COMPANY: COOTECH IT SOLUTIONS
# NAME: MALLELA VEERANIKHITHA
# INTERN ID: CT08DF2955
# DOMAIN: VLSI
# DURATION: 2 MONTHS
# MENTOR: NEELA SANTOSH

📌 Objective
The objective of this project is to design and simulate a Finite Impulse Response (FIR) filter using Verilog Hardware Description Language. FIR filters are key components in digital signal processing (DSP) used for tasks like noise reduction, signal shaping, and low/high-pass filtering. The focus of this task is to implement a basic 4-tap FIR filter using fixed coefficients and simulate its output with a Verilog testbench in ModelSim. This project aims to strengthen understanding of shift-register-based sample storage, multiply-and-accumulate (MAC) operations, RTL coding, and waveform analysis.

🛠️ Project Overview
A FIR filter performs convolution between input samples and a set of predefined coefficients. For this task, we implemented a 4-tap FIR filter where the output y[n] is calculated using the following equation:

markdown
Copy
Edit
y[n] = h0*x[n] + h1*x[n−1] + h2*x[n−2] + h3*x[n−3]
Here:

x[n] is the current input sample.

h0, h1, h2, h3 are constant coefficients set to 1, 2, 3, 4 respectively.

y[n] is the current output.

In the RTL implementation, shift registers are used to store previous input samples. On every clock cycle, the inputs are shifted, multiplied with their corresponding coefficients, and the products are summed to get the final output. The filter operates synchronously with a positive-edge clock and resets synchronously with an active-high reset signal.

🧪 Simulation and Testing
A Verilog testbench was written to apply a sequence of input samples to the FIR filter and observe its output. The stimulus was applied using a task that provides inputs at the negative edge of the clock, allowing time for internal computation before output changes. The input sequence applied was: 1, 2, 3, 4, 0, 0.

Simulation was performed using ModelSim. The RTL and testbench files were compiled, and the simulation was run. The waveform viewer displayed the expected progression of input (x) and output (y) values.

Here’s how the FIR filter output responded to inputs:

Input: 1, Output: 1

Input: 2, Output: 1*2 + 2*1 = 4

Input: 3, Output: 1*3 + 2*2 + 3*1 = 12

Input: 4, Output: 1*4 + 2*3 + 3*2 + 4*1 = 24

Input: 0, Output: 1*0 + 2*4 + 3*3 + 4*2 = 40

These results matched exactly with theoretical values, confirming the correct functionality of the FIR filter design.

📈 Results and Observations
The simulation results clearly demonstrated:

Accurate sample shifting through the pipeline.

Correct application of multiply-and-accumulate logic.

Outputs matched expected FIR filter behavior.

The waveform output was smooth, and signal transitions were logically aligned with the clock edges. This confirmed that both the RTL design and testbench timing were correctly implemented.

#OUTPUT

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/1b90a6ff-f54f-4b0e-8ec1-9e2ba1725ed8" />


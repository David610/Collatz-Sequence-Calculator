# Collatz-Sequence-Calculator
Collatz Sequence Calculator
An optimized MIPS assembly implementation of the Collatz conjecture sequence generator.

Overview

This program calculates the Collatz sequence for a given positive integer, following the rules of the Collatz conjecture:

If the number is even: Divide it by 2.

If the number is odd: Multiply it by 3 and add 1.

The program demonstrates the computation of the full sequence and its length, eventually reaching 1 for any valid input.

Features

Input Validation: Accepts positive integers within the range 1 to 999.

Complete Sequence Calculation: Outputs the entire sequence from the input to 1.

Sequence Length Calculation: Determines how many steps are required to reach 1.

Memory Efficiency: Uses a buffer to store intermediate results.

Error Handling: Detects and handles invalid inputs gracefully.

How to Use

Load the Program:

Open the program in a MIPS simulator (e.g., SPIM, MARS).

Input Handling:

By default, the program uses the test value 21. Modify this value in the .data segment to test other inputs.

Output:

The program displays the following:

Input value.

Length of the sequence.

Full Collatz sequence.

Technical Details

Memory Layout

Data Segment:

Strings for messages.

Buffer for storing sequence values (4000-byte aligned).

Test input stored as .word.

Buffer Management:

Efficiently allocates memory to handle up to 1000 steps (for edge cases).

Register Allocation

$s0: Current number in the sequence.

$s1: Pointer to the sequence buffer.

$s2: Sequence length counter.

$t0-$t2: Temporary registers for calculations.

Error Handling

Input Validation:

Only accepts numbers between 1 and 999.

Returns 0 and exits gracefully for invalid inputs.

Stack Management:

Ensures consistent execution with proper use of the stack for temporary data.

Example Execution

Input

21

Output

Input: 21
Sequence Length: 8
Sequence: 21 64 32 16 8 4 2 1

Improvements Over Basic Implementations

Robust input validation prevents invalid entries from causing undefined behavior.

Optimized memory usage ensures stability for larger sequences.

Clear and structured register usage simplifies debugging and maintenance.

Notes

This implementation is suitable for demonstration and educational purposes.

To modify the test input, edit the .word value in the .data segment of the program.

Credits

This project was developed as an example of MIPS assembly programming, exploring computational logic and efficient memory handling through the lens of the Collatz conjecture.


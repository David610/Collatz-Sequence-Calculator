# Collatz Sequence Calculator
# Author: David
# Date: January 2025
#
# Description:
# This MIPS assembly program implements the Collatz conjecture calculation.
# It takes a positive integer n and generates the Collatz sequence until reaching 1.
# For each number in the sequence:
# - If even, divide by 2
# - If odd, multiply by 3 and add 1

.data
str_prompt: .asciiz "Input: "
str_length: .asciiz "\nSequence length: "
str_sequence: .asciiz "\nSequence: "

.align 4
output_buffer: .space 4000

.text

.eqv SYS_PUTSTR 4
.eqv SYS_PUTCHAR 11
.eqv SYS_PUTINT 1
.eqv SYS_EXIT 10

main:
    # Display input prompt
    li $v0, SYS_PUTSTR
    la $a0, str_prompt
    syscall

    li $v0, SYS_PUTINT
    la $a0, test_number
    lw $a0, 0($a0)
    syscall

    li $v0, SYS_PUTSTR
    la $a0, str_length
    syscall

    move $v0, $zero
    # Call collatz function
    la $a0, output_buffer
    la $a1, test_number
    lw $a1, 0($a1)
    jal collatz
    move $t0, $v0

    # Display return value
    move $a0, $t0
    li $v0, SYS_PUTINT
    syscall

    # Display buffer contents
    li $v0, SYS_PUTSTR
    la $a0, str_sequence
    syscall

    add $t1, $zero, $zero
    la $t2, output_buffer
print_sequence:
    beq $t1, $t0, end_print_sequence

    li $v0, SYS_PUTINT
    lw $a0, 0($t2)
    syscall

    li $v0, SYS_PUTCHAR
    addi $a0, $zero, 32 # Space character
    syscall

    addi $t1, $t1, 1
    addi $t2, $t2, 4
    j print_sequence

end_print_sequence:

    # Program termination
    li $v0, SYS_EXIT
    syscall

.data
test_number: .word 21

.text
collatz:
    # Allocate stack space
    addi $sp, $sp, -16
    sw $ra, 12($sp)
    sw $s0, 8($sp)
    sw $s1, 4($sp)
    sw $s2, 0($sp)

    move $s0, $a1               # Starting number
    move $s1, $a0               # Buffer pointer
    li $s2, 0                   # Counter

    # Input validation (0 < n < 1000)
    li $t0, 1000
    slt $t1, $s0, $t0
    sgt $t2, $s0, $zero
    and $t1, $t1, $t2
    beqz $t1, invalid_input

collatz_loop:
    sw $s0, 0($s1)
    addi $s1, $s1, 4
    addi $s2, $s2, 1

    li $t0, 1
    beq $s0, $t0, valid_end

    andi $t0, $s0, 1
    bnez $t0, handle_odd

    srl $s0, $s0, 1
    j collatz_loop

handle_odd:
    sll $t0, $s0, 1
    add $s0, $t0, $s0
    addi $s0, $s0, 1
    j collatz_loop

invalid_input:
    li $s2, 0

valid_end:
    move $v0, $s2
    lw $ra, 12($sp)
    lw $s0, 8($sp)
    lw $s1, 4($sp)
    lw $s2, 0($sp)
    addi $sp, $sp, 16
    jr $ra
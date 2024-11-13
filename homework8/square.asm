# Program File: square.asm
# Author: Giovanni Sferrazza
# Purpose: square an interger

.data
prompt: .asciiz "Please enter an integer: "
output: .asciiz " squared is "

.text
main:
    # Prompt the user for input
    addi    $v0, $0, 4    # System call 4: print string
    la      $a0, prompt   # Load prompt into $a0
    syscall

    # Read input from the user
    addi    $v0, $0, 5    # Read integer
    syscall
    add		$s0, $v0, $0


    # Compute the Square
    mult	$v0, $v0			# $v0 * v01 = Hi and Lo registers
    mflo	$s1					# copy Lo to $t2
    



    # Output the orginal input
    addi    $v0, $0, 1 # System call one prints interger
    add     $a0, $s0, $0
    syscall

    # Output the text
    addi    $v0, $0, 4
    la      $a0, output
    syscall

    # Output the doubled value
    addi    $v0, $, 1
    add     $a0, $s1, $0
    syscall

    # Terminate the program
    addi    $v0, $0, 10
    syscall

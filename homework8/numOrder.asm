# Program File: order.asm
# Author: Giovanni Sferrazza
# Purpose: determine if a set of numbers are in order or not

.data
prompt: .asciiz "Enter the first number: "
prompt1: .asciiz "Enter the second number: "
prompt2: .asciiz "Enter the third number: "
outputIn: .asciiz " in order"
outputNotIn: .asciiz " not in order"
space: .asciiz " " # Added to create spacing for output formatting

.text
main:
    # Prompt the user for the first number
    addi    $v0, $0, 4    # System call 4: print string
    la      $a0, prompt   # Load prompt into $a0
    syscall

    # Read input from the user
    addi    $v0, $0, 5    # Read integer
    syscall
    add		$s0, $v0, $0

    # Prompt the user for the second number
    addi    $v0, $0, 4    # System call 4: print string
    la      $a0, prompt1   # Load prompt into $a0
    syscall

    # Read input from the user
    addi    $v0, $0, 5    # Read integer
    syscall
    add		$s1, $v0, $0

    # Prompt the user for the third number
    addi    $v0, $0, 4    # System call 4: print string
    la      $a0, prompt2   # Load prompt into $a0
    syscall

    # Read input from the user
    addi    $v0, $0, 5  # Read integer
    syscall
    add		$s2, $v0, $0

    # Print the first number
    addi    $v0, $0, 1  # Print integer
    move    $a0, $s0
    syscall

    # Print space
    addi    $v0, $0, 4  # Print string
    la      $a0, space
    syscall

    # Print second number
    addi    $v0, $0, 1
    move    $a0, $s1
    syscall

    # Print space
    addi    $v0, $0, 4
    la      $a0, space
    syscall

    # Print third number
    addi    $v0, $0, 1
    move    $a0, $s2
    syscall

    # First check ascending
    ble     $s0, $s1, second_asc 
    j       desc

second_asc:
    ble     $s1, $s2, in_order
    j       not_in_order 

desc:
    bge     $s0, $s1, second_desc 
    j       not_in_order

second_desc:
    bge     $s1, $s2, in_order
    j       not_in_order

in_order:
    addi    $v0, $0, 4
    la      $a0, outputIn
    syscall
    j       terminate # Jump to terminate

not_in_order:
    addi      $v0, $0, 4      
    la      $a0, outputNotIn    
    syscall
    j		terminate # Jump to terminate
    

terminate:
    addi    $v0, $0, 10
    syscall

# Program File: OddInt.asm
# Author: Giovanni Sferrazza
# Purpose: compute the sum of

.data
prompt:  .asciiz "Enter the first number: "
prompt1: .asciiz "Enter the second number: "


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
    addi    $v0, $0, 4     # System call 4: print string
    la      $a0, prompt1   # Load prompt into $a0
    syscall

    # Read input from the user
    addi    $v0, $0, 5    # Read integer
    syscall
    add		$s1, $v0, $0

    # Check bounds to ensure lower bounds are in correct spots
    ble     $s0, $s1, begin_sum

    # Swap logic
    move    $t0, $s0   # Store s0 in temp
    move    $s0, $s1   # Move s1 to s0
    move    $s1, $t0   # Move t0 to s1

begin_sum:
    # Set sum and loop counters
    move   $t1, $s0 # Set t1 to lower bound
    li     $t2, 0   # initalize the sum in t2

loop:
    andi	$t3, $t1, 1			# $t3 = $t1 & 1
    beq		$t3, $0, skip	    # if even skip

    # Add the odd num to the sum
    add     $t2, $t2, $t1

skip:
    # Increment the loop count and check if at end
    addi    $t1, $t1, 1
    ble     $t1, $s1, loop

    # Move then print result
    move    $a0, $t2
    li      $v0, 1
    syscall

    # Terminate the program
    li      $v0, 10
    syscall

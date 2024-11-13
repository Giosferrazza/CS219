# Program File: gas.asm
# Author: Giovanni Sferrazza
# Purpose: Calculate the maximum distance that a car can travel on a full tank

.data
prompt: .asciiz "Enter gas tank capacity: "
prompt1: .asciiz "Enter mpg of the car: "
output: .asciiz "The car can go "
output1: .asciiz " miles"


.text
main:
    # Prompt the user for tank capacity
    addi    $v0, $0, 4    # System call 4: print string
    la      $a0, prompt   # Load prompt into $a0
    syscall

    # Read input from the user
    addi    $v0, $0, 5    # Read integer
    syscall
    add		$s0, $v0, $0


    # Prompt the user for MPG
    addi    $v0, $0, 4    # System call 4: print string
    la      $a0, prompt1   # Load prompt into $a0
    syscall

    # Read input from the user
    addi    $v0, $0, 5    # Read integer
    syscall
    add		$s1, $v0, $0
    

    # Compute the Product
    mult	$s0, $s1		# $v0 * v01 = Hi and Lo registers
    mflo	$s2				# copy Lo to $t2


    # Output the text
    addi    $v0, $0, 4
    la      $a0, output
    syscall

    # Output the product
    addi    $v0, $0, 1
    add     $a0, $s2, $0
    syscall

    # Output the text
    addi    $v0, $0, 4
    la      $a0, output1
    syscall

    # Terminate the program
    addi    $v0, $0, 10
    syscall

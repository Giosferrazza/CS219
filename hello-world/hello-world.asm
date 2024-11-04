# Program File: hello-world.asm
# Author: Giovanni Sferrazza
# Purpose: Hello, World!

.data       # Section for static data
greeting: .asciiz "Hello, World!"    # Hello, World greeting to print

.text       # Section for program instructions
main:       # label for the main program
    addi	$v0, $0, 4		    # $v0 = 01  0
    la		$a0, greeting       # $a0 = greeting
    syscall 

    addi   	$v0,  $0, 10        # Service 10 is to terminate a program
    syscall
    

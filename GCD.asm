         .text 
         .globl main

main: li $v0, 4 
         la $a0, First 
         syscall                # Ask for the first integer

         li $v0, 5 
         syscall                # Read  
         add $t0, $0, $v0       # ----> $t0

         li $v0, 4 
         la $a0, Second 
         syscall                # Ask for the second integer

         li $v0, 5 
         syscall                # Read 
         add $t1, $0, $v0       # ----> $t1

loop:    beq $t0, $t1, exit     # if the numbers are equal then exit 
      bgt $t0, $t1, breakit     #(if $t0>$t1) ---> breakit 
       subu $t1, $t1, $t0      # and replace the bigger with the result 
        b loop                  # then continue 


#loop : 
#beq $t0,$t1, exit
#slt $t5,$t0,$t1
#beq $t5,$0,breakit
#subu $t1, $t1, $t0
#j loop

breakit:   
         subu $t0, $t0, $t1 
         j loop


#checkk:
#xor $t0,$t0,$t1
#xor $t1,$t1,$t0
#xor $t0,$t0,$t1
#j loop

exit:    li $v0, 4 
         la $a0, Ans 
         syscall                # Print "The GCD: "

         add $a0, $0, $t0 
         li $v0, 1 
         syscall                # Print GCD


         .data 
First:   .asciiz "Calculating GCD of two integers.\nEnter first integer: " 
Second:  .asciiz "Enter second integer: " 
Ans:     .asciiz "GCD: " 


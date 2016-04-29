.text
.globl main
main:
		li $v0, 4					#input form user 
		la $a0, size
		syscall
		li $v0, 5
		syscall
		move $a2, $v0				#num lines -> $a2
		jal triangle				#call subroutine triangle
		nop
		
		li $v0, 10	
		syscall
		nop

.globl triangle
triangle:
	
		addiu $sp, $sp, -4			
		sw $ra, ($sp)				# push $ra to the  stack
		li $s0, 1					# counter $s0
		move $s1, $a2				# move 

loopIT:

		bgt $s0, $s1, endLoop
		move $a3, $s0
		jal starline				#call Subroutine starline
		nop

		li $v0, 4	
		la $a0, newline
		syscall
		addiu $s0, $s0, 1   		#increament number of stars
		j loopIT
		nop
		
endLoop:

		lw $ra, ($sp)
		addiu $sp, $sp, 4
		jr $ra
		nop

.globl starline
starline:

		li $t1, 0					# counter -> $t1
		move $t2, $a3				# stars per line -> $t2

loopME:

		beq $t1, $t2, exit
		li $v0, 4
		la $a0, star				# print stars
		syscall
		addiu $t1, $t1, 1			# counter=counter+1  $t=$t+1	
		j loopME
		nop
	
exit:
		jr $ra							
		nop

	.data
		size: .asciiz "How many lines do you want ? \n"
		star: .asciiz "*"
		newline: .asciiz "\n"
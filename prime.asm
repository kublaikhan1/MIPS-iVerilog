#Hamad Khawaja
#Assignment 1
#Prime number program Assembly
#Real instructions
#Computer Architecture 
##############################

.data 		 									#placed in section of program identified with assembler directive .data
					 									#declares variable names used in program; storage allocated in main memory (RAM)

prompt: 		.asciiz "\n\nEnter a number(0 or press enter to exit): "
is_prime: 		.asciiz "It is a prime number."
is_not_prime: 	.asciiz "It is not a prime number."
exit_message: 	.asciiz "\n\n#Program has exit..."

.text      									#placed in section of text identified with assembler directive .text

main:                       #main
loop_1:											#loop_1 label
	lui $3, 4097							#prompt input, (I-type instruction)load constant prompt at address 4097=1001 hex to upper immediate 16bits
	ori $a0,$3,0							#extent the immediate value with 0 ($3 or $0 stor in $a0)
	addi $v0,$0, 4						#prompt syscall add 4(print string) to register $v0
	syscall										#system call

	addi $v0,$0, 5						#take input from user add 5(read integer) to $v0
	syscall										#system call

	add $t1, $v0, $zero       #add $v0 $zero store in $t1
	slt $10, $0, $v0					#terminate when <=0 is inputted if $0<$v0 put 1 in $10 else 0
	beq $10, $0, exit					#branch if equal to exit label
	beq $t1, 2, isPrime				#when 2 is user input branch if equal to isPrime label
	beq $t1, 3, isPrime				#when 3 is user input branch if equal to isPrime label

	addi $t0,$0, 2						#add 2 into $t0
	div $t1, $t0							#see if input divisible by 2 $t1/$t0
	mflo $t4									#move quotient from low
	mult $t4, $t0							#multiply low quotient to 2($t0)
	mflo $t4									#move from low store in $t4
	beq $t4, $t1, isNotPrime  #if $t4 == $t1 branch to isNotPrime

	addi $t0,$0, 3            #add 3 into $t0

loop_2:
	div $t1, $t0							#see if divisible $t1/$t0
	mflo $t4									#move quotient from low
	mult $t4,$t0							#multiply low quotient to 3($t0)
	mflo $t4									#move from low store in $t4
	beq $t4, $t1, isNotPrime  #if $t4 == $t1 branch to isNotPrime

	addi $t0, $t0, 2					#continue the loop add 2 to $t0
	#blt $t0, $t1, loop_2     #pseudo instruction
	slt $10, $8, $9						#if $t0<$t1 put 1 in $10 else 0
	bne $10, $0, loop_2				#branch if not equal $10 and $0 to loop_2


isPrime:										#isPrime Label
lui $5, 4097								#load upper 4097=1001 hex immediate address of constant is_prime to $5
ori $4, $5, 45							# ori immediate value 45 with $5 and stor in $4(print string)
addi $v0,$0, 4							#add 4 in $v0 for print string system call register

syscall											#system call
j loop_1										#jump to loop_1

isNotPrime:									#isNotPrime label
	lui $4,4097								#load upper immediate address label prompt
	ori $a0,$4,67							#ori address 67 to extend immediate value to lower immediate
	addi $v0,$0, 4						#add 4 in $v0 for print string system call register
	syscall										#system call
	j loop_1									#jump to loop_1

exit:												#exit label
	lui $10,4097							#load upper immediate address label exit
	ori $4,$10,93							#ori address 93 to extend immediate value to lower immediate
	addi $v0,$0, 4						#add 4 in $v0 for print string system call register
	syscall										#system call
	addi $v0,$0, 10						#add 10 in $v0 for termination program system call register
	syscall										#system call

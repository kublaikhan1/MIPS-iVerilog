
.data 
size: .asciiz "How many lines do you want ?  \n" 	    #Text output 
numStars: .word 8		                            #Space to store input 
star:     .asciiz "*" 						 
newline:  .asciiz "\n"						 
end:   .asciiz "Thank you for using the program!"

.text
main: 

la $a0, size						   #load address of input 
li $v0, 4						   # Load 4 into v0, op code to print
syscall 																

la $a0, numStars				           #loads address of space to store input from user 
li $a1, 8						    #buffer space to store number of 8
li $v0, 5		
syscall 		 

 
li $s0, 1		 
move $s1, $v0		        #put read int into s1
li $t0, 0
li $t1, 0			#t1 holds stars per line 
li $t2, 1			#t2 holds stars needed per line 

la $a0, star		        #Load star "*" into the a0 address
li $v0, 4			#Loading op code to print string 

triangle:
beq $t1, $t2,starline 
bne $t1, $t2 starLoop        	
							   
starLoop:			        	
syscall				#print 1 star 				  	
addi $t1, $t1, 1 	        #incremenet				  	      	
j triangle	

starline:		      
la $a0, newline 				#load new line into memory address
syscall 			    		#print new line char so that system skips to next line to begin printing stars 
la $a0, star  					#load star back into the memory to continue printing next row of stars 
beq $t1, $s1 endProgram			        #If num of stars per line is equal to num of lines needed end
li $t1, 0				        #since on new line now, num of stars is reset to 0
addi $t2, $t2, 1
j triangle

endProgram: 
la $a0, end
syscall
li $v0, 10					# op code for terminate 
syscall 

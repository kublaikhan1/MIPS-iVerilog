##
## Program that evaluates the expression: 24xy + 15x − 9y + 48
##
## Register Use:
##  $5 base register, address of x 
##  $6 x   
##  $7 base register, address of y
##  $8 y   
      
      .text
      .globl main
 
main:
	
		ori $6, $0, 0 	# $0 = 0 register clean	
		
    	lui $5, 0x1000 	# $5 = 0x1000     
    	lw $6, 0($5) 	# $6 = 0x1000 Load x

		lw $4,4($5)		 # $6 = 0x1000 Load y
 
		ori $10, $0, 0 	# $10 = 0 register clean	
 
    	mult $4, $6 	# lo = xy
    	mflo $10 		# $10 = xy
		
		ori $11,$0,32   # $11=32
		mult $10,$11    # $10=32*xy
		mflo $1			#mflo->$1
 
    	ori $15, $0, 15 	# $15 = 15
   		mult $15, $6		# lo 15x
   		mflo  $9 			# $9 = 15x
   		addu $15, $9, $1 	# $15 = 32xy + 15x
		 
   		 ori $7, $0, 9 		# $7 = 9
   		 mult $7, $4 		# lo = 9y
   		 mflo $2 			# $2 = 9y

   		 subu $2, $15, $2   # $2 =  32xy + 15x -9y
		
   		 addiu $2, $2, 48   # $2 = 32xy + 15x -9y + 48
		 
   		 sw $2, 8($5) # Store result in answer  
		 
         .data
      x: .word 1 # defines x to be word 5
      y: .word 1 # defines y to be word 5
 answer: .word 0 # defines answer to be word 0 
 
## End of file


	
	
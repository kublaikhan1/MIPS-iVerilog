       
      .text
      .globl main
 
main:
      
	ori $3, $0, 0	  # stores 0 in register 3, 1 is the sum 
	ori $4, $0, 1 	  # stores 1 in register 4, 1 is the counter
	ori $5, $0, 101   # stores 100 in register 5

	top: 		  # the top of the loop
	beq $4, $5, exit  # branches out of the loop to exit if $4 and $5 are equal
	mult $4,$4
	mflo $2
	addu $3,$3,$2
	addiu $4,$4, 1    # increments the counter by 1
	  j  top 	  # jumps to the top of the loop
      
      exit : 		  # end of the loop  
      sll $0 , $0 , 0 
	  
## End of file

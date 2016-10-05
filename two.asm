.text
.globl main
main:

   ori $1, $0, 0x01 	# puts a single bit into register 1
   sll $10, $1, 1 		# shifts register $1 to the left by 1 and stores in register 10
   or  $1, $1, $10 		# performs bitwise or of $1 and $10 into $1 
   sll $10, $1, 2 		# shifts register $1 to the left by 2 and stores in register 10
   or  $1, $1, $10 		# performs bitwise or of $1 and $10 into $1 
   sll $10, $1, 4 		# shifts register $1 to the left by 4 and stores in register 10
   or  $1, $1, $10 		# performs bitwise or of $1 and $10 into $1 
   sll $10, $1, 8 		# shifts register $1 to the left by 8 and stores in register 10
   or  $1, $1, $10  	# performs bitwise or of $1 and $1 into $10 
   sll $10, $1, 16 		# shifts register $1 to the left by 16 and stores in register 10
   or  $1, $1, $10 		# performs bitwise or of $1 and $10 into $1
	   
	##end 
	
.text
.globl main
main:

	ori $5,$0,1   #x=1
	addiu $6,$0,1  #y=1
	
    #x->$5
	#y->$6
	#quotient-> $11
	#remainder->$12

	ori $7,$0,7   #7->$7
	mult $7,$5    #7*x
	mflo $7		  #7x->$7	
	addiu $8,$7,15   #7x+15->$8
	
	ori $9,$0,8     #8->$9
	mult $5,$9      #8*x 
	mflo $9         #8x->$9
	subu $10,$9,$6   #8x-y->$10
	
	div $8,$10       #7x+15/8x-y
	mflo $11		#quotient
	mfhi $12		#remainder
	
	##end 
	
	
	

	.text
	.globl main
	
main:
	ori $4,$0,2      # x = 2 in $5
	mult $4, $4      # x*x
	mflo $10	 # move x^2 in lo to $2
	
	ori $6, $0,4      # 4-> $6
	multu $10, $6     # 4 * x^2 
	mflo $11	  # $11 = 4 * x^2
	
	ori $7,$0,5	  # 5 -> $7
	mult $7,$4	  # 5x
	mflo $12 	  # 5x-> $12
	
	addu $13,$11,$12   # 4x^2+5x->$13
	addu $14,$13,-32   #final answer by subtracting 32 from $13
	
	##end

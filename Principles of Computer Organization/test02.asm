	add $t0, $zero, $zero
	addi $t1, $zero, 5 
loop:
	beq $t0, $t1, quit
	addi $t0, $t0, 1
	j loop
quit:
	addi $t1, $t1, 1

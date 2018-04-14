addi $t0,$zero,2
addi $t1,$zero,3
add $t2,$t1,$t0
sub $t3,$t1,$t0
and $t4,$t1,$t0
or $t5,$t1,$t0
sw $t0, 0($zero)
lw $t6, 0($zero)
lui $s0,1
slt $s1,$t0,$t1
sltu $s2,$t0,$t1
slti $s3,$t0,3
sltiu $s4,$t0,3

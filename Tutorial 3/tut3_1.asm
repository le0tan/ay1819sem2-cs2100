addi $s0, $zero, 0
addi $s1, $s5, -1
addi $s3, $zero, 1

Loop:	slt $t0, $s0, $s1
		beq $t0, $zero, Exit
		beq $s3, $zero, Exit
		# Inner statement
		addi $t1, $s0, $s4	# GET THE ADDRESS OF LOW
		lb $t1, 0($t1)
		addi $t2, $s1, $s4	# GET THE ADDRESS OF HIGH
		lb $t2, 0($t2)
		beq $t1, $t2, Else	# if(string[low]==string[high]) goto else
		# THEN
		addi $s3, $zero, 0
		j End
		Else:
			addi $s0, $s0, 1
			addi $s1, $s1, -1
		End:
Exit:
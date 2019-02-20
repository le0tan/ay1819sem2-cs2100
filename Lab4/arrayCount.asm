# arrayCount.asm
  .data 
arrayA: .word 1, 0, 2, 0, 3, 26, 47, 234   # arrayA has 8 values
count:  .word 8             # dummy value

  .text
main:
    # code to setup the variable mappings
	la	$t0,	arrayA
	la	$t8,	count
	addi	$t6,	$zero,	0	# Store the count in $t6
    # code for reading in the user value X
	li	$v0,	5
	syscall
	addi	$t7,	$v0,	0	# X -> $t7
    # code for counting multiples of X in arrayA
	addi	$t5,	$t7,	-1	# $t5 is mask
	addi	$t1,	$zero,	0	# $t1 = 0
Loop:	slti	$t2,	$t1,	8	# $t2 for branch control, $t1 is i
	beq	$t2,	$zero,	Exit
	lw	$t4,	0($t0)		# Load arrayA[i] to $t4
	and	$t2,	$t4,	$t5	# $t2 is the remainder of arrayA[i] % X
	bne	$t2,	$zero,	Jump
	addi	$t6,	$t6,	1
Jump:	
	addi	$t0,	$t0,	4	# *arrayA++
	addi	$t1,	$t1,	1	# i++
	j	Loop
Exit:
    # code for printing result
	li	$v0,	1
	addi	$a0,	$t6,	0
	syscall

	# load correct count
	sw		$t6,	0($t8)

    # code for terminating program
	li  $v0, 10
	syscall

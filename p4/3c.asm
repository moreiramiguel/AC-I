# array:		$t0
# i:			$t1
# iultimo:		$t2
# soma:			$t3
# SIZE-1:		$t4
# array[i]:		$t5
		
	.data
	.eqv	SIZE, 4
	.eqv	print_int10,1 
array:	.word	7692, 23123, 532, 2345
	.text
	.globl main
	
main:	li	$t1,0			#i = 0
	li	$t3,0			#soma = 0
	li	$t4, SIZE		# $t4 = size
	sub	$t4, $t4, 1		# $t4 = size - 1
	sll	$t4, $t4, 2		# i*4
	la	$t0, array		# $t0 = array
	addu	$t2, $t0, $t4		#iultimo = array + size  1	

while:	la	$t0, array		
	add	$t0, $t0, $t1
	lw	$t5, 0($t0)
	bgtu	$t0, $t2, endw
	add	$t3, $t3, $t5
	addiu	$t1, $t1, 4
	j 	while
	
endw:	move	$a0, $t3
	li	$v0, print_int10
	syscall
	
	jr	$ra
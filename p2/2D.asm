	.data
	.text
	.globl main
	
main:
	#valores
	li	$t0, 0x11110000
	move	$t1, $t0
	
	srl 	$t2, $t1, 4
	xor	$t1, $t1, $t2
	srl	$t2, $t1, 2
	xor	$t1, $t1, $t2
	srl 	$t2, $t1, 1
	xor	$t1, $t1, $t2
	move	$t3, $t1

	jr	$ra
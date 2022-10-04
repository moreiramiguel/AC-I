	.data
	.text
	.globl main
	
main:
	li	$t0, 0x11110000
	
	srl	$t1, $t0, 1
	xor	$t2, $t1, $t0
	
	jr	$ra
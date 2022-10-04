	.data
	.text
	.globl main
	
main:
	#valores
	ori	$t0, $0, 0x5C1B
	ori	$t1, $0, 0xA3E4
	
	#operaçoes logicas
	and	$t2, $t0, $t1
	or	$t3, $t0, $t1
	nor	$t4, $t0, $t1
	xor	$t5, $t0, $t1
	
	jr	$ra
	
# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0
# Sub-rotina intermédia 
		.data
		.eqv MAX_STR_SIZE, 33
		.eqv print_string, 1
		.eqv read_int, 5
str:		.space 33
		.text
		.globl main
		
main:		
		addiu	$sp, $sp, -8
		sw	$ra, 0($sp)
		sw	$ra, 4($sp)

do:		
		li	$v0, read_int
		syscall	
		move	$s0, $v0
		move	$a0, $s0
		li	$a1, 2
		la	$a2, str
		jal	itoa
		move	$a0, $v0
		li	$v0, print_string
		syscall
		
		move	$a0, $s0
		li	$a1, 8
		la	$a2, str
		jal	itoa
		move	$a0, $v0
		li	$v0, print_string
		syscall
		

		move	$a0, $s0
		li	$a1, 16
		la	$a2, str
		jal	itoa
		move	$a0, $v0
		li	$v0, print_string
		syscall
		
while:		bnez	$s0, do
		li	$v0, 0
		lw	$ra, 0($sp)
		lw	$sp, -4($sp)
		addiu	$sp, $sp, 8	

		




################## itoa ######################


itoa:		addiu	$sp, $sp, -16
		sw	$ra, 0($sp)
		sw	$s0, 4($sp)
		sw	$s1, 8($sp)
		sw	$s2, 12($sp)
		sw	$s3, 16($sp)
		move	$s0, $a0
		move	$s1, $a1
		move	$s2, $a2
		move	$s3, $a2
		
do1:		blt	$s0, '0', endw1		
		rem	$t0, $s0,$s1
		div	$s0, $s1
		mflo	$s0
		move	$a0, $t0
		jal	toascii
		sb	$v0, 0($s3)
		addi	$s3, $s3, 1
		j	do1
endw1:
		sb	$0, 0($s3)
		move	$a0,$s2
		jal	strrev
		move	$v0,$s2
		lw	$ra, 0($sp)
		lw	$s0, -4($sp)
		lw	$s1, -8($sp)
		lw	$s2, -12($sp)
		lw	$s3, -16($sp)
		addiu	$sp, $sp, 16
		jr	$ra
		
		
###################### toascii ########################		
		
		
toascii:	
		addi	$v0, $a0, '0'
if1:		blt	$v0, '9', endif1
		addi	$v0, $v0, 7
		
endif1:		jr	$ra


###################### strrev ###########################


strrev:		addiu	$sp, $sp, -16
		sw	$ra, 0($sp)
		sw	$s0, 4($sp)
		sw	$s1, 8($sp)
		sw	$s2, 12($sp)
		move	$s0, $a0
		move	$s1, $a0
		move	$s2, $a0
		
while1:		lb 	$t1, 0($s2)
		beq	$t1, '\0', endws
		addiu	$s2, $s2, 1
		j	while1
		
endws:		addiu	$s2, $s2, -1

while2:		bge	$t2, $t1, endw2
		move	$a0, $s1
		move	$a1, $s2
		jal	exchange
		addiu	$s1, $s1, 1
		addiu	$s2, $s2, -1
		j	while2
		
endw2:		move	$v0, $s0
		lw	$ra, 0($sp)
		lw	$s0, 4($sp)
		lw	$s1, 8($sp)
		lw	$s2, 12($sp)
		addiu	$sp, $sp, 16
		
exchange:	lb	$t0, 0($a0)
		lb	$t1, 0($a1)
		sb	$t0, 0($a1)
		sb	$t1, 0($a0)
		jr	$ra 






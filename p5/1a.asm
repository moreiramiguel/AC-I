	.data
str:	.asciiz "\nIntroduza um numero: "
	.align 2
lista:	.space 20
	.eqv print_str, 4
	.eqv read_int, 5
	.text
	.globl main
	
main:	
	li	$t0, 0			# i=0
while:	
	bge	$t0, 5, endw		# while i < 5
	
	li	$v0, print_str		# print string: Introduza um numero
	la	$a0, str
	syscall
	
	li	$v0, read_int		# read_int
	syscall
	
	la	$t1, lista		# int *p = &(lista[0])
	sll	$t2, $t0, 2		# int offset = i * 4
	addu	$t1, $t1, $t2		#p = &(lista[i])
	
	sw	$v0, 0($t1)		# lista[i] = tmp;
	
	addi	$t0, $t0, 1		# i++
	j	while
endw:	

	jr	$ra
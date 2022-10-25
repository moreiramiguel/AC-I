	.data
str1:	.asciiz "\nConteudo do array: \n"
str2:	.asciiz "; "
	.align 2
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
	.eqv print_str, 4
	.eqv print_int10, 1
	.eqv SIZE, 10
	.text
	.globl main
	
main:
	li	$v0, print_str
	la	$a0, str1
	syscall
	
	la	$t0, lista
	li	$t2, SIZE
	sll	$t2, $t2, 2
	addu	$t2, $t0, $t2
	
while:	
	bgeu	$t0, $t2, endw
	lw	$t1, 0($t0)
	or	$a0, $0, $t1
	li	$v0, print_int10
	syscall
	
	li	$v0, print_str
	la	$a0, str2
	syscall
	addiu	$t0, $t0, 4
	j	while
endw:
	jr	$ra
	
	
	
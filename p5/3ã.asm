# $t0 = k
# $t1 = temp_lista
# $t2 = temp_lista[k]
# $t4 = houve_troca
# $t5 = i
# $t6 = lista
# $t7 = lista + i

	.data
str1:	.asciiz "\nIntrouduza um numero: "
str2:	.asciiz "\nConteudo do array: "
	.align 2
lista:	.space 40
	.eqv FALSE, 0
	.eqv TRUE, 1
	.eqv SIZE, 10
	.eqv print_int10, 1
	.eqv print_str, 4
	.text
	.globl main
	
main:	
	li	$t0, 0
	
read:
	bge	$t0, 5, readend		# while i < 5
	
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
	j	read

readend:
	la	$t6, lista
	
do:	
	li	$t4, FALSE
	li	$t5, 0
for:	bge 	$t5, SIZE, end
if:	sll	$t7, $t7, 2
	addu	$t7, $t7,
	lw	$t8, 0($t6)
	lw	$t9, 4($t6)
	bge	$t8, $t9, endif
	sw	$t8, 4($t6)
	sw	$t9, 0($t6)
	li	$t4, TRUE
	
endif:	addi	$t5, $t5, 1
	
	
	
	
	
	
	jr	$ra

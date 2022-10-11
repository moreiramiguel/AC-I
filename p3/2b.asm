	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nO valor em binario e': "
	.eqv	print_string, 4
	.eqv	read_int, 5
	.eqv	print_char, 11
	.text
	.globl main

# $t0 - value
# $t1 - bit
# $t2 - i	
# $t3 - resto
			
main:	
	li	$t2, 0				#i = 0

	li	$v0, print_string		
	la	$a0, str1
	syscall					#print string valor?
	
	li	$v0, read_int
	syscall
	move	$t0, $v0			#ler o valor
	
	li	$v0, print_string
	la	$a0, str2			#valor em binario
	syscall
	
for:	bge	$t2, 32, endfor
	andi	$t1, $t0, 0x80000000
	rem	$t3, $t2, 4
	beq 	$t3, $0, resto
	
if:	beq	$t1, 0, else
	li	$a0, '1'
	li	$v0, print_char
	syscall

else:	li	$v0, print_char
	li	$a0, '0'
	syscall
	sll	$t0, $t0, 1
	addi	$t2, $t2, 1
	j	for
	
resto:	li	$v0, print_char
	li	$a0 ' '
	syscall
	j	if


endfor:
	jr	$ra
	
	
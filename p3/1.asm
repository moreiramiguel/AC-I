	.data
str1:	.asciiz "Introduza um numero:"
str2:	.asciiz "Valor ignorado \n"
str3:	.asciiz "A soma dos positivos e': "
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	.text
	.globl main
	
# $t0 -> soma
# $t1 -> value
# #t2 -> i

main:	
	li	$t2, 0
	li	$t0, 0
for:
	bge	$t2, 5, endfor
	la	$a0, str1
	li	$v0, print_string
	syscall
	
	li	$v0, read_int
	syscall
	move	$t1, $v0
	
if:	blez	$t1, else
	add	$t0, $t1, $t0
	j	endif

else:	la	$a0, str2
	li	$v0, print_string
	syscall
	
endif:	addi	$t2, $t2, 1 
	j	for
		
endfor:
	la	$a0, str3
	li	$v0, print_string
	syscall
	
	li	$v0, print_int10
	move	$a0, $t0
	syscall
	jr	$ra



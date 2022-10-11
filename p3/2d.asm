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
# $t4 - flag
			
main:	
	li	$t2, 0				#i = 0
	li	$t4, 0
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
	#andi	$t1, $t0, 0x80000000
	srl	$t1, $t0, 31	
	beq	$t1, 0, then
	bne	$t1, 1, then	
	
	
	
	rem	$t3, $t2, 4




endfor:
	jr	$ra
	
	

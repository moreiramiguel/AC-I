	.data
x1:	.double 5.0
x2:	.double 9.0
x3:	.double 32.0
str1:	.asciiz "Fahrenheit: \n"
str2:	.asciiz "Celsius: \n"
	.text
	.globl main
	
main:
						# int main(void) {
	addiu	$sp, $sp, -4			# // guardar espaço no stack
	sw	$ra, 0($sp)
	
	la	$a0, str1
	li	$v0, 4
	syscall					# print_string "Fahrenheit: \n";
	
	li	$v0, 7
	syscall					# read_double();
	mov.d	$f12, $f0			# $f12 = read_double
	jal	f2c				# double f2c(double ft)
	
	la	$a0, str2
	li	$v0, 4
	syscall					# print_string "Celsius: \n"
	
	mov.d	$f0, $f12
	li	$v0, 3				
	syscall					# print_double()
			

	lw	$ra, 0($sp)			#
	addiu	$sp, $sp, 4			#
	li	$v0, 0				# return 0;
	jr	$ra

f2c:	
	l.d	$f2, x1
	l.d	$f4, x2
	l.d	$f6, x3
	sub.d	$f12, $f12, $f6
	div.d	$f2, $f2, $f4
	mul.s	$f0, $f2, $f12
	jr	$ra
	

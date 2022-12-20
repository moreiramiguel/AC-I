# val -> $t0
# res -> $f0	
	
	.data
x1:	.float 2.59375
x2:	.float 0.0
str:	.asciiz "\n"
	.eqv print_float, 2
	.eqv read_int, 5
	.text
	.globl main
	
main:						# int main(void) {
						# do {
do:	li	$v0, read_int
	syscall
	move	$t0, $v0			# val = read_int();
	
	mtc1	$t0, $f2
	cvt.s.w	$f2, $f2			# // $f2 = (float)val;
	l.s	$f4, x1				# // $f2 = 2.59375;
	mul.s	$f0, $f2, $f4			# res = (float)val * 2.59375;
	
	li	$v0, print_float
	mov.s	$f12, $f0			
	syscall					# print_float(res);
	
	la	$a0, str			
	li	$v0, 4
	syscall					# print_string('\n')
	
	l.s	$f2, x2				# // $f2 = 0.0;
	c.eq.s	$f2, $f0
	bc1f	do				# while( res != 0.0);   Primeiro compara o valor de $f2(0.0) 
						# com o valor de $f0(res), depois faz um salto relativo ao registo
	
	li	$v0, 0				# return 0;
	jr	$ra
	
	
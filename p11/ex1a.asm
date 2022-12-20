	.eqv id_number, 0
	.eqv first_name, 4
	.eqv last_name, 22
	.eqv grade, 40
	.data
	.align 2
stg:	.word 72343
	.asciiz "Napoleao"
	.space 9
	.asciiz "Bonaparte"
	.space 5
	.float 5.1
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz "\nNome: "
str3:	.asciiz "\nNota: "
	.text
	.globl main
	
main:

	la	$t0, stg		# int main(void) {
	li	$v0, 4			# // $t0 = $stg
	la	$a0, str1		
	syscall				# print_string(str1)
	li	$v0, 1
	lw	$a0, id_number($t0)
	syscall				#print_int10(stg.id_number)
	
	li	$v0, 4
	la	$a0, str2
	syscall				#print_string(str2)
	li	$v0, 4
	addiu	$a0, $t0, 22
	syscall				#print_string(stg.last_Name)
	li	$v0, 11
	li	$a0, ','
	syscall				#print_char(',')
	li	$v0, 4
	addiu	$a0, $t0, 4
	syscall				#print_string(stg.first_name)
	
	li	$v0, 4
	la	$a0, str3
	syscall				#pritn_string(str3)
	li	$v0, 2
	l.s	$f12, grade($t0)
	syscall				#print_float(stg.grade)
	li	$v0, 0
	jr	$ra
	
	
	
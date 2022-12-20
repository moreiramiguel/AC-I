#		Align	Size	Offset
# id_number	  4	  4       0
# first_name	  1	  18      4
# last_name	  1	  15	  22
# grade	   	  4       4	  40
# student		  4       44

		.data
ps1:		.asciiz "N. Mec: "
ps2:		.asciiz "Primeiro Nome: "
ps3:		.asciiz "Ultimo Nome: "
ps4:		.asciiz "Nota: "


		.text
		.globl main
		
main:
	jr	$ra
	
	
####################################################
# st -> $t0
# ns -> $t1
# i -> $t2


read_data:
						# void read_data(student *st, int ns)
	move	$t0, $a0			#    // $t0 = $a0
	move	$t1, $a1			#    // $t1 = $a1
	li	$t2, 0				# i = 0;
	
rd_whl:	
	bge	$t2, $t1, rd_ewhl		# while (i < ns)
	mul	$t3, $t2, 44			# // $t3 = i * 44;
	addu	$t3, $t3, $t0			# $t3 = &(st[i]);
	li	$v0, 4
	la	$a0, ps1
	syscall					# print_string(ps1)
	li	$v0, 5
	syscall
	sw	$v0, 0($t3)			# st[i].id_number = read_int();
	li	$v0, 4
	la	$a0, ps2
	syscall					# print_string(ps2)
	addiu	$a0, $t3, 4			# // $a0 = &(st[i].first_name)
	li	$a1, 17
	li	$v0, 8				
	syscall					# read_string(st[i].first_name)
	li	$v0, 4
	la	$a0, ps3
	syscall					# print_string(ps3)	
	addiu	$a0, $t3, 22			# // $a0 = &(st[i].last_name)
	li	$a1, 14
	li	$v0, 8
	syscall					# read_string(st[i].last_name	
	li	$v0, 4
	la	$a0, ps4
	syscall					# print_string(ps4)
	li	$v0, 6
	syscall
	s.s	$f0, 40($t3)			# st[i].grade = read_float()				
	addi	$t2, $t2, 1			# i++;
	j	rd_whl				#  )
	
rd_ewhl:
	jr	$ra
	.data
	.text
	.globl main
	
main:	ori $v0 $0, 5 		# read_int = $v0
	syscall
	or  $t0, $0, $v0	# $v0 = $t0
	
	ori $t2, $0, 8		# $t2 = 8
	add $t1, $t0, $t0	# $t1 = 2x = x + x
	sub $t1, $t1, $t2	# $t1 = 2x - 8
	
	or  $a0, $0, $t1	# $a0 = $t1

	ori $v0, $0, 34		#print_int10
	syscall
	
	jr  $ra			# $t1 = 14
	

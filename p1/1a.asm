	.data
	.text
	.globl main
	
main:
	ori $t0, $0, 3		# $t0 = x = 3
	ori $t2, $0, 8		# $t2 = 8
	add $t1, $t0, $t0	# $t1 = 2x = 3 + 3
	add $t1, $t1, $t2	# $t1 = 2x + 8
	jr  $ra			# $t1 = 14
	
	#1st try x = 3
	#should = 14
	#outcome = 14
	#2nd try x = 2
	#should = 12
	#outcome = 12
	#3rd try x = 0
	#should = 8
	#outcome = 8
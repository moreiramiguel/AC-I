	.data
	.text
	.globl main
	
main:
	ori $t0, $0, 3		# $t0 = x = 5
	ori $t2, $0, 8		# $t2 = 8
	add $t1, $t0, $t0	# $t1 = 2x = 3 + 3
	sub $t1, $t1, $t2	# $t1 = 2x - 8
	jr  $ra			# $t1 = 14
	
	#1st try x = 5
	#should = 2
	#outcome = 2
	#2nd try x = 4
	#should = 0
	#outcome = 0
	#3rd try x = 8
	#should = 8
	#outcome = 8
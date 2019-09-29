    .globl dot_prod
dot_prod:
	# rdi - A
	# rsi - B
	# edx - n
	# ecx - i
	# r8d - j
	# C_ij = A_ik * B_jk
	xorl %eax, %eax
	push %ebp
	movl %esp, %ebp
	push %r12
	push %r13
	push %r14
	movl $0, %14

	jmp loop			# write your code for Question 3 here

loop:
	cmp %r14, edx
	jg endl
	mov



endl:
	ret


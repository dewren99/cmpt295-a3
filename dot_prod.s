    .globl dot_prod
dot_prod:
	# C_ij = A_ik * B_jk

	pushq   %rbp
	movq    %rsp, %rbp # prologue

	movq    %rdi, -24(%rbp) # rdi - A
	movq    %rsi, -32(%rbp) # rsi - B
	movl    %edx, -36(%rbp) # edx - n
	movl    %ecx, -40(%rbp) # ecx - i
	movl    %r8d, -44(%rbp) # r8d - j
	movl    $0, -4(%rbp) # temp return value C_ij
	movl    $0, -8(%rbp) # loop iterator k
	jmp     endl
	
loop:
	
	movl    -40(%rbp), %eax # eax = i
	leal    0(,%rax,4), %edx # k = i*4
	movl    -8(%rbp), %eax
	addl    %edx, %eax # k = k+i*4
	movl   	%eax, %edx # edx = k
	movq    -24(%rbp), %rax # rax = A
	addq    %rdx, %rax # A += (k+i*4)
	mov  	(%rax), %eax
	mov		%eax, %edx
	movl    -44(%rbp), %eax # eax = j
	movl  	%eax, %ecx
	movq    -32(%rbp), %rax # rax = B
	addq    %rcx, %rax # B += j
	mov	    (%rax), %eax
	# movsbl  %al, %eax
	imull   %edx, %eax # A[k+i*4] * B[j] =  A_ik * B_jk
	addl    %eax, -4(%rbp) # temp return value += A_ik * B_jk
	addl    $4, -44(%rbp) # adding +4 to jump to next row on B
	addl    $1, -8(%rbp) # k++

endl:
	movl    -8(%rbp), %eax
	cmpl    -36(%rbp), %eax
	jl      loop
	movb   -4(%rbp), %al # put temp return value C_ij inside eax
	
	mov 	%rsp, %rbp # epilogue
	popq    %rbp
	ret
# movslq S, R is the equivalent of R = SignExtend(S) where R is 64 bits and S is 32 bits.
# movzbl %al, %edx copy low-byte from register %eax, zero-extend to 4 byte long in %edx
# movsbl %al, %edx copy low-byte from register %eax, sign-extend to 4 byte long in %edx
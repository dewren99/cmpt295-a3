	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	dot_prod_
	.type	dot_prod_, @function
dot_prod_:
.LFB41:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L4
	leal	-1(%rdx), %r9d
	sall	$2, %ecx
	movslq	%r8d, %r8
	movslq	%ecx, %rcx
	xorl	%edx, %edx
	xorl	%eax, %eax
	addq	$1, %r9
	addq	%rcx, %rdi
	addq	%r8, %rsi
	.p2align 4,,10
	.p2align 3
.L3:
	movsbl	(%rdi,%rdx), %ecx
	movsbl	(%rsi,%rdx,4), %r8d
	addq	$1, %rdx
	imull	%r8d, %ecx
	addl	%ecx, %eax
	cmpq	%rdx, %r9
	jne	.L3
	rep ret
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE41:
	.size	dot_prod_, .-dot_prod_
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%4d"
	.text
	.p2align 4,,15
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB43:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%esi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.LC0(%rip), %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r12
	movl	$4, %r14d
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.L8:
	leaq	4(%r12), %rbp
	movq	%r12, %rbx
.L9:
	movsbl	(%rbx), %edx
	xorl	%eax, %eax
	movq	%r13, %rsi
	movl	$1, %edi
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpq	%rbp, %rbx
	jne	.L9
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	addq	%r15, %r12
	call	_IO_putc@PLT
	subl	$1, %r14d
	jne	.L8
	movq	stdout(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	movl	$10, %edi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_IO_putc@PLT
	.cfi_endproc
.LFE43:
	.size	print_matrix, .-print_matrix
	.section	.rodata.str1.1
.LC1:
	.string	"Not equal at i=%d, j=%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB42:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	A(%rip), %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.L14:
	leaq	B(%rip), %r15
	xorl	%r14d, %r14d
.L17:
	leaq	B(%rip), %rsi
	leaq	A(%rip), %rdi
	movl	$4, %edx
	movl	%r14d, %r8d
	movl	%ebp, %ecx
	movl	%r14d, %r12d
	call	dot_prod@PLT
	leaq	C(%rip), %rsi
	leaq	(%rsi,%r14), %rdx
	xorl	%esi, %esi
	movb	%al, (%rdx,%rbx)
	xorl	%edx, %edx
.L15:
	movsbl	(%r15,%rdx,4), %ecx
	movsbl	0(%r13,%rdx), %edi
	addq	$1, %rdx
	imull	%edi, %ecx
	addl	%ecx, %esi
	cmpq	$4, %rdx
	jne	.L15
	leaq	res(%rip), %rdi
	cmpb	%sil, %al
	leaq	(%rdi,%r14), %rdx
	movb	%sil, (%rdx,%rbx)
	je	.L16
	leaq	.LC1(%rip), %rsi
	movl	%r12d, %ecx
	movl	%ebp, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L16:
	addq	$1, %r14
	addq	$1, %r15
	cmpq	$4, %r14
	jne	.L17
	addl	$1, %ebp
	addq	$4, %rbx
	addq	$4, %r13
	cmpl	$4, %ebp
	jne	.L14
	leaq	A(%rip), %rdi
	movl	$4, %esi
	call	print_matrix
	leaq	B(%rip), %rdi
	movl	$4, %esi
	call	print_matrix
	leaq	C(%rip), %rdi
	movl	$4, %esi
	call	print_matrix
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	leaq	res(%rip), %rdi
	movl	$4, %esi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	print_matrix
	.cfi_endproc
.LFE42:
	.size	main, .-main
	.comm	rand1,16,16
	.comm	res,16,16
	.comm	C,16,16
	.globl	B
	.data
	.align 16
	.type	B, @object
	.size	B, 16
B:
	.byte	2
	.byte	-1
	.byte	2
	.byte	-2
	.byte	2
	.byte	-5
	.byte	-4
	.byte	2
	.byte	-1
	.byte	-1
	.byte	5
	.byte	0
	.byte	-1
	.byte	2
	.byte	-2
	.byte	-1
	.globl	A
	.align 16
	.type	A, @object
	.size	A, 16
A:
	.byte	3
	.byte	0
	.byte	1
	.byte	4
	.byte	-5
	.byte	1
	.byte	-1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	-2
	.byte	0
	.byte	7
	.byte	3
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits

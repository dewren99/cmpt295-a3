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
	.string	"Not equal at i=%d, j=%d\n"
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
	leaq	A(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r14, %r15
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	$0, 8(%rsp)
.L14:
	movq	8(%rsp), %rax
	leaq	D(%rip), %rbp
	leaq	B(%rip), %rbx
	xorl	%r12d, %r12d
	leaq	0(,%rax,4), %r14
	movl	%eax, %r13d
.L19:
	leaq	B(%rip), %rsi
	leaq	A(%rip), %rdi
	movl	%r13d, %ecx
	movl	%r12d, %r8d
	movl	$4, %edx
	call	dot_prod@PLT
	leaq	C(%rip), %rdi
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movb	%al, (%rdi,%r14)
.L15:
	movsbl	(%rbx,%rcx,4), %eax
	movsbl	(%r15,%rcx), %edx
	addq	$1, %rcx
	imull	%edx, %eax
	addl	%eax, %esi
	cmpq	$4, %rcx
	jne	.L15
	leaq	res(%rip), %rax
	leaq	A(%rip), %rdi
	movl	%r12d, %r8d
	movl	%r13d, %ecx
	movl	$4, %edx
	movb	%sil, (%rax,%r14)
	leaq	D(%rip), %rsi
	call	dot_prod@PLT
	leaq	res1(%rip), %rdi
	xorl	%esi, %esi
	movb	%al, (%rdi,%r14)
	xorl	%edi, %edi
.L16:
	movsbl	0(%rbp,%rsi,4), %edx
	movsbl	(%r15,%rsi), %ecx
	addq	$1, %rsi
	imull	%ecx, %edx
	addl	%edx, %edi
	cmpq	$4, %rsi
	jne	.L16
	leaq	res2(%rip), %rcx
	leaq	res(%rip), %rsi
	movl	%edi, %edx
	movb	%dil, (%rcx,%r14)
	leaq	C(%rip), %rdi
	movzbl	(%rsi,%r14), %esi
	cmpb	%sil, (%rdi,%r14)
	je	.L17
	leaq	.LC1(%rip), %rsi
	movl	%r12d, %ecx
	movl	%r13d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	res1(%rip), %rax
	leaq	res2(%rip), %rcx
	movzbl	(%rax,%r14), %eax
	movzbl	(%rcx,%r14), %edx
.L17:
	cmpb	%dl, %al
	je	.L18
	leaq	.LC1(%rip), %rsi
	movl	%r12d, %ecx
	movl	%r13d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L18:
	addl	$1, %r12d
	addq	$1, %rbp
	addq	$1, %rbx
	addq	$1, %r14
	cmpl	$4, %r12d
	jne	.L19
	addq	$1, 8(%rsp)
	addq	$4, %r15
	movq	8(%rsp), %rax
	cmpq	$4, %rax
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
	leaq	res(%rip), %rdi
	movl	$4, %esi
	call	print_matrix
	leaq	res1(%rip), %rdi
	movl	$4, %esi
	call	print_matrix
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	leaq	res2(%rip), %rdi
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
	.globl	D
	.data
	.align 16
	.type	D, @object
	.size	D, 16
D:
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.comm	res2,16,16
	.comm	res1,16,16
	.comm	res,16,16
	.comm	C,16,16
	.globl	B
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

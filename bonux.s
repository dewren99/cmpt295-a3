	.file	"bonux.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" of"
.LC1:
	.string	" %2X"
.LC2:
	.string	"Well done!"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	B(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	$12, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xorl	%ebp, %ebp
.L2:
	xorl	%ebx, %ebx
.L5:
	leaq	A(%rip), %rdi
	movl	%ebx, %r8d
	movl	%ebp, %ecx
	movl	$4, %edx
	movq	%r13, %rsi
	call	dot_prod@PLT
#APP
# 30 "bonux.c" 1
	movl %edx, %ecx
	
# 0 "" 2
#NO_APP
	testl	%ecx, %ecx
	je	.L3
	leal	-1(%r12), %r14d
	leaq	.LC0(%rip), %rsi
	movl	%r12d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	movl	%r14d, %r12d
	call	__printf_chk@PLT
.L4:
	addl	$1, %ebx
	cmpl	$4, %ebx
	jne	.L5
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	addl	$1, %ebp
	call	_IO_putc@PLT
	cmpl	$4, %ebp
	jne	.L2
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	testl	%r12d, %r12d
	je	.L11
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_restore_state
	leaq	.LC1(%rip), %rsi
	movzbl	%al, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L4
.L11:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	leaq	.LC2(%rip), %rdi
	jmp	puts@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.comm	C,16,16
	.globl	B
	.data
	.align 16
	.type	B, @object
	.size	B, 16
B:
	.byte	27
	.byte	54
	.byte	-89
	.byte	-18
	.byte	12
	.byte	36
	.byte	-100
	.byte	25
	.byte	-23
	.byte	28
	.byte	57
	.byte	46
	.byte	-6
	.byte	-14
	.byte	107
	.byte	7
	.globl	A
	.align 16
	.type	A, @object
	.size	A, 16
A:
	.byte	32
	.byte	-15
	.byte	38
	.byte	-26
	.byte	-52
	.byte	112
	.byte	-27
	.byte	38
	.byte	52
	.byte	-33
	.byte	64
	.byte	-22
	.byte	-22
	.byte	62
	.byte	-44
	.byte	13
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits

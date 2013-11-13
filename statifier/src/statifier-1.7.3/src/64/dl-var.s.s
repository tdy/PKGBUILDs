	.file	"dl-var.c"
	.text
	.p2align 4,,15
	.globl	do_work
	.type	do_work, @function
do_work:
.LFB5:
	.cfi_startproc
	movq	(%rsi), %r8
	leaq	8(%rsi), %r9
	leaq	8(%r9,%r8,8), %rdx
	cmpq	$0, (%rdx)
	movq	%rdx, %rax
	je	.L2
	.p2align 4,,10
	.p2align 3
.L3:
	addq	$8, %rax
	cmpq	$0, (%rax)
	jne	.L3
.L2:
	movq	56(%rdi), %r10
	leaq	8(%rax), %rcx
	testq	%r10, %r10
	je	.L4
	movq	%rsi, (%r10)
	movq	(%rsi), %r8
.L4:
	movq	8(%rdi), %rsi
	movq	%r8, (%rsi)
	movq	16(%rdi), %rsi
	movq	%r9, (%rsi)
	movq	24(%rdi), %rsi
	movq	%rdx, (%rsi)
	movq	32(%rdi), %rdx
	movq	%rcx, (%rdx)
	movq	8(%rax), %rdx
	xorl	%eax, %eax
	testq	%rdx, %rdx
	je	.L1
	.p2align 4,,10
	.p2align 3
.L24:
	cmpq	$7, %rdx
	je	.L7
	cmpq	$15, %rdx
	jne	.L6
	movq	40(%rdi), %rsi
	movq	8(%rcx), %rdx
	testq	%rsi, %rsi
	je	.L9
	movq	%rdx, (%rsi)
.L9:
	movq	48(%rdi), %rsi
	testq	%rsi, %rsi
	je	.L6
	cmpb	$0, (%rdx)
	je	.L10
	subq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L11:
	addq	$1, %rax
	cmpb	$0, (%rdx,%rax)
	jne	.L11
.L10:
	movq	%rax, (%rsi)
.L6:
	addq	$16, %rcx
	movq	(%rcx), %rdx
	testq	%rdx, %rdx
	jne	.L24
.L1:
	rep ret
	.p2align 4,,10
	.p2align 3
.L7:
	movq	(%rdi), %rdx
	movq	%rdx, 8(%rcx)
	jmp	.L6
	.cfi_endproc
.LFE5:
	.size	do_work, .-do_work
	.ident	"GCC: (GNU) 4.8.1"
	.section	.note.GNU-stack,"",@progbits

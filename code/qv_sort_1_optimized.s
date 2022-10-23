	.file	"qv_sort.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
.LC1:
	.string	"    result: "
.LC2:
	.string	"read array: "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	push	r15
	push	r14
	mov	r14, rsi
	push	r13
	push	r12
	lea	r12d, -2[rdi]
	push	rbp
	push	rbx
	mov	ebx, edi
	sub	rsp, 24
	mov	DWORD PTR 12[rsp], edi
	movsx	rdi, r12d
	sal	rdi, 2
	call	malloc@PLT
	mov	rbp, rax
	test	r12d, r12d
	jle	.L2
	lea	r13d, -3[rbx]
	xor	ebx, ebx
	.p2align 4,,10
	.p2align 3
.L3:
	mov	rdi, QWORD PTR 16[r14+rbx*8]
	mov	edx, 10
	xor	esi, esi
	call	strtol@PLT
	mov	DWORD PTR 0[rbp+rbx*4], eax
	mov	rax, rbx
	add	rbx, 1
	cmp	rax, r13
	jne	.L3
	lea	rsi, .LC2[rip]
	xor	eax, eax
	mov	rbx, rbp
	mov	r15, rbp
	mov	edi, 1
	lea	r14, 4[rbp+r13*4]
	lea	r13, .LC0[rip]
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L5:
	mov	edx, DWORD PTR [r15]
	mov	rsi, r13
	mov	edi, 1
	xor	eax, eax
	add	r15, 4
	call	__printf_chk@PLT
	cmp	r15, r14
	jne	.L5
	mov	edi, 10
	call	putchar@PLT
	mov	eax, DWORD PTR 12[rsp]
	xor	edi, edi
	sub	eax, 4
	lea	rsi, 4[rbp+rax*4]
	.p2align 4,,10
	.p2align 3
.L12:
	mov	rax, rbp
	cmp	r12d, 1
	je	.L10
	.p2align 4,,10
	.p2align 3
.L8:
	mov	edx, DWORD PTR [rax]
	mov	ecx, DWORD PTR 4[rax]
	cmp	edx, ecx
	jle	.L7
	mov	DWORD PTR [rax], ecx
	mov	DWORD PTR 4[rax], edx
.L7:
	add	rax, 4
	cmp	rax, rsi
	jne	.L8
.L10:
	add	edi, 1
	cmp	r12d, edi
	jne	.L12
	lea	rsi, .LC1[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L11:
	mov	edx, DWORD PTR [rbx]
	mov	rsi, r13
	mov	edi, 1
	xor	eax, eax
	add	rbx, 4
	call	__printf_chk@PLT
	cmp	rbx, r14
	jne	.L11
.L13:
	mov	edi, 10
	call	putchar@PLT
	mov	rdi, rbp
	call	free@PLT
	add	rsp, 24
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L2:
	lea	rsi, .LC2[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	mov	edi, 10
	call	putchar@PLT
	lea	rsi, .LC1[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	jmp	.L13
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits

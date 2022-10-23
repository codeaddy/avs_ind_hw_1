	.file	"qv_sort.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"read array: "
.LC1:
	.string	"%d "
.LC2:
	.string	"    result: "
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 72
	mov	DWORD PTR -68[rbp], edi	# сохраняем argc
	mov	QWORD PTR -80[rbp], rsi	# сохраняем argv
	mov	eax, DWORD PTR -68[rbp]
	sub	eax, 2					# argc - 2
	mov	DWORD PTR -32[rbp], eax	# n = argc - 2
	mov	eax, DWORD PTR -32[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -24[rbp], rax	# a = ...
	mov	DWORD PTR -52[rbp], 0	# i = 0
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	add	rax, 2
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -80[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -24[rbp]
	lea	rbx, [rcx+rdx]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR [rbx], eax	# a[i] = atoi(argv[i + 1])
	add	DWORD PTR -52[rbp], 1	# i++
.L2:
	mov	eax, DWORD PTR -52[rbp]
	cmp	eax, DWORD PTR -32[rbp]	# i < n ?
	jl	.L3
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -48[rbp], 0	# i = 0
	jmp	.L4
.L5:
	mov	eax, DWORD PTR -48[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -48[rbp], 1
.L4:
	mov	eax, DWORD PTR -48[rbp]
	cmp	eax, DWORD PTR -32[rbp]	# i < n ?
	jl	.L5
	mov	edi, 10
	call	putchar@PLT
	mov	DWORD PTR -44[rbp], 0	# i = 0
	jmp	.L6
.L10:
	mov	DWORD PTR -40[rbp], 0	# j = 0
	jmp	.L7
.L9:
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	add	rax, 1
	lea	rcx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rcx
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax				# a[j] <= a[j + 1] ? (та же ситуация, тут обратное условие)
	jle	.L8
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -28[rbp], eax	# temp = a[j]
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -40[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -24[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR -28[rbp]
	mov	DWORD PTR [rdx], eax
.L8:
	add	DWORD PTR -40[rbp], 1
.L7:
	mov	eax, DWORD PTR -40[rbp]
	add	eax, 1
	cmp	DWORD PTR -32[rbp], eax	# n > j + 1 ? (тут обратный порядок сравнения, видимо, так оптимизирует компилятор)
	jg	.L9
	add	DWORD PTR -44[rbp], 1
.L6:
	mov	eax, DWORD PTR -44[rbp]
	cmp	eax, DWORD PTR -32[rbp]	# i < n ?
	jl	.L10
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -36[rbp], 0
	jmp	.L11
.L12:
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -36[rbp], 1
.L11:
	mov	eax, DWORD PTR -36[rbp]
	cmp	eax, DWORD PTR -32[rbp]
	jl	.L12
	mov	edi, 10
	call	putchar@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

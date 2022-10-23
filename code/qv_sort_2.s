	.file	"qv_sort_2.c"
	.intel_syntax noprefix
	.text
	.globl	read
	.type	read, @function
read:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 56
	mov	QWORD PTR -40[rbp], rdi # параметр a - массив
	mov	DWORD PTR -44[rbp], esi	# параметр n - размер массива
	mov	QWORD PTR -56[rbp], rdx	# параметр argv - второй массив
	mov	DWORD PTR -20[rbp], 0	# i = 0
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, 2
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -20[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -40[rbp]
	lea	rbx, [rcx+rdx]
	mov	rdi, rax				# передаем argv[i + 1]
	call	atoi@PLT
	mov	DWORD PTR [rbx], eax	# a[i] = atoi(...)
	add	DWORD PTR -20[rbp], 1
.L2:
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L3						# i < n ?
	nop
	nop
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	read, .-read
	.globl	sort
	.type	sort, @function
sort:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi	# параметр a - массив
	mov	DWORD PTR -28[rbp], esi	# параметр n - размер массива
	mov	DWORD PTR -12[rbp], 0
	jmp	.L5
.L9:
	mov	DWORD PTR -8[rbp], 0
	jmp	.L6
.L8:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	add	rax, 1
	lea	rcx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rcx
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	jle	.L7
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -8[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -24[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR -4[rbp]
	mov	DWORD PTR [rdx], eax
.L7:
	add	DWORD PTR -8[rbp], 1
.L6:
	mov	eax, DWORD PTR -8[rbp]
	add	eax, 1
	cmp	DWORD PTR -28[rbp], eax
	jg	.L8
	add	DWORD PTR -12[rbp], 1
.L5:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L9
	nop
	nop
	pop	rbp
	ret
	.size	sort, .-sort
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	print
	.type	print, @function
print:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi	# параметр a - массив
	mov	DWORD PTR -28[rbp], esi	# параметр n - размер массива
	mov	DWORD PTR -4[rbp], 0
	jmp	.L11
.L12:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L11:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L12
	nop
	nop
	leave
	ret
	.size	print, .-print
	.section	.rodata
.LC1:
	.string	"read array: "
.LC2:
	.string	"    result: "
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi	# сохраняем argc
	mov	QWORD PTR -32[rbp], rsi	# сохраняем argv
	mov	eax, DWORD PTR -20[rbp]
	sub	eax, 2					# argc - 2
	mov	DWORD PTR -12[rbp], eax	# n = argc - 2
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	sal	rax, 2					# (n * 4) или же (n * sizeof(int))
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax	# a = (int*)malloc...
	mov	rdx, QWORD PTR -32[rbp]
	mov	ecx, DWORD PTR -12[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, ecx				# передаем n
	mov	rdi, rax				# передаем a (массив)
	call	read
	lea	rax, .LC1[rip]
	mov	rdi, rax				# передаем сообщение "read array: "
	mov	eax, 0
	call	printf@PLT
	mov	edx, DWORD PTR -12[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, edx				# передаем n
	mov	rdi, rax				# передаем a (массив)
	call	print
	mov	edi, 10					# передаем символ перевод строки
	call	putchar@PLT
	mov	edx, DWORD PTR -12[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, edx				# передаем n
	mov	rdi, rax				# передаем a (массив)
	call	sort
	lea	rax, .LC2[rip]
	mov	rdi, rax				# передаем сообщение "result: "
	mov	eax, 0
	call	printf@PLT
	mov	edx, DWORD PTR -12[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, edx				# передаем n
	mov	rdi, rax				# передаем a (массив)
	call	print
	mov	edi, 10					# передаем символ перевод строки
	call	putchar@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax				# освобождаем a (массив)
	call	free@PLT
	mov	eax, 0
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

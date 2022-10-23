	.file	"qv_sort.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	read
	.type	read, @function
read:
	test	esi, esi		# n > 0 ? (это условие выхода из функции, так оптимизирует компилятор)
	jle	.L6
	push	r13
	mov	r13, rdx			# в r13 лежит argv
	push	r12
	mov	r12, rdi			# в r12 лежит a (массив)
	push	rbp
	movsx	rbp, esi
	push	rbx
	xor	ebx, ebx
	sub	rsp, 8
	.p2align 4,,10
	.p2align 3
.L3:
	mov	rdi, QWORD PTR 16[r13+rbx*8]	# передаем argv[i + 2]
	mov	edx, 10							# какая-то служебная константа для функции strtol
	xor	esi, esi						# какая-то служебная константа для функции strtol
	call	strtol@PLT
	mov	DWORD PTR [r12+rbx*4], eax		# в массив сохраняем результат функции strtol
	add	rbx, 1							# i++
	cmp	rbp, rbx						# i < n?
	jne	.L3								# опять заходим в цикл, если условие выполнилось
	add	rsp, 8
	pop	rbx								# восстанавливаем регистры
	pop	rbp
	pop	r12
	pop	r13
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	ret
	.size	read, .-read
	.p2align 4
	.globl	sort
	.type	sort, @function
sort:
	test	esi, esi					# n > 0 ? (это условие выхода из функции, так оптимизирует компилятор)
	jle	.L10
	lea	eax, -2[rsi]					# в eax положили n - 2
	xor	r9d, r9d						# i = 0
	lea	r8, 4[rdi+rax*4]				# в r8 положили a[j + 1]
	.p2align 4,,10
	.p2align 3
.L12:
	mov	rax, rdi						# положили a (массив)
	cmp	esi, 1							# n == 1 ? (что-то на оптимизаторском)
	je	.L15							# если да, то выходим из внутреннего цикла
	.p2align 4,,10
	.p2align 3
.L14:
	mov	edx, DWORD PTR [rax]			# положили a[j]
	mov	ecx, DWORD PTR 4[rax]			# положили a[j + 1]
	cmp	edx, ecx						# a[j] <= a[j + 1] ? (обратное условие)
	jle	.L13
	mov	DWORD PTR [rax], ecx			# a[j] = a[j + 1]
	mov	DWORD PTR 4[rax], edx			# a[j + 1] = temp
.L13:
	add	rax, 4							# сдвигаемся на следующий элемент (альтернатива j++)
	cmp	rax, r8							# альтернатива j + 1 < n ?
	jne	.L14
.L15:
	add	r9d, 1							# i++
	cmp	esi, r9d						# i < n ?
	jne	.L12
.L10:
	ret
	.size	sort, .-sort
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
	.text
	.p2align 4
	.globl	print
	.type	print, @function
.LC1:
	.string	"read array: "
.LC2:
	.string	"    result: "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	push	r13					
	mov	r13, rsi				# сохраняем argv
	push	r12
	lea	r12d, -2[rdi]			# сохраняем argc - 2
	push	rbp
	movsx	rdi, r12d			# передаем n = argc - 2
	sal	rdi, 2					# (n * 4) или же (n * sizeof(int))
	call	malloc@PLT
	mov	rdx, r13				# передаем argv
	mov	esi, r12d				# передаем n = argc - 2
	mov	rdi, rax				# передаем a (результат работы функции malloc)
	mov	rbp, rax
	call	read
	lea	rsi, .LC1[rip]			# передаем сообщение "read array: "
	mov	edi, 1					# какая-то вспомогательная константа для оптимизированной компилятором функции printf
	xor	eax, eax
	call	__printf_chk@PLT
	mov	esi, r12d				# передаем n
	mov	rdi, rbp				# передаем a (массив)
	call	print
	mov	edi, 10					# передаем символ перевода строки
	call	putchar@PLT
	mov	esi, r12d				# передаем n
	mov	rdi, rbp				# передаем a (массив)
	call	sort
	lea	rsi, .LC2[rip]			# передаем сообщение "result: "
	mov	edi, 1					# какая-то вспомогательная константа для оптимизированной компилятором функции printf
	xor	eax, eax
	call	__printf_chk@PLT
	mov	esi, r12d				# передаем n
	mov	rdi, rbp				# передаем a (массив)
	call	print
	mov	edi, 10					# передаем символ перевода строки
	call	putchar@PLT
	mov	rdi, rbp				# передаем a (массив) для освобождения памяти
	call	free@PLT
	pop	rbp
	xor	eax, eax
	pop	r12
	pop	r13
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits

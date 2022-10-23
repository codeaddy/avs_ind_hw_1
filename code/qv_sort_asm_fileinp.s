	.file	"qv_sort.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.text
	.p2align 4
	.globl	read
	.type	read, @function
read:
	test	esi, esi		# n > 0 ? (это условие выхода из функции, так оптимизирует компилятор)
	jle	.L6
	push	r13
	lea	eax, -1[rsi]        # в eax лежит n - 1
	push	r12
	lea	r13, 4[rdi+rax*4]   # в r13 лежит a (массив)
	lea	r12, .LC0[rip]      # лежит строка форматирования
	push	rbp
	mov	rbp, rdx            # лежит адрес файла
	push	rbx
	mov	rbx, rdi            # лежит a (массив)
	sub	rsp, 8
	.p2align 4,,10
	.p2align 3
.L3:
	mov	rdx, rbx            # передаем массив
	mov	rsi, r12            # передаем строку форматирования
	mov	rdi, rbp            # передаем адрес файла
	xor	eax, eax            # eax = 0
	call	__isoc99_fscanf@PLT
	add	rbx, 4              # двигаемся к следующему элементу массива
	cmp	rbx, r13            # пришли к концу массива ?
	jne	.L3
	add	rsp, 8
	pop	rbx                 # восстанавливаем регистры
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
	.section	.rodata.str1.1
.LC1:
	.string	"%d "
	.text
	.p2align 4
	.globl	print
	.type	print, @function
print:
	test	esi, esi		# n > 0 ? (это условие выхода из функции, так оптимизирует компилятор)
	jle	.L24
	push	r13
	lea	eax, -1[rsi]		# в eax положили n - 1
	push	r12
	lea	r13, 4[rdi+rax*4]	# в r13 положили a (массив)
	lea	r12, .LC1[rip]      # в r12 положили строку форматирования
	push	rbp
	mov	rbp, rdx            # сохранили в rbp адрес файла
	push	rbx
	mov	rbx, rdi			# в rbx положили a (массив)
	sub	rsp, 8
	.p2align 4,,10
	.p2align 3
.L21:
	mov	ecx, DWORD PTR [rbx]	# передаем i-й элемент
	mov	rdx, r12				# передаем строку форматирования
	mov	esi, 1					# какая-то служебная константа для функции __printf_chk
	mov	rdi, rbp                # передалем адрес файла
	xor	eax, eax				# eax = 0
	add	rbx, 4					# переходим к следующему элементу (альтернатива i++)
	call	__fprintf_chk@PLT
	cmp	rbx, r13 				# проверяем условие выхода из цикла
	jne	.L21
	add	rsp, 8
	pop	rbx						# восстанавливаем регистры
	pop	rbp
	pop	r12
	pop	r13
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	ret
	.size	print, .-print
	.section	.rodata.str1.1
.LC2:
	.string	"r"
.LC3:
	.string	"w"
.LC4:
	.string	"read array: "
.LC5:
	.string	"    result: "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	push	r14
	push	r13
	push	r12
	push	rbp
	sub	rsp, 24
	mov	rdi, QWORD PTR 8[rsi]   # сохраняем адрес входного файла
	mov	r14, QWORD PTR 16[rsi]  # сохраняем адрес выходного файла
	lea	rsi, .LC2[rip]          # передаем строку с параметрами доступа
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax                # eax = 0
	call	fopen@PLT
	lea	rdx, 4[rsp]
	lea	rsi, .LC0[rip]          # передаем строку форматирования
	mov	rbp, rax                # сохраняем адрес открытого файла
	mov	rdi, rax                # передаем адрес файла
	xor	eax, eax                # eax = 0
	call	__isoc99_fscanf@PLT
	movsx	rdi, DWORD PTR 4[rsp]   # сохраняем n
	mov	r13, rdi
	sal	rdi, 2                  # (n * 4) или же (n * sizeof(int))
	call	malloc@PLT
	mov	rdx, rbp                # передаем адрес файла
	mov	esi, r13d               # передаем n
	mov	rdi, rax                # передаем a (массив)
	mov	r12, rax                # сохранили в r12 a (массив)
	call	read
	mov	rdi, rbp                # передаем адрес открытого файла
	call	fclose@PLT
	lea	rsi, .LC3[rip]          # передаем строку с параметрами досутпа
	mov	rdi, r14                # передаем адрес файла
	call	fopen@PLT
	mov	edx, 12                 # какая-то константа для fwrite
	mov	esi, 1                  # какая-то константа для fwrite
	lea	rdi, .LC4[rip]          # передаем строку "read array:"
	mov	rcx, rax                # передаем выходной файл
	mov	rbp, rax                # сохранили адрес выходного файла
	call	fwrite@PLT
	mov	esi, DWORD PTR 4[rsp]  
	mov	rdx, rbp                # передаем адрес выходного файла
	mov	rdi, r12                # передаем a (массив)
	call	print
	mov	rsi, rbp                # передаем адрес выходного файла
	mov	edi, 10                 # передаем код символа перевода строки
	call	fputc@PLT
	mov	esi, DWORD PTR 4[rsp]
	mov	rdi, r12
	call	sort
	mov	rcx, rbp
	mov	edx, 12
	mov	esi, 1
	lea	rdi, .LC5[rip]
	call	fwrite@PLT
	mov	esi, DWORD PTR 4[rsp]
	mov	rdx, rbp                # передаем адрес выходного файла
	mov	rdi, r12                # передаем a (массив)
	call	print
	mov	rsi, rbp                # передаем адрес выходного файла
	mov	edi, 10                 # передаем код символа перевода строки
	call	fputc@PLT
	mov	rdi, rbp                # передаем адрес выходного файла для закрытия
	call	fclose@PLT
	mov	rdi, r12                # передаем a (массив) для освобождения памяти
	call	free@PLT
	mov	rax, QWORD PTR 8[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L30
	add	rsp, 24
	xor	eax, eax
	pop	rbp                     # восстанавливаем регистры
	pop	r12
	pop	r13
	pop	r14
	ret
.L30:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits

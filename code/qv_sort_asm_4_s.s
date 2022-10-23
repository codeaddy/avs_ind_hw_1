	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
	.text
	.p2align 4
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	print
	.type	print, @function
print:
	test	esi, esi		# n > 0 ? (это условие выхода из функции, так оптимизирует компилятор)
	jle	.L24
	lea	eax, -1[rsi]		# в eax положили n - 1
	push	r12
	lea	r12, 4[rdi+rax*4]	# в r12 положили a (массив)
	push	rbp
	lea	rbp, .LC0[rip]		# в rbp положили строку форматирования
	push	rbx
	mov	rbx, rdi			# в rbx положили a (массив)
	.p2align 4,,10
	.p2align 3
.L21:
	mov	edx, DWORD PTR [rbx]	# передаем i-й элемент
	mov	rsi, rbp				# передаем строку форматирования
	mov	edi, 1					# какая-то служебная константа для функции __printf_chk
	xor	eax, eax				# eax = 0
	add	rbx, 4					# переходим к следующему элементу (альтернатива i++)
	call	__printf_chk@PLT
	cmp	rbx, r12 				# проверяем условие выхода из цикла
	jne	.L21
	pop	rbx						# восстанавливаем регистры
	pop	rbp
	pop	r12
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	ret
	.size	print, .-print
	.section	.rodata.str1.1

# Команды для компиляции, компоновки и запуска в gdb
# as --gstabs -o my_asm.o my_asm.s
# gcc my_asm.o -o my_asm
# ./my_asm
#------------------------------------------------

    .intel_syntax noprefix
    .section .rodata
msg_in:
    .string      "n = "
format_in:
    .string      "%d"
format_out:
    .string      "%d "

    .section .data
n:
    .long   0
arr:
    .space 8000


    .text               # Code
    .globl  main
    .type   main, @function

main:
    push    rbp
    mov     rbp, rsp

    # Подсказка для ввода n
    lea     rdi, msg_in[rip]
    mov     eax, 0
    call    printf@plt

    # Ввод числа n
    lea     rdi, format_in[rip]     # адрес формата числа
    lea     rsi, n[rip]             # адрес n
    mov     eax, 0                  # не действительные числа
    # todo! проверка на корректность n
    call    scanf@plt               # ввод целого

    xor     r11, r11

sort:
    # Реализация алгоритма
    xor     rax, rax                # x1
    mov     rbx, 1                  # x2
    mov     ecx, 2                  # индекс формируемого числа
    mov     edx, n[rip]             # загрузка n
    
loop_start:
    cmp     ecx, edx                # сравнение текущего номера с конечным
    ja      loop_out                # выход из цикла, если больше
    mov     r11, rax                # сохранение для операции
    add     r11, rbx                # следующее число
    mov     rax, rbx
    mov     rbx, r11
    inc     ecx
    jmp     loop_start
loop_out:
    dec     ecx                     # коррекция i

    # Вывод результата
    lea     rdi, format_out[rip]    # формат вывода
    mov     esi, ecx                # номер выводимого числа
    mov     rdx, rbx        # значение выводимого числа
    xor     eax, 0                  # вывод целых чисел
    call    printf@PLT

    mov	eax, 0
    pop	rbp
    ret

# Ввод массива
array_input:
    cmp     r11, n
    jge     sort
    lea     rdi, fomat_in[rip]
    lea     rsi, arr[rip]
    mov     eax, 0
    call    scanf@plt


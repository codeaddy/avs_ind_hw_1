## Индивидуальное домашнее задание по АВС #1
# Сизикин Владислав Олегович (БПИ218), Вариант 21

# 4 балла
В файле qv_sort_1.c находится решение задачи на C.
Сперва была выполнена компиляция без оптимизирующих и отладочных функций, добавлены комментарии, поясняющие эквивалентное представление переменных в программе на C и в ассемблерном коде.
//файл1

Далее была произведена сборка с использованием следующих команд:
//pic1
Таким образом, мы получили ассемблерный код без лишних макросов.

Приложил тестовое покрытие, проверяющее корректную и одинаковую работу программ на C и ассемблере.

# 5 баллов
Начал модификацию предыдущего файла на C, вынес некоторые части кода в отдельные функции, получил qv_sort_2.c
//файл2
Локальные переменные были использованы.
Произвел сборку, добавил комментарии, описывающие передачу фактических параметров и перенос возвращаемого результата в ассемблерный код.
В функции добавил комментарии для формальных параметров, описывающие связь регистров (или стэка, !тут выбрать!) и параметрами языка C.

# 6 баллов
Произвел оптимизацию программы ассемблера за счет максимального использования регистров процессора.
//файл3
Добавил комментарии, поясняющие альтернативное использование регистров вместо переменных исходной программы на С.
Произвел тестирование, приложил результаты
//pic

# 7 баллов
Разбил ассемблерный файл на две единицы компиляции.
//два файла
Добавил возможность задания файлов ввода/вывода с использованием аргументов командной строки.
Произвевл тестирование, приложил результаты
//pic

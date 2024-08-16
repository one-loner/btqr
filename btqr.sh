#!/bin/bash

# Проверка на наличие аргумента
if [ "$#" -ne 1 ]; then
    echo "Использование: $0 <имя_файла>"
    exit 1
fi

# Проверка на существование файла
if [ ! -f "$1" ]; then
    echo "Файл '$1' не найден!"
    exit 1
fi

# Переменная для хранения строк
chunk=""

# Счетчик строк
count=0

# Чтение файла и формирование переменной
while IFS= read -r line; do
    chunk+="$line"$'\n'  # Добавляем строку в переменную
    count=$((count + 1))
    
    # Если выведено 10 строк, выводим переменную и очищаем её
    if [ "$count" -eq 20 ]; then
        echo "$chunk"  | qrencode -t ANSIUTF8
        chunk=""  # Очищаем переменную
        count=0   # Сбрасываем счетчик
        read -p "Нажмите Enter для продолжения..."
        read aaa
    fi
done < "$1"

# Вывод оставшихся строк, если они есть
if [ "$count" -ne 0 ]; then
    echo "$chunk" | qrencode -t ANSIUTF8
fi

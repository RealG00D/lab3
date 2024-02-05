#!/bin/bash

# Створення дерева каталогів та файлів
mkdir -p StudentInfo/KI-406
echo "Ім'я: Олег" > StudentInfo/KI-406/name.txt
echo "Прізвище: Деревецький" >> StudentInfo/KI-406/name.txt
echo "Номер групи: KI-406" > StudentInfo/KI-406/info.txt
echo "Дата виконання: $(date)" >> StudentInfo/KI-406/info.txt
echo "oderevetckyi@gmail.com" > StudentInfo/KI-406/email.txt

# Копіювання файлів у кореневий каталог
cp -r StudentInfo/KI-406/name.txt .
cp -r StudentInfo/KI-406/info.txt .
cp -r StudentInfo/KI-406/email.txt .

# Перевірка електронної пошти за допомогою регулярного виразу
for file in email.txt; do
    if grep -Eq "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$" "$file"; then
        echo "Електронна пошта у файлі $file є дійсною."
    else
        echo "Увага: У файлі $file не знайдено дійсну електронну пошту!"
    fi
done

# Завантаження на GitHub
# (Закоментуйте або видаліть цей рядок, якщо ви не хочете завантажувати на GitHub)

# Виведення кількості та повідомлень про помилку 404 з файлу логів Apache
apache_logs="Apache.log"  # Назва файлу логів Apache
if [ -e "$apache_logs" ]; then
    error_404_count=$(grep -c ' 404 ' "$apache_logs")
    echo "Кількість повідомлень про помилку 404: $error_404_count"
    echo "Повідомлення про помилку 404:"
    grep ' 404 ' "$apache_logs" > ERROR.txt
else
    echo "Увага: Файл логів Apache не знайдено або шлях некоректний."
fi

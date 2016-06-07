﻿v8CfgAddsAhk
============
Набор скриптов для автоматизации ряда действий в конфигураторе.

Реализует часть функционала из Снегопат (https://snegopat.ru/)

Описание + скрины: http://itpath.ru/v8cfgaddsahk/

Установка
------------
1. Установить Autohotkey (http://www.autohotkey.com/)
	
Запуск
------------
- v8CfgAddsAhk\v8CfgAdds.ahk (Основной набор скриптов)
- v8CfgAddsAhk\continueRow.ahk (Операции по переносу комментариев, строк). Автор ADirks

Реализованные функции
------------

Работа с метаданными:
- Навигация по метаданным: {ctrl + shift +j}
- Навигация по входящим в объект типам: {ctrl + j}
- Поиск метаданных по имени: {Alt+j}

Работа с методами:
- Вызов списка методов: {ctrl +1}
- Переход в начало метода: {Ctrl+b}
- Переход в конец метода: {Ctrl+e}
- Препроцессор метода: {Alt+7}
- Переход в процедуру: {ctrl+enter}
- Возврат на предыдущую позицию: {Alt,-}

Прочие операции с текстом:
- Поиск с рег.выражениями: {Alt+f}
- Поиск с рег.выражениями (результат последнего поиска): {Alt+r}
- Выбор ранее набранных слов + Выбор заранее заготовленных слов\фраз (файл words.txt в корне директории скриптов): {ctrl+w}
- Переход по областям: {Ctrl+2}
- Закоментировать строку: {ctrl + / (ctrl + .)}
- Развернуть модуль: {ctrl+i}
- Удаление строки: {Ctrl+y}
- Авторские комментарии:
	- блок добавлен: {alt+s}
	- блок изменен: {alt+e}
	- блок удален: {alt+d}
- Cимвол '<': {Ctrl-,}
- Cимвол '>': {Ctrl-.}
- Cимвол '|': {Ctrl-\}
- Cимвол '&': {Ctrl-&}
- Cимвол '[': {Alt-[}
- Cимвол ']': {Alt-]}
- Копирование текущей строки и вставка в следующей: {ctrl+d}
- Добавление ссылки на основной реквизит в модуле (преобразование модуля формы из обычных форм в управляемые): {Alt+h}
- Генератор кода для объектов метаданных (требуется предварительная генерация файла структуры обработкой v8CfgAddsAhk\ext\ПолучениеСтруктуры.epf): {Alt+g}
- Установка/Удаление '|' для выделенного текста: {ctrl + m}

Прочие скрипты:
- Открытие внешних отчетов/обработок, файлов конфигурации: {Ctrl + 3}


Важно: Требуется настроить пути хранения внешних файлов в файле ExtFiles.js

Важно: При возникновении ошибки "Файл не найден" в строке 265, или подобной - необходимо проверить наличие папки tmp в папке скриптов. По умолчанию, в репозитарий добавлен файл пустышка решающий эту проблему.

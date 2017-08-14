﻿//////////////////////////////////////////////////////////////////////////
// Работа с командными файлами

#Использовать tempfiles

Перем мЗаписьТекста;
Перем мПуть;
Перем ЭтоWindows;

Функция Открыть(Знач Путь = "") Экспорт
	
	Если ПустаяСтрока(Путь) Тогда
		мПуть = ВременныеФайлы.НовоеИмяФайла(?(ЭтоWindows, ".bat", ".sh"));
	Иначе
		мПуть = Путь;
	КонецЕсли;
	Кодировка = ?(ЭтоWindows, "cp866", КодировкаТекста.UTF8NoBOM);
	Если ЭтоWindows Тогда
		мЗаписьТекста = Новый ЗаписьТекста(мПуть, Кодировка);
	Иначе
		мЗаписьТекста = Новый ЗаписьТекста(мПуть, Кодировка, , , Символы.ПС);
	КонецЕсли;

	Возврат мПуть;
	
КонецФункции

Процедура Добавить(Знач Команда) Экспорт
	ПроверитьЧтоФайлОткрыт();
	мЗаписьТекста.ЗаписатьСтроку(Команда);
КонецПроцедуры

Функция Исполнить() Экспорт
	
	Закрыть();
	
	ПутьПакетногоФайла = мПуть;
	Если ЭтоWindows Тогда 
		СтрокаЗапуска = "cmd.exe /C """ + ПутьПакетногоФайла + """";
	Иначе
		СтрокаЗапуска = "sh '" + ПутьПакетногоФайла + "'";
	КонецЕсли;
	
	КодВозврата = "";
	ЗапуститьПриложение(СтрокаЗапуска,, Истина, КодВозврата);
	
	Возврат КодВозврата;

КонецФункции

Функция Закрыть() Экспорт
	
	Если мЗаписьТекста <> Неопределено Тогда
		мЗаписьТекста.Закрыть();
		мЗаписьТекста = Неопределено;
	КонецЕсли;
	
	Возврат мПуть;
	
КонецФункции

Процедура ПроверитьЧтоФайлОткрыт()
	Если мЗаписьТекста = Неопределено Тогда
		Открыть();
	КонецЕсли;
КонецПроцедуры

СистемнаяИнформация = Новый СистемнаяИнформация;
ЭтоWindows = Найти(НРег(СистемнаяИнформация.ВерсияОС), "windows") > 0;

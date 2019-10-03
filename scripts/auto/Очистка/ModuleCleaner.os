﻿Перем Обмен;

Функция ОбработатьТекст(ИсходныйТекст)
	
	НовыйТекст = "";
	ПустаяСтрока = Ложь;
	
	МассивДопустимыхКомментариев = Новый Массив;
	МассивДопустимыхКомментариев.Добавить("//!");
	МассивДопустимыхКомментариев.Добавить("//#");
	МассивДопустимыхКомментариев.Добавить("//@");
	МассивДопустимыхКомментариев.Добавить("// ");
	
	Строки = СтрРазделить(ИсходныйТекст, Символы.ПС, Истина);
	
	Для каждого Стр Из Строки Цикл
		Если Лев(СокрЛП(Стр),2) = "//" Тогда
			Для Каждого ДопустимоеНачало Из МассивДопустимыхКомментариев Цикл
				Если СтрНачинаетсяС(СокрЛП(Стр), ДопустимоеНачало) = Истина Тогда
					НовыйТекст = НовыйТекст + Символы.ПС + Стр;
					ПустаяСтрока = Ложь;				
				КонецЕсли;
			КонецЦикла;
			Продолжить;
		ИначеЕсли СокрЛП(Стр) = "" Тогда
			Если ПустаяСтрока = Ложь Тогда
				НовыйТекст = НовыйТекст + Символы.ПС;
			КонецЕсли;
			ПустаяСтрока = Истина;
		Иначе
			НовыйТекст = НовыйТекст + Символы.ПС + Стр;
			ПустаяСтрока = Ложь;
		КонецЕсли;
	КонецЦикла;
	
	Возврат НовыйТекст;
	
КонецФункции

Процедура ПриСозданииОбъекта()
	
	Обмен = ЗагрузитьСценарий("core/Обмен.os");

	Параметры = АргументыКоманднойСтроки;

	Если Параметры.Количество() > 0 Тогда
		ИмяФайла = Параметры[0];
		Приемник = ИмяФайла;
		
		Если Параметры.Количество() > 1 Тогда
			Приемник = Параметры[1];
		КонецЕсли;
		
		ИсходныйТекст = Обмен.ПолучитьТекстИзФайла(ИмяФайла);
		Результат = ОбработатьТекст(ИсходныйТекст);
		Обмен.ЗаписатьРезультатВФайл(Приемник, Результат);
	Иначе
		Результат = ОбработатьТекст(Обмен.ПолучитьВыделенныйТекст());
		Обмен.УстановитьТекстВВыделение(Результат);
	КонецЕсли;
	
КонецПроцедуры
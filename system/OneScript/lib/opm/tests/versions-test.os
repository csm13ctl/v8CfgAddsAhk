﻿
#Использовать asserts

Перем юТест;

Функция ПолучитьСписокТестов(Знач Тестирование) Экспорт
	
	юТест = Тестирование;
	
	СписокТестов = Новый Массив;
	
	СписокТестов.Добавить("ТестДолжен_РазобратьНомерВерсииНаКомпоненты");
	СписокТестов.Добавить("ТестДолжен_ПолучитьПустуюСтруктуруВерсии");
	СписокТестов.Добавить("ТестДолжен_ЗаписатьВерсиюВСтроку");
	СписокТестов.Добавить("ТестДолжен_ПроверитьЧтоВерсияАБольшеВерсииБ");
	СписокТестов.Добавить("ТестДолжен_ПолучитьИмяИВерсиюПоИмениПакетаБезВерсии");
	СписокТестов.Добавить("ТестДолжен_ПолучитьИмяИВерсиюПоИмениПакетаСВерсией");
	
	Возврат СписокТестов;
	
КонецФункции

Процедура ТестДолжен_РазобратьНомерВерсииНаКомпоненты() Экспорт

	Версия = РаботаСВерсиями.РазобратьВерсиюНаКомпоненты("1.5.12.7");
	
	Ожидаем.Что(Версия.СтаршийНомер).Равно("1");
	Ожидаем.Что(Версия.МладшийНомер).Равно("5");
	Ожидаем.Что(Версия.Релиз).Равно("12");
	Ожидаем.Что(Версия.Ревизия).Равно("7");

КонецПроцедуры

Процедура ТестДолжен_ПолучитьПустуюСтруктуруВерсии() Экспорт

	Версия = РаботаСВерсиями.СоздатьВерсию();
	
	Ожидаем.Что(Версия.Свойство("СтаршийНомер")).ЭтоИстина();
	Ожидаем.Что(Версия.Свойство("МладшийНомер")).ЭтоИстина();
	Ожидаем.Что(Версия.Свойство("Релиз")).ЭтоИстина();
	Ожидаем.Что(Версия.Свойство("Ревизия")).ЭтоИстина();

КонецПроцедуры

Процедура ТестДолжен_ЗаписатьВерсиюВСтроку() Экспорт
	
	Версия = РаботаСВерсиями.РазобратьВерсиюНаКомпоненты("1.0.7");
	Ожидаем.Что(РаботаСВерсиями.ЗаписатьВерсиюВСтроку(Версия)).Равно("1.0.7");
	
	Версия = РаботаСВерсиями.РазобратьВерсиюНаКомпоненты("1.0.7.5");
	Ожидаем.Что(РаботаСВерсиями.ЗаписатьВерсиюВСтроку(Версия)).Равно("1.0.7.5");
	
	Версия = РаботаСВерсиями.РазобратьВерсиюНаКомпоненты("1.0");
	Ожидаем.Что(РаботаСВерсиями.ЗаписатьВерсиюВСтроку(Версия)).Равно("1.0");
	
	Версия = РаботаСВерсиями.РазобратьВерсиюНаКомпоненты("1");
	Ожидаем.Что(РаботаСВерсиями.ЗаписатьВерсиюВСтроку(Версия)).Равно("1.0");
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоВерсияАБольшеВерсииБ() Экспорт
	
	ВерсияА = "1.2.2.7";
	ВерсияБ = "1.1.10.4";
	
	Ожидаем.Что(РаботаСВерсиями.СравнитьВерсии(ВерсияА, ВерсияБ)).Больше(0);
	
КонецПроцедуры

Процедура ТестДолжен_ПолучитьИмяИВерсиюПоИмениПакетаБезВерсии() Экспорт
		
		Пакет = РаботаСВерсиями.РазобратьИмяПакета("opm");
		Ожидаем.Что(Пакет.ИмяПакета).Равно("opm");
		Ожидаем.Что(Пакет.Версия).Равно(Неопределено);

КонецПроцедуры

Процедура ТестДолжен_ПолучитьИмяИВерсиюПоИмениПакетаСВерсией() Экспорт
		
		Пакет = РаботаСВерсиями.РазобратьИмяПакета("opm@1.1.1");
		Ожидаем.Что(Пакет.ИмяПакета).Равно("opm");
		Ожидаем.Что(Пакет.Версия).Равно("1.1.1");

КонецПроцедуры		

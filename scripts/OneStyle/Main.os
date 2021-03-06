
#Использовать "..\..\system\OneScript\lib\ReadParams"
#Использовать "."

Перем Источник;
Перем Приемник;
Перем Настройки;

Процедура ФорматироватьСПомощью( Знач пИмяСкрипта )
	
	начало = ТекущаяУниверсальнаяДатаВМиллисекундах();

	классФорматирования = Новый(пИмяСкрипта);
	классФорматирования.Настройки = Настройки;
	классФорматирования.Форматировать( Источник, Приемник );
	
	Сообщить( пИмяСкрипта + ": " + (ТекущаяУниверсальнаяДатаВМиллисекундах() - начало) + "мс" );
	Источник = Приемник;

КонецПроцедуры

Процедура Выполнить(Параметры)

	ошибкиЧтения = Неопределено;

	Настройки = ЧтениеПараметров.Прочитать(".\configs\OneStyle.json", ошибкиЧтения);

	Для каждого цЭлемент Из ошибкиЧтения Цикл
		
		Сообщить( "Ошибка чтения файла " + цЭлемент.Ключ + ": " + цЭлемент.Значение );

	КонецЦикла;
	
	Для каждого цЭлемент Из Настройки Цикл
		
		Сообщить( "Прочитан параметр " + цЭлемент.Ключ + ": " + цЭлемент.Значение );

	КонецЦикла;

	Источник = "tmp\module.txt";
	Если Параметры.Количество() > 0 Тогда
		Источник = Параметры[0];
	КонецЕсли;
	Приемник = Источник;
	Если Параметры.Количество() > 1 Тогда
		Приемник = Параметры[1];
	КонецЕсли;

	ФорматироватьСПомощью( "OneStyle" );
	
КонецПроцедуры

Выполнить(АргументыКоманднойСтроки);




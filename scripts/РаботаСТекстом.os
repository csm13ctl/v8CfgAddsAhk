#Использовать ReadParams
#Использовать WinExt

Перем Обмен;
Перем ВыборИзСписка;

Процедура ВыбратьПрепроцессор() Экспорт
	
	Данные = Новый Соответствие;
	Данные.Вставить("&НаСервере", "&НаСервере");
	Данные.Вставить("&НаСервереБезКонтекста", "&НаСервереБезКонтекста");
	Данные.Вставить("&НаКлиенте", "&НаКлиенте");
	
	Результат = ВыборИзСписка.ВыбратьИзСписка(Данные);
	Обмен.УстановитьТекстВВыделение(Результат);
	
КонецПроцедуры

Процедура ПродолжитьСтрокуКомментарий() Экспорт

РО = Новый РаботаСОкнами();
Рез = РО.ТолькоЧтение();
Обмен.УведомитьЧерезТрей(Рез);

	// МСПослатьКлавиши = Новый МСПослатьКлавиши;
	// Буфер = Новый БуферОбмена();
	// ТекстБуфера = Буфер.Получить();
	
	// РегВыражение = Новый РегулярноеВыражение("^\s*(\||\/\/)");
	// РегВыражение.ИгнорироватьРегистр = Истина;
	
	// СтрокиМодуля = СтрРазделить(ТекстБуфера, Символы.ПС, Истина);
	// КолСтрок = СтрокиМодуля.Количество() - 1;
	// Для А = -КолСтрок по 0 Цикл
	// 	Стр = СтрокиМодуля.Получить( - А);
	// 	Если РегВыражение.Совпадает(Стр) = Истина Тогда
	// 		Если Сред(СокрЛ(Стр), 1, 1) = "|" Тогда
	// 			МСПослатьКлавиши.ПослатьКлавиши("{Enter}");
	// 			Обмен.УстановитьТекстВВыделение("|");
	// 			Возврат;
	// 		Иначе
	// 			МСПослатьКлавиши.ПослатьКлавиши("{Enter}");
	// 			Обмен.УстановитьТекстВВыделение("//");
	// 			Возврат;
	// 		КонецЕсли;
	// 	КонецЕсли;
	// КонецЦикла;
	
	// // если обычный переход
	// МСПослатьКлавиши.ПослатьКлавиши("{Enter}");
	
КонецПроцедуры

Процедура ИнкрементПлюПлюс() Экспорт
	Инкремент("++");
КонецПроцедуры

Процедура ИнкрементПлюРавно() Экспорт
	Инкремент("+=");
КонецПроцедуры

Процедура ИнкрементМинусМинус() Экспорт
	Инкремент("--");
КонецПроцедуры

Процедура ИнкрементМинусРавно() Экспорт
	Инкремент("-=");
КонецПроцедуры

Процедура Инкремент(ВидИнкремента)
	
	Буфер = Новый БуферОбмена();
	ТекстБуфера = Буфер.Получить();
	
	ДанныеМассив = СтрРазделить(СокрЛП(ТекстБуфера), " ", Ложь);
	ПоследнееСлово = ДанныеМассив[ДанныеМассив.Количество() - 1];
	
	НовыеДанные = "";
	Если ВидИнкремента = "++" Тогда
		НовыеДанные = " = " + ПоследнееСлово + " + 1;";
	ИначеЕсли ВидИнкремента = "+=" Тогда
		НовыеДанные = " = " + ПоследнееСлово + " + ;";
	ИначеЕсли ВидИнкремента = "--" Тогда
		НовыеДанные = " = " + ПоследнееСлово + " - 1;";
	ИначеЕсли ВидИнкремента = "-=" Тогда
		НовыеДанные = " = " + ПоследнееСлово + " - ;";
	КонецЕсли;
	
	Обмен.УстановитьТекстВВыделение(НовыеДанные);
	
КонецПроцедуры

Процедура ВыбратьШаблон() Экспорт
	
	ошибкиЧтения = Неопределено;
	
	файлыНастроек = Новый Массив;
	файлыНастроек.Добавить("settings/codetemplates.json");
	
	Настройки = ЧтениеПараметров.Прочитать(файлыНастроек , ошибкиЧтения);
	
	СписокШаблонов = Новый Соответствие();
	
	РВ = Новый РегулярноеВыражение("{\""(.*)\"",0,[0-9],\""(.*|\w\[.*\])\"",\""(.*)");
	РВ.ИгнорироватьРегистр = Истина;
	РВ.Многострочный = Истина;
	
	МассивФайлов = Настройки["Файлы"];
	
	Если МассивФайлов.Количество() = 0 Тогда
		Обмен.ПоказатьПредупреждение("Необходимо указать пути к шаблонам в файле: settings/codetemplates.json", "Ошибка");
		Возврат;
	КонецЕсли;
	
	Для Каждого Стр Из МассивФайлов Цикл
		Данные = Обмен.ПолучитьТекстИзФайла(Стр);
		
		Совпадения = РВ.НайтиСовпадения(Данные);
		
		Для Каждого Стр из Совпадения Цикл
			Грп = Стр.Группы;
			
			
			Ключ = Грп[1].Значение;
			Ключ = СтрЗаменить(Ключ, "[", "");
			Ключ = СтрЗаменить(Ключ, "]", "");

			Если СокрЛП(Ключ) = "" Тогда
				Продолжить;
			КонецЕсли;

			Значение = Грп[2].Значение;
			Значение = СтрЗаменить(Значение, "[", "");
			Значение = СтрЗаменить(Значение, "]", "");
			
			СписокШаблонов.Вставить(Ключ, Значение);
			
		КонецЦикла;		
		
	КонецЦикла;
	
	Результат = ВыборИзСписка.ВыбратьИзСписка(СписокШаблонов);
	
	Если СокрЛП(Результат) = "" Тогда
		Возврат;
	КонецЕсли;
	
	Обмен.УстановитьТекстВВыделение(Результат);
	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьКлавиши("^q");
	
КонецПроцедуры

Процедура ПриСозданииОбъекта()
	
	Обмен = ЗагрузитьСценарий("core/Обмен.os");
	ВыборИзСписка = ЗагрузитьСценарий("core/SelectValue.os");
	
	Параметры = АргументыКоманднойСтроки;
	Если Параметры.Количество() > 0 Тогда
		Если Параметры[0] = "ВыбратьПрепроцессор" Тогда
			ВыбратьПрепроцессор();
		ИначеЕсли Параметры[0] = "ПродолжитьСтрокуКомментарий" Тогда
			ПродолжитьСтрокуКомментарий();
		ИначеЕсли Параметры[0] = "Инкремент" Тогда
			Инкремент(Параметры[1]);
		ИначеЕсли Параметры[0] = "ВыбратьШаблон" Тогда
			ВыбратьШаблон();
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

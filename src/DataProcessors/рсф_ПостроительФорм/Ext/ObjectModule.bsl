﻿Перем Форма;
Перем ДобавляемыеРеквизиты;
Перем ТекущийЭлемент;
Перем ТекущаяКоманда;
Перем ТекущийПоток;
Перем Элементы;
Перем Команды;
Перем ПутьРеквизита;

Перем Компоненты Экспорт;

#Область Инициализация

Процедура Инициализация(_Форма) Экспорт 
	Форма = _Форма;
	ДобавляемыеРеквизиты = Новый Массив;
	ТаблицаКоманд();
	ТаблицаЭлементов();
	ПутьРеквизита = "";
	
	ИнициализацияКомпонентов();
	
КонецПроцедуры

Процедура ИнициализацияКомпонентов()

	Компоненты = Новый Структура;
	
	Префикс = ПрефиксПодсистемы();
	ИмяЭтойОбработки = Метаданные().Имя;
	
	Для Каждого ОбработкаИзКонфигурации из Метаданные.Обработки Цикл
		ИмяОбработки = ОбработкаИзКонфигурации.Имя;
		Если НЕ ИмяОбработки  = ИмяЭтойОбработки И СтрНачинаетсяС(ИмяОбработки, Префикс) Тогда
			ОбработкаОбъект = Обработки[ИмяОбработки].Создать();
			ОбработкаОбъект.Инициализация(ЭтотОбъект);
			Компоненты.Вставить(СтрЗаменить(ИмяОбработки, Префикс, ""), ОбработкаОбъект);
		КонецЕсли;
	КонецЦикла;

КонецПроцедуры

Функция ПрефиксПодсистемы()

	Возврат "рсф_"; // Работа С Формами

КонецФункции // ПрефиксПодсистемы()
	
#КонецОбласти

Функция Форма() Экспорт 	
	Возврат Форма;	
КонецФункции // Форма()


#Область Реквизиты__Р

Функция ДобавитьРеквизит(Имя, Тип) Экспорт
 
	ДобавляемыеРеквизиты.Добавить(Новый РеквизитФормы(Имя, Тип, ПутьРеквизита));	
	
	Возврат ЭтотОбъект;

КонецФункции // ДобавитьРеквизит()

Функция СоздатьРеквизиты() Экспорт

	Если ДобавляемыеРеквизиты.Количество() > 0 Тогда
		Форма.ИзменитьРеквизиты(ДобавляемыеРеквизиты);	
	КонецЕсли;
	
	ДобавляемыеРеквизиты = Новый Массив;
	
	Возврат ЭтотОбъект;

КонецФункции // СоздатьРеквизиты()

Функция РеквизитДата(Имя, ЧастьДаты = Неопределено) Экспорт 
	
	Если ЧастьДаты = Неопределено Тогда
		ЧастьДаты = ЧастиДаты.ДатаВремя;
	КонецЕсли;
	
	ТипРеквизита = Новый ОписаниеТипов("Дата",,,Новый КвалификаторыДаты(ЧастьДаты));
	
	ДобавитьРеквизит(Имя, ТипРеквизита); 
	
	Возврат ЭтотОбъект;
	
КонецФункции
	
Функция РеквизитБулево(Имя) Экспорт 
	
	ТипРеквизита = Новый ОписаниеТипов("Булево");
	
	ДобавитьРеквизит(Имя, ТипРеквизита); 
	
	Возврат ЭтотОбъект;
	
КонецФункции
	
Функция РеквизитЧисло(Имя, Размер = 15, Точность = 2) Экспорт 
	
	ТипРеквизита = Новый ОписаниеТипов("Число",Новый КвалификаторыЧисла(Размер, Точность));
	
	ДобавитьРеквизит(Имя, ТипРеквизита); 
	
	Возврат ЭтотОбъект;
	
КонецФункции
	
Функция РеквизитСтрока(Имя, Длина = Неопределено) Экспорт 
	
	Если Длина = Неопределено Тогда
		ТипРеквизита = Новый ОписаниеТипов("Строка");
	Иначе
		ТипРеквизита = Новый ОписаниеТипов("Строка",,Новый КвалификаторыСтроки(Длина));
	КонецЕсли;
	
	ДобавитьРеквизит(Имя, ТипРеквизита); 
	
	Возврат ЭтотОбъект;
	
КонецФункции

Функция РеквизитСтандартныйПериод(Имя) Экспорт 
	
	ТипРеквизита = Новый ОписаниеТипов("СтандартныйПериод");
	
	ДобавитьРеквизит(Имя, ТипРеквизита); 
	
	Возврат ЭтотОбъект;
	
КонецФункции

Функция РеквизитТаблицаЗначений(Имя) Экспорт 
	
	ТипРеквизита = Новый ОписаниеТипов("ТаблицаЗначений");
	
	ДобавитьРеквизит(Имя, ТипРеквизита); 
	
	Возврат ЭтотОбъект;
	
КонецФункции

Функция РеквизитСсылка(Имя, ТипСсылки) Экспорт 
	
	ТипРеквизита = Новый ОписаниеТипов(ТипСсылки);	
	
	ДобавитьРеквизит(Имя, ТипРеквизита); 
	
	Возврат ЭтотОбъект;
	
КонецФункции

Функция РеквизитДинамическийСписок(Имя) Экспорт 
	
	ТипРеквизита = Новый ОписаниеТипов("ДинамическийСписок");
	
	ДобавитьРеквизит(Имя, ТипРеквизита); 
	
	Возврат ЭтотОбъект;
	
КонецФункции

#КонецОбласти

#Область Команды__К

Функция Команда(Имя, Метод) Экспорт
	
	ТекущаяКоманда = ПараметрыСозданияКоманды();
	ТекущаяКоманда.Имя = Имя;
	ТекущаяКоманда.Действие = Метод;
	
	ТекущийПоток = ТекущаяКоманда;
	
	Команда = Команды.Добавить();
	Команда.Имя = Имя;
	Команда.Параметры = ТекущаяКоманда;
	
	Возврат ЭтотОбъект;

КонецФункции // Команда()

#КонецОбласти

#Область Элементы__Э

Функция ДобавитьЭлементФормы(Имя) Экспорт
	
	ТекущийЭлемент = ПараметрыСозданияЭлементов();
	ТекущийЭлемент.Имя = Имя;
	
	ТекущийПоток = ТекущийЭлемент;
	
	Элемент = Элементы.Добавить();
	Элемент.Имя = Имя;
	Элемент.Параметры = ТекущийЭлемент;
	
	Возврат ЭтотОбъект;

КонецФункции // ДобавитьЭлементФормы()

Функция ПолеВвода(Имя) Экспорт

	ДобавитьЭлементФормы(Имя);
	ТипЭлемента(Тип("ПолеФормы"));
	ВидЭлемента(ВидПоляФормы.ПолеВвода);
	
	Возврат ЭтотОбъект;

КонецФункции // ПолеВвода()

Функция ПолеФлажка(Имя) Экспорт

	ДобавитьЭлементФормы(Имя);
	ТипЭлемента(Тип("ПолеФормы"));
	ВидЭлемента(ВидПоляФормы.ПолеФлажка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ГруппаФормы(Имя) Экспорт

	ДобавитьЭлементФормы(Имя);
	ТипЭлемента(Тип("ГруппаФормы"));
	ВидЭлемента(ВидГруппыФормы.ОбычнаяГруппа);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Страницы(Имя) Экспорт

	ДобавитьЭлементФормы(Имя);
	ТипЭлемента(Тип("ГруппаФормы"));
	ВидЭлемента(ВидГруппыФормы.Страницы);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Страница(Имя) Экспорт

	ДобавитьЭлементФормы(Имя);
	ТипЭлемента(Тип("ГруппаФормы"));
	ВидЭлемента(ВидГруппыФормы.Страница);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Кнопка(Имя) Экспорт

	ДобавитьЭлементФормы(Имя);
	ТипЭлемента(Тип("КнопкаФормы"));
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ТаблицаФормы(Имя) Экспорт

	ДобавитьЭлементФормы(Имя);
	ТипЭлемента(Тип("ТаблицаФормы"));

	Возврат ЭтотОбъект;

КонецФункции

Функция КоманднаяПанель(Имя) Экспорт

	ДобавитьЭлементФормы(Имя);
	ТипЭлемента(Тип("ГруппаФормы"));
	ВидЭлемента(ВидГруппыФормы.КоманднаяПанель);
	
	Возврат ЭтотОбъект;

КонецФункции

#КонецОбласти

#Область Элементы_Свойства__С

Функция Свойство(Имя, Значение) Экспорт
	
	ПроверитьТекущийПоток();
	
	ТекущийПоток.Вставить(Имя, Значение);
	
	Возврат ЭтотОбъект;

КонецФункции // Свойство()

Функция ТипЭлемента(Тип) Экспорт 

	Свойство("Тип", Тип);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ВидЭлемента(Вид) Экспорт 

	Свойство("Вид", Вид);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Переместить(Имя) Экспорт

	Свойство("Место", Имя);	
	
	Возврат ЭтотОбъект;

КонецФункции // Переместить()

Функция Обработчик(Имя, Метод) Экспорт 

	ПроверитьТекущийЭлемент();

	ТекущийЭлемент.Обработчики.Вставить(Имя, Метод);
	
	Возврат ЭтотОбъект;

КонецФункции // ДобавитьОбработчик()

Функция ОтображатьЗаголовок(ОтображатьЗаголовок) Экспорт 

	Свойство("ОтображатьЗаголовок", ОтображатьЗаголовок);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция РежимПароля(РежимПароля) Экспорт 

	Свойство("РежимПароля", РежимПароля);
	
	Возврат ЭтотОбъект;

КонецФункции


#КонецОбласти

#Область Элементы_Свойства_Автогенерация__С

Функция АвтоВводНезаполненного(АвтоВводНезаполненного) Экспорт 

	Свойство("АвтоВводНезаполненного", АвтоВводНезаполненного);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция АвтоВводНовойСтроки(АвтоВводНовойСтроки) Экспорт 

	Свойство("АвтоВводНовойСтроки", АвтоВводНовойСтроки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция АвтоВысотаЯчейки(АвтоВысотаЯчейки) Экспорт 

	Свойство("АвтоВысотаЯчейки", АвтоВысотаЯчейки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция АвтоМаксимальнаяВысота(АвтоМаксимальнаяВысота) Экспорт 

	Свойство("АвтоМаксимальнаяВысота", АвтоМаксимальнаяВысота);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция АвтоМаксимальнаяВысотаВСтрокахТаблицы(АвтоМаксимальнаяВысотаВСтрокахТаблицы) Экспорт 

	Свойство("АвтоМаксимальнаяВысотаВСтрокахТаблицы", АвтоМаксимальнаяВысотаВСтрокахТаблицы);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция АвтоМаксимальнаяШирина(АвтоМаксимальнаяШирина) Экспорт 

	Свойство("АвтоМаксимальнаяШирина", АвтоМаксимальнаяШирина);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция АвтоОтметкаНезаполненного(АвтоОтметкаНезаполненного) Экспорт 

	Свойство("АвтоОтметкаНезаполненного", АвтоОтметкаНезаполненного);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция АктивизироватьПоУмолчанию(АктивизироватьПоУмолчанию) Экспорт 

	Свойство("АктивизироватьПоУмолчанию", АктивизироватьПоУмолчанию);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ВажностьПриОтображении(ВажностьПриОтображении) Экспорт 

	Свойство("ВажностьПриОтображении", ВажностьПриОтображении);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ВариантУправленияВысотой(ВариантУправленияВысотой) Экспорт 

	Свойство("ВариантУправленияВысотой", ВариантУправленияВысотой);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ВертикальнаяПолосаПрокрутки(ВертикальнаяПолосаПрокрутки) Экспорт 

	Свойство("ВертикальнаяПолосаПрокрутки", ВертикальнаяПолосаПрокрутки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ВертикальноеПоложение(ВертикальноеПоложение) Экспорт 

	Свойство("ВертикальноеПоложение", ВертикальноеПоложение);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ВертикальноеПоложениеВГруппе(ВертикальноеПоложениеВГруппе) Экспорт 

	Свойство("ВертикальноеПоложениеВГруппе", ВертикальноеПоложениеВГруппе);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ВертикальныеЛинии(ВертикальныеЛинии) Экспорт 

	Свойство("ВертикальныеЛинии", ВертикальныеЛинии);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Вид(Вид) Экспорт 

	Свойство("Вид", Вид);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Видимость(Видимость) Экспорт 

	Свойство("Видимость", Видимость);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Вывод(Вывод) Экспорт 

	Свойство("Вывод", Вывод);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ВыделенныеСтроки(ВыделенныеСтроки) Экспорт 

	Свойство("ВыделенныеСтроки", ВыделенныеСтроки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Высота(Высота) Экспорт 

	Свойство("Высота", Высота);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ВысотаВСтрокахТаблицы(ВысотаВСтрокахТаблицы) Экспорт 

	Свойство("ВысотаВСтрокахТаблицы", ВысотаВСтрокахТаблицы);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ВысотаЗаголовка(ВысотаЗаголовка) Экспорт 

	Свойство("ВысотаЗаголовка", ВысотаЗаголовка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ВысотаПодвала(ВысотаПодвала) Экспорт 

	Свойство("ВысотаПодвала", ВысотаПодвала);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ВысотаШапки(ВысотаШапки) Экспорт 

	Свойство("ВысотаШапки", ВысотаШапки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ГиперссылкаЯчейки(ГиперссылкаЯчейки) Экспорт 

	Свойство("ГиперссылкаЯчейки", ГиперссылкаЯчейки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ГоризонтальнаяПолосаПрокрутки(ГоризонтальнаяПолосаПрокрутки) Экспорт 

	Свойство("ГоризонтальнаяПолосаПрокрутки", ГоризонтальнаяПолосаПрокрутки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ГоризонтальноеПоложение(ГоризонтальноеПоложение) Экспорт 

	Свойство("ГоризонтальноеПоложение", ГоризонтальноеПоложение);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ГоризонтальноеПоложениеВГруппе(ГоризонтальноеПоложениеВГруппе) Экспорт 

	Свойство("ГоризонтальноеПоложениеВГруппе", ГоризонтальноеПоложениеВГруппе);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ГоризонтальноеПоложениеВПодвале(ГоризонтальноеПоложениеВПодвале) Экспорт 

	Свойство("ГоризонтальноеПоложениеВПодвале", ГоризонтальноеПоложениеВПодвале);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ГоризонтальноеПоложениеВШапке(ГоризонтальноеПоложениеВШапке) Экспорт 

	Свойство("ГоризонтальноеПоложениеВШапке", ГоризонтальноеПоложениеВШапке);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ГоризонтальныеЛинии(ГоризонтальныеЛинии) Экспорт 

	Свойство("ГоризонтальныеЛинии", ГоризонтальныеЛинии);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Группировка(Группировка) Экспорт 

	Свойство("Группировка", Группировка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Доступность(Доступность) Экспорт 

	Свойство("Доступность", Доступность);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Заголовок(Заголовок) Экспорт 

	Свойство("Заголовок", Заголовок);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ЗапросОбновления(ЗапросОбновления) Экспорт 

	Свойство("ЗапросОбновления", ЗапросОбновления);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ИзменятьПорядокСтрок(ИзменятьПорядокСтрок) Экспорт 

	Свойство("ИзменятьПорядокСтрок", ИзменятьПорядокСтрок);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ИзменятьСоставСтрок(ИзменятьСоставСтрок) Экспорт 

	Свойство("ИзменятьСоставСтрок", ИзменятьСоставСтрок);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Имя(Имя) Экспорт 

	Свойство("Имя", Имя);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ИмяКоманды(ИмяКоманды) Экспорт 

	Свойство("ИмяКоманды", ИмяКоманды);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ИспользованиеТекущейСтроки(ИспользованиеТекущейСтроки) Экспорт 

	Свойство("ИспользованиеТекущейСтроки", ИспользованиеТекущейСтроки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Картинка(Картинка) Экспорт 

	Свойство("Картинка", Картинка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция КартинкаПодвала(КартинкаПодвала) Экспорт 

	Свойство("КартинкаПодвала", КартинкаПодвала);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция КартинкаСтрок(КартинкаСтрок) Экспорт 

	Свойство("КартинкаСтрок", КартинкаСтрок);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция КартинкаШапки(КартинкаШапки) Экспорт 

	Свойство("КартинкаШапки", КартинкаШапки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция КнопкаПоУмолчанию(КнопкаПоУмолчанию) Экспорт 

	Свойство("КнопкаПоУмолчанию", КнопкаПоУмолчанию);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция КонтекстноеМеню(КонтекстноеМеню) Экспорт 

	Свойство("КонтекстноеМеню", КонтекстноеМеню);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция МаксимальнаяВысота(МаксимальнаяВысота) Экспорт 

	Свойство("МаксимальнаяВысота", МаксимальнаяВысота);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция МаксимальнаяВысотаВСтрокахТаблицы(МаксимальнаяВысотаВСтрокахТаблицы) Экспорт 

	Свойство("МаксимальнаяВысотаВСтрокахТаблицы", МаксимальнаяВысотаВСтрокахТаблицы);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция МаксимальнаяШирина(МаксимальнаяШирина) Экспорт 

	Свойство("МаксимальнаяШирина", МаксимальнаяШирина);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция МножественныйВыбор(МножественныйВыбор) Экспорт 

	Свойство("МножественныйВыбор", МножественныйВыбор);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция НачальноеОтображениеДерева(НачальноеОтображениеДерева) Экспорт 

	Свойство("НачальноеОтображениеДерева", НачальноеОтображениеДерева);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция НачальноеОтображениеСписка(НачальноеОтображениеСписка) Экспорт 

	Свойство("НачальноеОтображениеСписка", НачальноеОтображениеСписка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ОграничениеТипа(ОграничениеТипа) Экспорт 

	Свойство("ОграничениеТипа", ОграничениеТипа);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ОтметкаНезаполненного(ОтметкаНезаполненного) Экспорт 

	Свойство("ОтметкаНезаполненного", ОтметкаНезаполненного);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ОтображатьВПодвале(ОтображатьВПодвале) Экспорт 

	Свойство("ОтображатьВПодвале", ОтображатьВПодвале);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ОтображатьВШапке(ОтображатьВШапке) Экспорт 

	Свойство("ОтображатьВШапке", ОтображатьВШапке);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Отображение(Отображение) Экспорт 

	Свойство("Отображение", Отображение);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ОтображениеПодсказки(ОтображениеПодсказки) Экспорт 

	Свойство("ОтображениеПодсказки", ОтображениеПодсказки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ОтображениеПредупрежденияПриРедактировании(ОтображениеПредупрежденияПриРедактировании) Экспорт 

	Свойство("ОтображениеПредупрежденияПриРедактировании", ОтображениеПредупрежденияПриРедактировании);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ОтображениеФигуры(ОтображениеФигуры) Экспорт 

	Свойство("ОтображениеФигуры", ОтображениеФигуры);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПоведениеПриНедоступностиОсновногоСервера(ПоведениеПриНедоступностиОсновногоСервера) Экспорт 

	Свойство("ПоведениеПриНедоступностиОсновногоСервера", ПоведениеПриНедоступностиОсновногоСервера);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПоведениеПриСжатииПоГоризонтали(ПоведениеПриСжатииПоГоризонтали) Экспорт 

	Свойство("ПоведениеПриСжатииПоГоризонтали", ПоведениеПриСжатииПоГоризонтали);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Подвал(Подвал) Экспорт 

	Свойство("Подвал", Подвал);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Подсказка(Подсказка) Экспорт 

	Свойство("Подсказка", Подсказка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПодчиненныеЭлементы(ПодчиненныеЭлементы) Экспорт 

	Свойство("ПодчиненныеЭлементы", ПодчиненныеЭлементы);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПоискПриВводе(ПоискПриВводе) Экспорт 

	Свойство("ПоискПриВводе", ПоискПриВводе);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПоложениеВКоманднойПанели(ПоложениеВКоманднойПанели) Экспорт 

	Свойство("ПоложениеВКоманднойПанели", ПоложениеВКоманднойПанели);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПоложениеЗаголовка(ПоложениеЗаголовка) Экспорт 

	Свойство("ПоложениеЗаголовка", ПоложениеЗаголовка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПоложениеКартинки(ПоложениеКартинки) Экспорт 

	Свойство("ПоложениеКартинки", ПоложениеКартинки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПоложениеКоманднойПанели(ПоложениеКоманднойПанели) Экспорт 

	Свойство("ПоложениеКоманднойПанели", ПоложениеКоманднойПанели);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПоложениеСостоянияПросмотра(ПоложениеСостоянияПросмотра) Экспорт 

	Свойство("ПоложениеСостоянияПросмотра", ПоложениеСостоянияПросмотра);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПоложениеСтрокиПоиска(ПоложениеСтрокиПоиска) Экспорт 

	Свойство("ПоложениеСтрокиПоиска", ПоложениеСтрокиПоиска);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПоложениеУправленияПоиском(ПоложениеУправленияПоиском) Экспорт 

	Свойство("ПоложениеУправленияПоиском", ПоложениеУправленияПоиском);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Пометка(Пометка) Экспорт 

	Свойство("Пометка", Пометка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПредупреждениеПриРедактировании(ПредупреждениеПриРедактировании) Экспорт 

	Свойство("ПредупреждениеПриРедактировании", ПредупреждениеПриРедактировании);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПропускатьПриВводе(ПропускатьПриВводе) Экспорт 

	Свойство("ПропускатьПриВводе", ПропускатьПриВводе);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПутьКДанным(ПутьКДанным) Экспорт 

	Свойство("ПутьКДанным", ПутьКДанным);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПутьКДаннымКартинкиСтроки(ПутьКДаннымКартинкиСтроки) Экспорт 

	Свойство("ПутьКДаннымКартинкиСтроки", ПутьКДаннымКартинкиСтроки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ПутьКДаннымПодвала(ПутьКДаннымПодвала) Экспорт 

	Свойство("ПутьКДаннымПодвала", ПутьКДаннымПодвала);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция РазрешитьИзменениеСостава(РазрешитьИзменениеСостава) Экспорт 

	Свойство("РазрешитьИзменениеСостава", РазрешитьИзменениеСостава);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция РазрешитьНачалоПеретаскивания(РазрешитьНачалоПеретаскивания) Экспорт 

	Свойство("РазрешитьНачалоПеретаскивания", РазрешитьНачалоПеретаскивания);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция РазрешитьПеретаскивание(РазрешитьПеретаскивание) Экспорт 

	Свойство("РазрешитьПеретаскивание", РазрешитьПеретаскивание);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция РастягиватьПоВертикали(РастягиватьПоВертикали) Экспорт 

	Свойство("РастягиватьПоВертикали", РастягиватьПоВертикали);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция РастягиватьПоГоризонтали(РастягиватьПоГоризонтали) Экспорт 

	Свойство("РастягиватьПоГоризонтали", РастягиватьПоГоризонтали);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция РасширеннаяПодсказка(РасширеннаяПодсказка) Экспорт 

	Свойство("РасширеннаяПодсказка", РасширеннаяПодсказка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция РежимВводаСтрок(РежимВводаСтрок) Экспорт 

	Свойство("РежимВводаСтрок", РежимВводаСтрок);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция РежимВыбора(РежимВыбора) Экспорт 

	Свойство("РежимВыбора", РежимВыбора);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция РежимВыделения(РежимВыделения) Экспорт 

	Свойство("РежимВыделения", РежимВыделения);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция РежимВыделенияСтроки(РежимВыделенияСтроки) Экспорт 

	Свойство("РежимВыделенияСтроки", РежимВыделенияСтроки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция РежимРедактирования(РежимРедактирования) Экспорт 

	Свойство("РежимРедактирования", РежимРедактирования);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Родитель(Родитель) Экспорт 

	Свойство("Родитель", Родитель);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция СостояниеПросмотра(СостояниеПросмотра) Экспорт 

	Свойство("СостояниеПросмотра", СостояниеПросмотра);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция СочетаниеКлавиш(СочетаниеКлавиш) Экспорт 

	Свойство("СочетаниеКлавиш", СочетаниеКлавиш);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция СпособПеретаскиванияФайлов(СпособПеретаскиванияФайлов) Экспорт 

	Свойство("СпособПеретаскиванияФайлов", СпособПеретаскиванияФайлов);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция СтрокаПоиска(СтрокаПоиска) Экспорт 

	Свойство("СтрокаПоиска", СтрокаПоиска);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ТекстПодвала(ТекстПодвала) Экспорт 

	Свойство("ТекстПодвала", ТекстПодвала);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ТекущаяСтрока(ТекущаяСтрока) Экспорт 

	Свойство("ТекущаяСтрока", ТекущаяСтрока);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ТекущиеДанные(ТекущиеДанные) Экспорт 

	Свойство("ТекущиеДанные", ТекущиеДанные);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ТекущийРодитель(ТекущийРодитель) Экспорт 

	Свойство("ТекущийРодитель", ТекущийРодитель);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ТолькоВоВсехДействиях(ТолькоВоВсехДействиях) Экспорт 

	Свойство("ТолькоВоВсехДействиях", ТолькоВоВсехДействиях);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ТолькоПросмотр(ТолькоПросмотр) Экспорт 

	Свойство("ТолькоПросмотр", ТолькоПросмотр);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция УникальностьКоманды(УникальностьКоманды) Экспорт 

	Свойство("УникальностьКоманды", УникальностьКоманды);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция УправлениеПоиском(УправлениеПоиском) Экспорт 

	Свойство("УправлениеПоиском", УправлениеПоиском);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Фигура(Фигура) Экспорт 

	Свойство("Фигура", Фигура);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ФиксацияВТаблице(ФиксацияВТаблице) Экспорт 

	Свойство("ФиксацияВТаблице", ФиксацияВТаблице);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ЦветРамки(ЦветРамки) Экспорт 

	Свойство("ЦветРамки", ЦветРамки);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ЦветТекста(ЦветТекста) Экспорт 

	Свойство("ЦветТекста", ЦветТекста);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ЦветТекстаЗаголовка(ЦветТекстаЗаголовка) Экспорт 

	Свойство("ЦветТекстаЗаголовка", ЦветТекстаЗаголовка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ЦветТекстаПодвала(ЦветТекстаПодвала) Экспорт 

	Свойство("ЦветТекстаПодвала", ЦветТекстаПодвала);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ЦветФона(ЦветФона) Экспорт 

	Свойство("ЦветФона", ЦветФона);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ЦветФонаЗаголовка(ЦветФонаЗаголовка) Экспорт 

	Свойство("ЦветФонаЗаголовка", ЦветФонаЗаголовка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ЦветФонаПодвала(ЦветФонаПодвала) Экспорт 

	Свойство("ЦветФонаПодвала", ЦветФонаПодвала);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ЧередованиеЦветовСтрок(ЧередованиеЦветовСтрок) Экспорт 

	Свойство("ЧередованиеЦветовСтрок", ЧередованиеЦветовСтрок);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Шапка(Шапка) Экспорт 

	Свойство("Шапка", Шапка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Ширина(Ширина) Экспорт 

	Свойство("Ширина", Ширина);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция Шрифт(Шрифт) Экспорт 

	Свойство("Шрифт", Шрифт);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ШрифтЗаголовка(ШрифтЗаголовка) Экспорт 

	Свойство("ШрифтЗаголовка", ШрифтЗаголовка);
	
	Возврат ЭтотОбъект;

КонецФункции

Функция ШрифтПодвала(ШрифтПодвала) Экспорт 

	Свойство("ШрифтПодвала", ШрифтПодвала);
	
	Возврат ЭтотОбъект;

КонецФункции

#КонецОбласти

#Область Элементы_Вспомогательные__У

Функция ТекущийЭлемент(Имя) Экспорт 

	Элемент = Элементы.Найти(Имя, "Имя");
	
	Если Элемент = Неопределено Тогда
		
		ЭлементФормы = Форма.Элементы.Найти(Имя);
		
		Если ЭлементФормы = Неопределено Тогда
			ВызватьИсключение "Элемент не найден " + Имя;
		Иначе
			
			ТекущийЭлемент = ПараметрыСозданияЭлементов();
			ТекущийЭлемент.Имя = Имя;
	
			Элемент = Элементы.Добавить();
			Элемент.Имя = Имя;
			Элемент.Параметры = ТекущийЭлемент;
			Элемент.ЭлементФормы = ЭлементФормы;
			
		КонецЕсли;
	Иначе
		ТекущийЭлемент = Элемент.Параметры;	
	КонецЕсли;
	
	ТекущийПоток = ТекущийЭлемент;
	
	Возврат ЭтотОбъект;

КонецФункции // ТекущийЭлемент

Функция СоздатьЭлементы() 

	Для Каждого Элемент из Элементы Цикл
		Если Не Элемент.Обработан = Истина Тогда 
			СоздатьЭлемент(Элемент);		
		КонецЕсли;
	КонецЦикла;
	
	ТаблицаЭлементов();
	
	Возврат ЭтотОбъект;

КонецФункции // СоздатьЭлементы()

Функция СоздатьЭлемент(Элемент)
	
	ПараметрыСоздания = Элемент.Параметры;
	
	Если ЗначениеЗаполнено(ПараметрыСоздания.Родитель) Тогда
		Родитель = НайтиЭлемент(ПараметрыСоздания.Родитель);	
	Иначе 
		Родитель = Форма;	
	КонецЕсли;
	
	Место = НайтиЭлемент(ПараметрыСоздания.Место);
	
	Если Элемент.ЭлементФормы = Неопределено Тогда
		НовыйЭлемент = Форма.Элементы.Добавить(ПараметрыСоздания.Имя, ПараметрыСоздания.Тип, Родитель);
	Иначе 
		НовыйЭлемент = Элемент.ЭлементФормы;
	КонецЕсли;
		
	Если не ПараметрыСоздания.Вид = Неопределено Тогда
		НовыйЭлемент.Вид = ПараметрыСоздания.Вид;
	КонецЕсли;
	
	Если не ПараметрыСоздания.ПутьКДанным = Неопределено Тогда
		НовыйЭлемент.ПутьКДанным = ПараметрыСоздания.ПутьКДанным;
	КонецЕсли;
	
	Если не Место = Неопределено Тогда
		Форма.Элементы.Переместить(НовыйЭлемент, Родитель, Место); 
	КонецЕсли;
	
	Для Каждого Обработчик из ПараметрыСоздания.Обработчики цикл
		НовыйЭлемент.УстановитьДействие(Обработчик.Ключ, Обработчик.Значение);	
	КонецЦикла;
	
	//Прочие свойства
	СтандартныеСвойства = ПараметрыСозданияЭлементов();
	Для Каждого ТекСвойство из ПараметрыСоздания Цикл
		Если СтандартныеСвойства.Свойство(ТекСвойство.Ключ) = Ложь Тогда
			НовыйЭлемент[ТекСвойство.Ключ] = ТекСвойство.Значение;
		КонецЕсли;
	КонецЦикла;
	
	Элемент.ЭлементФормы = НовыйЭлемент;
	Элемент.Обработан = Истина;
	
	Возврат НовыйЭлемент;
	
КонецФункции

Функция НайтиЭлемент(Имя)
	
	Если не ЗначениеЗаполнено(Имя) Тогда
		Возврат Неопределено;
	КонецЕсли;

	//Сначала будем искать в существующих элементах формы
	Результат = Форма.Элементы.Найти(Имя);
	Если не Результат = Неопределено Тогда
		Возврат Результат;
	КонецЕсли;
	
	//Ищем в программных элементах
	ПрограммныйЭлемент = Элементы.Найти(Имя, "Имя");
	
	Если ПрограммныйЭлемент = Неопределено Тогда
		ВызватьИсключение СтрШаблон("Элемент ""%1"" не найден", Имя);	
	КонецЕсли;
	
	Если ПрограммныйЭлемент.ЭлементФормы = Неопределено Тогда
		Возврат СоздатьЭлемент(ПрограммныйЭлемент);	
	Иначе
		Возврат ПрограммныйЭлемент.ЭлементФормы;	
	КонецЕсли;

КонецФункции // НайтиЭлемент()

Процедура ТаблицаЭлементов()

	Элементы = Новый ТаблицаЗначений;
	Элементы.Колонки.Добавить("Имя");
	Элементы.Колонки.Добавить("ЭлементФормы");
	Элементы.Колонки.Добавить("Параметры");
	Элементы.Колонки.Добавить("Обработан");

КонецПроцедуры

Функция ПараметрыСозданияЭлементов() 
	
	Результат = Новый Структура;
	
	Результат.Вставить("Имя");
	Результат.Вставить("Тип");
	Результат.Вставить("Родитель");
	Результат.Вставить("Место");
	Результат.Вставить("ПутьКДанным");
	Результат.Вставить("Вид");
	Результат.Вставить("Обработчики", Новый Структура);
	
	Возврат Результат;
	
КонецФункции

Процедура ПроверитьТекущийЭлемент()

	Если ТекущийЭлемент = Неопределено Тогда
		ВызватьИсключение "Элемент не инициализирован";
	КонецЕсли;
	
	Если НЕ ТекущийЭлемент = ТекущийПоток Тогда
		ВызватьИсключение "Обработчик не применим к команде";
	КонецЕсли;

КонецПроцедуры

Функция ПутьРеквизита(_ПутьРеквизита = "") Экспорт 

	ПутьРеквизита = _ПутьРеквизита;
	
	Возврат ЭтотОбъект;

КонецФункции // ПутьРеквизита()

#КонецОбласти

#Область Команды_Свойства__С

Функция ИзменяетСохраняемыеДанные(ИзменяетСохраняемыеДанные) Экспорт
	
	Свойство("ИзменяетСохраняемыеДанные", ИзменяетСохраняемыеДанные);
	
	Возврат ЭтотОбъект;
	
КонецФункции

#КонецОбласти

#Область Команды_Вспомогательные__У

Функция ТекущаяКоманда(Имя) Экспорт 

	Команда = Команды.Найти(Имя, "Имя");
	
	Если Команда = Неопределено Тогда
		
		КомандаФормы = Форма.Команды.Найти(Имя);
		
		Если КомандаФормы = Неопределено Тогда
			ВызватьИсключение "Команда не найдена " + Имя;
		Иначе
			
			ТекущаяКоманда = ПараметрыСозданияКоманды();
			ТекущаяКоманда.Имя = Имя;
	
			Элемент = Команды.Добавить();
			Элемент.Имя = Имя;
			Элемент.Параметры = ТекущийЭлемент;
			Элемент.КомандаФормы = КомандаФормы;
			
		КонецЕсли;
	Иначе
		ТекущийЭлемент = Элемент.Параметры;
	КонецЕсли;
	
	ТекущийПоток = ТекущийЭлемент;
	
	Возврат ЭтотОбъект;

КонецФункции // ТекущийЭлемент

Функция СоздатьКоманды()
	
	Для Каждого Команда из Команды Цикл
		Если Не Команда.Обработан = Истина Тогда 
			СоздатьКоманду(Команда);
		КонецЕсли;
	КонецЦикла;
	
	ТаблицаКоманд();
	
	Возврат ЭтотОбъект;

КонецФункции // СоздатьКоманды()

Функция СоздатьКоманду(Команда)
	
	ПараметрыСоздания = Команда.Параметры;
	
	Если Команда.КомандаФормы = Неопределено Тогда
		НоваяКоманда = Форма.Команды.Добавить(Команда.Имя);
		НоваяКоманда.Заголовок = ПараметрыСоздания.Заголовок;
		НоваяКоманда.Действие = ПараметрыСоздания.Действие;
	Иначе
		НоваяКоманда = Команда.КомандаФормы; 
	КонецЕсли;
	
	Если Не ПараметрыСоздания.ИзменяетСохраняемыеДанные = Неопределено Тогда
		НоваяКоманда.ИзменяетСохраняемыеДанные = ПараметрыСоздания.ИзменяетСохраняемыеДанные;
	КонецЕсли;
	
	Если Не ПараметрыСоздания.Картинка = Неопределено Тогда
		НоваяКоманда.Картинка = ПараметрыСоздания.Картинка;
	КонецЕсли;
	
	Если Не ПараметрыСоздания.Подсказка = Неопределено Тогда
		НоваяКоманда.Подсказка = ПараметрыСоздания.Подсказка;
	КонецЕсли;
	
	Если Не ПараметрыСоздания.СочетаниеКлавиш = Неопределено Тогда
		НоваяКоманда.СочетаниеКлавиш = ПараметрыСоздания.СочетаниеКлавиш;
	КонецЕсли;
	
	//Прочие свойства
	СтандартныеСвойства = ПараметрыСозданияКоманды();
	Для Каждого ТекСвойство из ПараметрыСоздания Цикл
		Если СтандартныеСвойства.Свойство(ТекСвойство.Ключ) = Ложь Тогда
			НоваяКоманда[ТекСвойство.Ключ] = ТекСвойство.Значение;
		КонецЕсли;
	КонецЦикла;
	
	Команда.КомандаФормы = НоваяКоманда;
	Команда.Обработан = Истина;
	
	Возврат НоваяКоманда;
	
КонецФункции

Процедура ТаблицаКоманд()

	Команды = Новый ТаблицаЗначений;
	Команды.Колонки.Добавить("Имя");
	Команды.Колонки.Добавить("КомандаФормы");
	Команды.Колонки.Добавить("Параметры");
	Команды.Колонки.Добавить("Обработан");

КонецПроцедуры

Функция ПараметрыСозданияКоманды() 
	
	Результат = Новый Структура;
	
	Результат.Вставить("Имя");
	Результат.Вставить("Действие");
	Результат.Вставить("ИзменяетСохраняемыеДанные");
	Результат.Вставить("Заголовок");
	Результат.Вставить("Картинка");
	Результат.Вставить("Подсказка");
	Результат.Вставить("СочетаниеКлавиш");
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти

#Область Общие_Вспомогательные__О

Процедура ПроверитьТекущийПоток()

	Если ТекущийПоток = Неопределено Тогда
		ВызватьИсключение "Элемент не инициализирован";
	КонецЕсли;

КонецПроцедуры

Функция Применить() Экспорт 

	СоздатьРеквизиты();
	СоздатьКоманды();
	СоздатьЭлементы();
	
	Возврат ЭтотОбъект;

КонецФункции // Применить()

#КонецОбласти

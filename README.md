# sql_course_4semester
Homeworks for sql course completed during the 4th semester.

## Table of content
### [Introduction](HomeTask1)
1. Создайте базу данных pet_db с помощью скрипта Pets_script.sql. Для этого:
* Запустите среду разработчика. (например, Start -> All Programs -> Microsoft SQL Server -> SQL Server Management Studio)

* Соединитесь с сервером (connect)
* откройте в рабочем окне скрипт из файла Pets_script.sql и выполните его.

При использовании СУБД иной, чем MS SQL Server, при необходимости подкорректируйте этот скрипт (типы данных и стандартные функции).
Убедитесь, что скрипт отработал безошибочно.
Если имеется такая возможность, сгенерируйте er-диаграмму по созданной уже базе данных – для дополнительного контроля успешности создания правильной схемы. 

2. Дополните новую базу данных двумя таблицами, спроектированными по новым требованиям (прививка и вид прививки):
Напишите небольшой скрипт, включающий: 
* операторы создания новых таблиц и ключей 
* операторы добавления тестовых записей (по 2-5 для каждой таблицы)
* операторы удаления таблиц (в правильном порядке)

Выполните этот скрипт на базе pet_db. Убедитесь, что он отработал безошибочно.
Если имеется такая возможность, сгенерируйте er-диаграмму по измененной базе данных.
В качестве результата выполнения задания сдайте экранную форму, так или иначе демонстрирующую успешность выполнения работы (например, экранную форму с результатами успешного выполнения скрипта или последнюю сгенерированную er-диаграмму).

### [Select](HomeTask2)
Напишите и отладьте следующие запросы к таблице Pet:
1.  Данные на Партизана.
2.  Клички и породы всех питомцев с сортировкой по возрасту.
3.  Питомцы, имеющие хоть какое-нибудь описание.
4.  Средний возраст пуделей.
5.  Количество владельцев. 
Сами придумайте к этой таблице запросы с использованием перечисленных ниже синтаксических элементов (надо придумать и текстовые формулировки):
6.  запрос с BETWEEN
7.  запрос с LIKE
8.  запрос с IN(...)      (без вложенного select, это будет позже :))

### [Join](HomeTask3)
Напишите и отладьте следующие запросы:
(попробуйте использовать оба синтаксиса соединения таблиц - с JOIN и без)

1. Данные на Партизана (включая вид животного).
2. Список всех собак с кличками, породой и возрастом.
3. Средний возраст кошек.

Если в используемой вами СУБД ф-ция AVG округляет результат до целого (в соответствие с типом данных аргумента), используйте ф-ию преобразования поля AGE в вещественный тип.
В MS SQL, например, можно написать: AVG(convert(decimal, AGE)).
4. Время и исполнители невыполненных заказов.
5. Список хозяев собак (имя, фамилия, телефон). 
6. Все виды питомцев и клички представителей этих видов (внешнее соединение).
7. Придумайте какой-нибудь осмысленный запрос про прививки, в котором задействованы не менее четырех таблиц базы данных. Не забудьте добавить текстовую формулировку.

### []()
Напишите и отладьте следующие запросы:
1. Сколько имеется питомцев в возрасте 1 год, 2 года, и т.д.
2. Сколько имеется котов, собак и т.д. в возрасте 1 год, 2 года, и т.д.
3. Виды питомцев, средний возраст которых меньше шести лет:
4. Фамилии сотрудников, выполнивших более пяти заказов.
5 и 6. Напишите два любых запроса к базе (к одной или более таблицам, с группированием или без него), используя любые стандартные функции языка СУБД (это не должны быть sql-функции агрегирования - count, avg,...
Пусть одна из них работает с датами, другая со строками. Напишите краткий текстовый комментарий к каждому из запросов.
Список стандартных функций Transact SQL см. в MS SQL Server Management Studio: панель Object Explorer, Databases\Pets_db_2020\Programmability\Functions\System Functions
Также можно попробовать описать переменные (на языке СУБД) и принять в них какую-либо информацию из базы данных.
Не забудьте добавить для этих двух запросов текстовые формулировки.

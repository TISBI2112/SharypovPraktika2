CREATE DATABASE Cinemma
USE Cinemma
CREATE TABLE Genre (
GenreId INT CONSTRAINT PK_Genre PRIMARY KEY IDENTITY,
GenreName varchar (50)
)
CREATE TABLE Users (
UserId INT CONSTRAINT PK_User PRIMARY KEY IDENTITY,
Login varchar (50),
Password varchar (50)
) 
CREATE TABLE Film (
FilmId INT CONSTRAINT PK_Film PRIMARY KEY IDENTITY,
FilmName varchar (50),
Description varchar (250),
ShowDate date,
GenreId INT CONSTRAINT FK_Film_TO_Genre REFERENCES GENRE (GenreId),
CardAccess varchar (3)
)
INSERT INTO Genre (GenreName)
VALUES
('Ужасы'),
('Комедия'),
('Триллер'),
('Драма'),
('Боевик'),
('Романтика'),
('Детектив')

INSERT INTO Users (Login, Password)
VALUES
(1,1234),
(2,12345),
(3,123456)
INSERT INTO Film (FilmName, Description, ShowDate, GenreId, CardAccess)
VALUES
	('Астрал',	'О людях, в которых вселялись сущности из потустороннего мира',	'2019-09-21',	1,	'Нет'),
	('Джон Уик',	'Джон Уик, легендарный киллер по прозвищу Баба Яга, начинает охоту на обидчика.',	'2019-10-25',	5,	'Да'),
	('Она',	'Теодор, одинокий писатель. Он покупает операционную систему с ИИ и настраивает для нее виртуальную личность.',	'2018-12-07',	6,	'Да'),
	('Остров проклятых',	'Два американских судебных пристава отправляются на один из островов в штате Массачусетс, чтобы расследовать исчезновение пациентки клиники для умалишенных преступников.', 	'2015-06-28',	7,	'Нет'),
	('Паразиты',	'Нищее семейство обманным путем устраивается на работу в дом богачей.',	'2020-01-21',	4,	'Да'),
	('Леон',	'Профессиональный убийца Леон неожиданно для себя самого решает помочь 12-летней соседке Матильде, семью которой убили коррумпированные полицейские.',	'2001-02-15',	3,	'Нет'),
	('Зеленая книга',	'Путешествие итальянца-вышибалы и чернокожего пианиста по Америке 1960-х.',	'2017-06-29',	2,	'Да')

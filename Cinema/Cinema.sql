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
('�����'),
('�������'),
('�������'),
('�����'),
('������'),
('���������'),
('��������')

INSERT INTO Users (Login, Password)
VALUES
(1,1234),
(2,12345),
(3,123456)
INSERT INTO Film (FilmName, Description, ShowDate, GenreId, CardAccess)
VALUES
	('������',	'� �����, � ������� ��������� �������� �� �������������� ����',	'2019-09-21',	1,	'���'),
	('���� ���',	'���� ���, ����������� ������ �� �������� ���� ���, �������� ����� �� ��������.',	'2019-10-25',	5,	'��'),
	('���',	'������, �������� ��������. �� �������� ������������ ������� � �� � ����������� ��� ��� ����������� ��������.',	'2018-12-07',	6,	'��'),
	('������ ���������',	'��� ������������ �������� �������� ������������ �� ���� �� �������� � ����� �����������, ����� ������������ ������������ ��������� ������� ��� ����������� ������������.', 	'2015-06-28',	7,	'���'),
	('��������',	'����� ��������� �������� ����� ������������ �� ������ � ��� �������.',	'2020-01-21',	4,	'��'),
	('����',	'���������������� ������ ���� ���������� ��� ���� ������ ������ ������ 12-������ ������� ��������, ����� ������� ����� ���������������� �����������.',	'2001-02-15',	3,	'���'),
	('������� �����',	'����������� ���������-�������� � ����������� �������� �� ������� 1960-�.',	'2017-06-29',	2,	'��')

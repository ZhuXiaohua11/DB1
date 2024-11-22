-- 1. Skapa databas och tabeller
drop database if exists `XiaohuaDB`;

create database `XiaohuaDB`;

use XiaohuaDB;

create table authors(
author_id INT primary key auto_increment,
first_name VARCHAR(50),
last_name VARCHAR(50),
birth_year INT);

create table publishers (
publisher_id INT primary key auto_increment,
name Varchar(100),
location Varchar(100)
);

create table books (
book_id INT primary key auto_increment,
title VARCHAR(100),
publication_year INT,
author_id INT,
publisher_id INT,
foreign key (author_id) references authors(author_id) on
delete
	set
	null on
	update
		cascade,
		foreign key (publisher_id) references publishers(publisher_id) on
		delete
			set
			null on
			update
				cascade
);

create table genres (
genre_id INT primary key auto_increment,
genre_name VARCHAR(50)
);

create table book_genre(
book_id INT,
genre_id INT,
foreign key (book_id) references books(book_id),
foreign key (genre_id) references genres(genre_id),
primary key (book_id,
genre_id)
);
-- 2.Infoga data
insert
	into
	authors (first_name,
	last_name,
	birth_year)
values
('J.K.',
'Rowling',
1965),
('George',
'Orwell',
1903),
('J.R.R.',
'Tolkien',
1892),
('Mark',
'Twain',
1835),
('Isaac',
'Asimov',
1920),
('Arthur Conan',
'Doyle',
1859),
('Agatha',
'Christie',
1890),
('Philip K.',
'Dick',
1928),
('Stephen',
'King',
1947),
('Suzanne',
'Collins',
1962),
('George R.R.',
'Martin',
1948),
('Harlan',
'Coben',
1962);

insert
	into
	books (title,
	publication_year,
	author_id,
	publisher_id)
values
("Harry Potter and the Philosopher's Stone",
1997,
(
select
	author_id
from
	authors
where
	first_name = 'J.K.'
	and last_name = 'Rowling'),
null),
("1984",
1949,
(
select
	author_id
from
	authors
where
	first_name = 'George'
	and last_name = 'Orwell'),
null),
("The Hobbit",
1937,
(
select
	author_id
from
	authors
where
	first_name = 'J.R.R.'
	and last_name = 'Tolkien'),
null),
("The Adventures of Tom Sawyer",
1876,
(
select
	author_id
from
	authors
where
	first_name = 'Mark'
	and last_name = 'Twain'),
null),
("Foundation",
1951,
(
select
	author_id
from
	authors
where
	first_name = 'Isaac'
	and last_name = 'Asimov'),
null),
("The Hound of the Baskervilles",
1902,
(
select
	author_id
from
	authors
where
	first_name = 'Arthur Conan'
	and last_name = 'Doyle'),
null),
("Murder on the Orient Express",
1934,
(
select
	author_id
from
	authors
where
	first_name = 'Agatha'
	and last_name = 'Christie'),
null),
("Do Androids Dream of Electric Sheep?",
1968,
(
select
	author_id
from
	authors
where
	first_name = 'Philip K.'
	and last_name = 'Dick'),
null),
("The Shining",
1977,
(
select
	author_id
from
	authors
where
	first_name = 'Stephen'
	and last_name = 'King'),
null),
("The Hunger Games",
2008,
(
select
	author_id
from
	authors
where
	first_name = 'Suzanne'
	and last_name = 'Collins'),
null),
("A Game of Thrones",
1996,
(
select
	author_id
from
	authors
where
	first_name = 'George R.R.'
	and last_name = 'Martin'),
null),
("The Stranger",
2015,
(
select
	author_id
from
	authors
where
	first_name = 'Harlan'
	and last_name = 'Coben'),
null),
("The Woods",
2007,
(
select
	author_id
from
	authors
where
	first_name = 'Harlan'
	and last_name = 'Coben'),
null);

insert
	into
	genres(genre_name)
values
("Fantasy"),
("Adventure"),
("Detective Fiction"),
("Horror"),
("Dystopian"),
("Science Fiction"),
("Thriller");
-- Link Books and Genres
insert
	into
	book_genre (book_id,
	genre_id)
values
((
select
	book_id
from
	books
where
	title = "Harry Potter and the Philosopher's Stone"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Fantasy')),
((
select
	book_id
from
	books
where
	title = "1984"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Detective Fiction')),
((
select
	book_id
from
	books
where
	title = "The Hobbit"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Fantasy')),
((
select
	book_id
from
	books
where
	title = "The Adventures of Tom Sawyer"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Adventure')),
((
select
	book_id
from
	books
where
	title = "Foundation"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Science Fiction')),
((
select
	book_id
from
	books
where
	title = "The Hound of the Baskervilles"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Detective Fiction')),
((
select
	book_id
from
	books
where
	title = "Murder on the Orient Express"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Detective Fiction')),
((
select
	book_id
from
	books
where
	title = "Do Androids Dream of Electric Sheep?"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Science Fiction')),
((
select
	book_id
from
	books
where
	title = "The Shining"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Horror')),
((
select
	book_id
from
	books
where
	title = "The Shining"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Fantasy')),
((
select
	book_id
from
	books
where
	title = "The Hunger Games"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Adventure')),
((
select
	book_id
from
	books
where
	title = "The Hunger Games"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Dystopian')),
((
select
	book_id
from
	books
where
	title = "A Game of Thrones"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Fantasy')),
((
select
	book_id
from
	books
where
	title = "The Stranger"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Detective Fiction')),
((
select
	book_id
from
	books
where
	title = "The Stranger"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Thriller')),
((
select
	book_id
from
	books
where
	title = "The Woods"),
(
select
	genre_id
from
	genres
where
	genre_name = 'Thriller'));

insert
	into
	publishers (name,
	location)
values
("Penguin Books",
"New York"),
("HarperCollins",
"London" ),
("Vintage Books",
"San Francisco");
-- 3. Formulera SQL-frågor:
-- Hämta alla böcker som publicerats före år 1950.
-- Hämtar alla kolumner från tabellen 'books' där böckerna publicerades före 1950
select
	*
from
	books
where
	publication_year < 1950;
-- Hämta alla genrer som innehåller ordet "Classic".
select
	*
from
	genres
where
	genre_name like '%Classic%';
-- Hämta alla böcker av en specifik författare, t.ex. "George Orwell".
select
	books.title,
	books.publication_year
from
	books
inner join authors on
	books.author_id = authors.author_id
where
	authors.first_name = 'George'
	and authors.last_name = 'orwell';
-- Hämta alla böcker som publicerats av ett specifikt förlag och ordna dem efter publiceringsår.
select
	books.title ,
	books.publication_year
from
	books
inner join publishers p on
	books.publisher_id = p.publisher_id
where
	p.name = 'Penguin Books'
order by
	books.publication_year ;
-- Hämta alla böcker tillsammans med deras författare och publiceringsår.
-- Hämtar boktitlar, författarnas för- och efternamn samt publiceringsår genom att slå ihop tabellerna 'books' och 'authors' baserat på deras gemensamma 'author_id',
-- för att kombinera information om böcker med tillhörande författardetaljer
select
	books.title,
	authors.first_name ,
	authors.last_name,
	books.publication_year
from
	books
inner join authors on
	books.author_id = authors.author_id;
-- Hämta alla böcker som publicerades efter den första boken som kom ut efter år 2000.
select
	*
from
	books
where
	publication_year > (
	select
		min(publication_year)
	from
		books
	where
		publication_year>2000);
-- Uppdatera en förtfattares namn.
update
	authors
set
	first_name = 'nytt JK',
	last_name = 'nytt Rowling'
where
	author_id = 1;
-- Ta bort en bok från databasen.
delete
from
	book_genre
where
	book_id = 5;

delete
from
	books
where
	book_id = 5;
-- Extra instruktioner Skapa mer avancerade SQL-frågor:
-- Hämta alla böcker som publicerats efter år 2000 tillsammans med författarens namn, förlagets namn och genrerna.
select
	books.title,
	authors.first_name,
	authors.last_name,
	publishers.name as publisher_name,
	genres.genre_name
from
	books
inner join authors on
	books.author_id = authors.author_id
left join publishers on
	books.publisher_id = publishers.publisher_id
inner join book_genre on
	books.book_id = book_genre.book_id
inner join genres on
	book_genre.genre_id = genres.genre_id
where
	publication_year > 2000;
-- Visa författarnas fullständiga namn (förnamn och efternamn), titlarna på deras böcker och vilken genre böckerna tillhör.
select
	books.title,
	concat(authors.first_name, ' ', authors.last_name) as full_name ,
	genres.genre_name
from
	books
inner join authors on
	books.author_id = authors.author_id
left join publishers on
	books.publisher_id = publishers.publisher_id
inner join book_genre on
	books.book_id = book_genre.book_id
inner join genres on
	book_genre.genre_id = genres.genre_id
	-- Antalet böcker varje författare har skrivit, sorterat i fallande ordning.
select
	CONCAT(authors.first_name, ' ', authors.last_name) as full_name,
	COUNT(books.book_id) as book_count
from
	authors
inner join books on
	authors.author_id = books.author_id
group by
	authors.author_id
order by
	book_count desc;

-- Antalet böcker inom varje genre.
select
	genres.genre_name,
	COUNT(book_genre.book_id) as book_count
from
	genres
inner join book_genre on
	genres.genre_id = book_genre.genre_id
group by
	genres.genre_id
order by
	book_count desc;

-- Genomsnittligt antal böcker per författare som är publicerade efter år 2000.
select
	AVG(book_count) as avg_books_per_author
from
	(
	select
		COUNT(books.book_id) as book_count
	from
		authors
	inner join books on
		authors.author_id = books.author_id
	where
		books.publication_year > 2000
	group by
		authors.author_id) as author_book_counts;
-- Skapa en stored procedure som tar ett årtal som parameter och returnerar alla böcker som publicerats efter detta år. Döp den till get_books_after_year.
-- Tar bort proceduren om den redan existerar att undvika felmeddelanden vid försök att skapa en procedur med ett namn som redan används och tillåter en ny definition av proceduren.
   drop procedure if exists get_books_after_year;
-- Ändrar kommandotolkarens standardavgränsare (från ; till //) så att flerlinjekoden för den lagrade proceduren kan skrivas utan att oavsiktligt avsluta proceduren.
DELIMITER //
-- Skapar en procedur med namnet get_books_after_year som tar en inparameter pubyear av typen INT som representerar året som används för att filtrera böcker
create procedure get_books_after_year(in pubyear int)
-- Markerar början och slutet av procedurens kropp att göra det möjligt att inkludera flera SQL-kommandon som hör till proceduren.
begin
	select
	*
from
	books
where
	publication_year > pubyear;
end //
DELIMITER ;

call get_books_after_year (2000);
-- Skapa en view som visar varje författares fullständiga namn, bokens titel och publiceringsår. Döp den till author_books.

create view author_books as
select
	concat(authors.first_name, "", authors.last_name) as full_name,
	books.title ,
	books.publication_year
from
	authors
join books on
	authors.author_id = books.author_id;

select
	*
from
	author_books;



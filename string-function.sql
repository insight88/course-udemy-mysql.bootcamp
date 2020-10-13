CREATE TABLE cats
(
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY(cat_id)
);

-- mysql-ctl cli

use cat_app;

-- source first_file.sql

DESC cats;

INSERT INTO cats(name, age)
VALUES('Charlie', 17);

INSERT INTO cats(name, age)
VALUES('Connie', 10);

SELECT * FROM cats;

-- source testing/insert.sql

DROP DATABASE IF EXISTS book_shop;
CREATE DATABASE book_shop;
USE book_shop; 

CREATE TABLE books 
(
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY(book_id)
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
('Where I\'m Calling From: Selected Stories', 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- * CONCAT

SELECT author_fname, author_lname FROM books;

CONCAT(x,y,z) // from slides
CONCAT(column, anotherColumn) // from slides
CONCAT(author_fname, author_lname)
CONCAT(column, 'text', anotherColumn, 'more text')
CONCAT(author_fname, ' ', author_lname)
CONCAT(author_fname, author_lname); // invalid syntax

SELECT CONCAT('Hello', 'World');
SELECT CONCAT('Hello', '...', 'World');

SELECT
  CONCAT(author_fname, ' ', author_lname)
FROM books;

SELECT
  CONCAT(author_fname, ' ', author_lname)
  AS 'full name'
FROM books;

SELECT author_fname AS first, author_lname AS last, 
  CONCAT(author_fname, ' ', author_lname) AS full
FROM books;

SELECT author_fname AS first, author_lname AS last, 
  CONCAT(author_fname, ', ', author_lname) AS full
FROM books;

SELECT CONCAT(title, '-', author_fname, '-', author_lname) FROM books;

-- * CONCAT_WS (concat with seperator)
-- ? CONCAT_WS(seperator, word1, word2, word3)
-- ? seperator will be sandwitched every time

SELECT 
    CONCAT_WS(' - ', title, author_fname, author_lname) 
FROM books;

-- * SubString

SELECT SUBSTRING('Hello World', 1, 4);
SELECT SUBSTRING('Hello World', 7);
-- * from 7 to the end
SELECT SUBSTRING('Hello World', 3, 8);
SELECT SUBSTRING('Hello World', 3);
SELECT SUBSTRING('Hello World', -3);
-- * last 3 characters
SELECT SUBSTRING('Hello World', -7);

SELECT title FROM books;
SELECT SUBSTRING('Where I\'m Calling From: Selected Stories', 1, 10);
SELECT SUBSTRING(title, 1, 10) FROM books;
SELECT SUBSTRING(title, 1, 10) AS short_title FROM books;
SELECT SUBSTR(title, 1, 10) AS short_title FROM books;
-- ? SUBSTR() == SUBSTRING()
SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    )
FROM books;

SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS short_title
FROM books;

-- * Replace

SELECT REPLACE('Hello World', 'Hell', '%$#@');
SELECT REPLACE('Hello World', 'l', '7');
SELECT REPLACE('Hello World', 'o', '0');
SELECT REPLACE('HellO World', 'o', '*');
SELECT
  REPLACE('cheese bread coffee milk', ' ', ' and ');
SELECT REPLACE(title, 'e ', '3') FROM books;

SELECT
  CONCAT
  (
      SUBSTRING(title, 1, 10), '...'
  ) AS short_title
FROM books;

SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 10)
FROM books;

SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS weird_string
FROM books;

-- * Reverse

SELECT REVERSE('Hello World');
SELECT REVERSE('meow meow');
SELECT REVERSE(author_fname) FROM books;
SELECT CONCAT('woof', REVERSE('woof'));
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

-- * CHAR LENGTH

SELECT CHAR_LENGTH('Hello World');
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

-- * Upper case & Lower Case
-- ? UPPER() & LOWER() takes only one arguement
SELECT UPPER('Hello World');
SELECT LOWER('Hello World');
SELECT UPPER(title) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;

-- * Exercise

SELECT REVERSE('Why does my cat look at me with such hatred?');
SELECT UPPER('Why does my cat look at me with such hatred?');

SELECT REPLACE(title, ' ', '->') FROM books;

SELECT  author_lname AS forwards, 
        Reverse(author_lname) AS backwards 
FROM    books; 

SELECT 
      UPPER
      (
        CONCAT(author_fname, ' ', author_lname)
      ) AS full_name_in_caps
FROM books;

SELECT 
    CONCAT(title, ' was released in ', released_year) AS 'blurb'
FROM books;

SELECT  title,
        CHAR_LENGTH(title) AS character_count
FROM books;

SELECT  CONCAT(SUBSTRING(title, 1, 10), '...') AS short_title,
        CONCAT(author_fname, " ", author_lname) AS author,
        CONCAT(stock_quantity, " in stock") AS quantity
FROM books;


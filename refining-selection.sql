-- * continue this section right after string-functions and book_shop DB

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- * DISTINCT

SELECT title FROM books;
SELECT author_lname FROM books;
SELECT DISTINCT author_lname FROM books;

SELECT author_fname, author_lname FROM books;
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;

-- * ORDER BY

-- character order

SELECT author_lname FROM books;
SELECT author_lname FROM books ORDER BY author_lname;

SELECT title FROM books;
SELECT title FROM books ORDER BY title;
SELECT author_lname FROM books ORDER BY author_lname DESC;

-- nubmer order

SELECT released_year FROM books;
SELECT released_year FROM books ORDER BY released_year;
SELECT released_year FROM books ORDER BY released_year DESC;
SELECT released_year FROM books ORDER BY released_year ASC;

SELECT title, released_year, pages FROM books ORDER BY released_year;
SELECT title, pages FROM books ORDER BY released_year;

-- ORDER_BY shortcut by using column number

SELECT title, author_fname, author_lname FROM books ORDER BY 2;
SELECT title, author_fname, author_lname FROM books ORDER BY 3;
SELECT title, author_fname, author_lname FROM books ORDER BY 1;
SELECT title, author_fname, author_lname FROM books ORDER BY 1 DESC;
SELECT author_lname, title FROM books ORDER BY 2;
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;

-- * LIMIT

SELECT title FROM books LIMIT 3;
SELECT title FROM books LIMIT 1;
SELECT title FROM books LIMIT 10;
SELECT * FROM books LIMIT 1;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 5;
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1;
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 14;
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,5;
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,3;
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1,3;
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 10,1;

-- LIMIT from certain row to the end

SELECT * FROM tbl LIMIT 95,18446744073709551615;
SELECT title FROM books LIMIT 5;
SELECT title FROM books LIMIT 5, 123219476457;
SELECT title FROM books LIMIT 5, 50;

-- * LIKE
-- ? & wildcard (include any string) and _ wildcard (one _ means one random character)

SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';

SELECT title FROM books WHERE title LIKE 'the';
SELECT title FROM books WHERE title LIKE '%the';
SELECT title FROM books WHERE title LIKE '%the%';

SELECT title, stock_quantity FROM books;
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__';

-- * escape with back-slash

SELECT title FROM books;
SELECT title FROM books WHERE title LIKE '%\%%';
SELECT title FROM books WHERE title LIKE '%\_%';

-- ! Exercise

SELECT title FROM books WHERE title LIKE '%stories%';

SELECT title, pages FROM books
ORDER BY pages DESC LIMIT 1;

SELECT 
    CONCAT(title, ' - ', released_year) AS summary 
FROM books
ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM books
WHERE author_lname LIKE '% %';

SELECT title, released_year, stock_quantity FROM books
ORDER BY stock_quantity ASC LIMIT 3;

SELECT title, author_lname FROM books
ORDER BY author_lname, title ASC;

SELECT title, author_lname FROM books
ORDER BY 2,1;

SELECT UPPER
    (
        CONCAT ('my favorite author name is ', author_fname, ' ', author_lname, '!')
    ) AS yell
FROM books
ORDER BY author_lname;


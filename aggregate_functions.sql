-- * COUNT

SELECT COUNT(*) FROM books;
SELECT COUNT(author_fname) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;

SELECT title FROM books WHERE title LIKE '%the%';
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- * GROUP BY

SELECT title, author_lname FROM books;

SELECT title, author_lname FROM books
GROUP BY author_lname;

-- COUNT(*) : GROUP BY된 cluster들의 개수를 count

SELECT author_lname, COUNT(*)
FROM books GROUP BY author_lname;

SELECT title, author_fname, author_lname FROM books;
SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;

SELECT released_year FROM books;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT 
    CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') 
AS year 
FROM books GROUP BY released_year;

-- * MAX & MIN

SELECT MIN(pages) FROM books;
SELECT MIN(released_year) FROM books;
 
SELECT MAX(pages) FROM books;
SELECT MAX(released_year) FROM books;
SELECT MAX(pages), title FROM books;

-- * Subquery (execution speed of command includes subquery is comparatively slow)

SELECT * FROM books 
WHERE pages = (SELECT Min(pages) 
                FROM books); 

SELECT title, pages FROM books 
WHERE pages = (SELECT Max(pages) 
                FROM books); 

SELECT title, pages FROM books 
WHERE pages = (SELECT Min(pages) 
                FROM books); 

SELECT * FROM books 
ORDER BY pages ASC LIMIT 1;

SELECT title, pages FROM books 
ORDER BY pages ASC LIMIT 1;

SELECT * FROM books 
ORDER BY pages DESC LIMIT 1;

-- * MAX & MIN with GROUP BY

SELECT author_fname, 
       author_lname, 
       Min(released_year) 
FROM   books 
GROUP  BY author_lname, 
          author_fname;
-- ? 성, 이름 중 하나가 같은 동명 이인을 따로 표시하기 위해 GROUP BY에서 fname, lname을 같이 표기
 
SELECT
    author_fname,
    author_lname,
    Max(pages)
FROM books
GROUP BY author_lname,
         author_fname;
 
SELECT
    CONCAT(author_fname, ' ', author_lname) AS author,
    MAX(pages) AS longest_book
FROM books
GROUP BY author_lname,
         author_fname;

-- * SUM

SELECT SUM(pages) FROM books;
SELECT SUM(released_year) FROM books;

SELECT author_fname,
       author_lname,
       SUM(pages)
FROM books
GROUP BY
    author_lname,
    author_fname;
 
SELECT author_fname,
       author_lname,
       Sum(released_year)
FROM books
GROUP BY
    author_lname,
    author_fname;

-- * AVG

SELECT AVG(released_year) FROM books;
SELECT AVG(pages) FROM books;

SELECT AVG(stock_quantity) FROM books 
GROUP BY released_year;
SELECT released_year, AVG(stock_quantity) FROM books 
GROUP BY released_year;

SELECT author_fname, author_lname, AVG(pages) FROM books
GROUP BY author_lname, author_fname;

-- ! Exercise

SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*)
FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) FROM BOOKS;

SELECT CONCAT(author_fname, ' ', author_lname) AS author, 
    AVG(released_year) AS average_released_year
FROM books GROUP BY released_year;

SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages
FROM books ORDER BY pages DESC LIMIT 1;

SELECT  released_year AS year, 
        COUNT(*) AS '# books',
        AVG(pages) AS avg_pages
FROM books GROUP BY released_year 
ORDER BY 1 ASC;
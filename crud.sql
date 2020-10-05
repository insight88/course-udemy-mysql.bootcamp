-- * Initial data setup

CREATE TABLE cats 
( 
    cat_id INT NOT NULL AUTO_INCREMENT, 
    name   VARCHAR(100), 
    breed  VARCHAR(100), 
    age    INT, 
    PRIMARY KEY (cat_id) 
); 

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
    ('Cindy', 'Maine Coon', 10),
    ('Dumbledore', 'Maine Coon', 11),
    ('Egg', 'Persian', 4),
    ('Misty', 'Tabby', 13),
    ('George Michael', 'Ragdoll', 9),
    ('Jackson', 'Sphynx', 7);

-- * Read All data from table
SELECT * FROM cats;
-- * Read specific column(or columns)
SELECT name FROM cats;
SELECT name, age, breed FROM cats;
-- * can change column order

-- * Read mor specific data (conditionally) by using WHERE

SELECT * FROM cats WHERE age=4;
SELECT * FROM cats WHERE name='egG';
-- ? case insensibility of SQL

--! Exercise problem solution 1

SELECT cat_id FROM cats;
SELECT name, breed FROM cats;
SELECT name, age FROM cats WHERE breed='Tabby';
SELECT cat_id, age FROM cats WHERE cat_id=age;

-- * Alias of column

SELECT cat_id AS id, name FROM cats;
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;

-- * Update

UPDATE <table> SET <value> WHERE <target>
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby'; 
UPDATE cats SET age=14 WHERE name='Misty'; 

--! Exercise problem solution 2

UPDATE cats SET name='Jack' WHERE name='Jackson';
UPDATE cats SET breed='British Shorthair' WHERE cat_id=1;
UPDATE cats SET age=12 WHERE breed='Maine Coon';

-- * Delete

DELETE FROM cats WHERE name='Egg';
-- * Delete all data in that table
DELETE FROM cats;

--! Exercise problem solution 3

DELETE FROM cats WHERE age=4;
DELETE FROM cats WHERE age=cat_id;
DELETE FROM cats;

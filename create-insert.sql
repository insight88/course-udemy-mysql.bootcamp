SHOW DATABASES;

-- * create db
CREATE DATABASE hello_world_db;

-- * use db
USE hello_world_db;

-- * see current database
SELECT database();

-- *  dropping db
DROP DATABASE hello_world_db;

-- !  example 1
CREATE DATABASE cat_app;
USE cat_app;

-- *  create tables
CREATE TABLE cats
(
    name VARCHAR(100),
    age INT
);

-- *  show tables
SHOW tables;

-- *  show columns
SHOW COLUMNS FROM cats;
DESC cats;

-- *  drop table
DROP TABLE cats;

-- ! example 2
CREATE TABLE cats
(
    name VARCHAR(100),
    age INT
);

-- *  insert data
INSERT INTO cats (name, age)
VALUES ('Jetson', 7);

-- column order doesn't matter
INSERT INTO cats (age, name)
VALUES (12, 'Victoria');

-- * view all data in table
SELECT * FROM cats;

-- * multiple insert
INSERT INTO cats (name, age)
VALUES  ('Peanut', 2),
        ('Butter', 4),
        ('Jelly', 7);

-- * view warning message
SHOW WARNINGS;

-- * NULL allowed (table cats)
-- DESC cats;
-- Null : Yes -> NULL data is allowed in that column
INSERT INTO cats (name) VALUES ('Alabama');
INSERT INTO cats () VALUES ();

-- ! create new table cats 2 which doesn't allow NULL data
CREATE TABLE cats2
(
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

INSERT INTO cats (name) VALUES ('Texas')
-- ? error 1364 will occur!

-- * setting default values
-- DESC : cats3;
-- Default : unknown -> default data of that column is set as 'unknown'
CREATE TABLE cats3
(
    name VARCHAR(100) DEFAULT 'unknown',
    age INT DEFAULT 0
);

INSERT INTO cats3 (age) VALUES (13);
INSERT INTO cats3 (name) VALUES ('Texas');

-- * manually insert data with null value (explicit null)
-- it works only when we didn't set that column as NOT NULL
INSERT INTO cats3 (name, age) VALUES ('Montana', NULL);

-- ! example 4
CREATE TABLE cats4
(
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);

INSERT INTO cats4(name, age) VALUES('Cali', NULL);
-- ? error 1048 occurs!

INSERT INTO cats VALUES ('Helena', 6);
INSERT INTO cats VALUES ('Helena', 6);
INSERT INTO cats VALUES ('Helena', 6);
INSERT INTO cats VALUES ('Helena', 6);

-- ! example 5 : data overlapping is allowed! We need to make data uniquely identifiable. (PRIMARY KEY)

CREATE TABLE unique_cats
(
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
    -- * PRIMARY KEY : doesn't allow to duplicate same key 
);

INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'Fred', 23);
INSERT INTO unique_cats(cat_id, name, age) VALUES(2, 'Louise', 3);
INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'James', 3);

CREATE TABLE unique_cats2
(
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);

-- ! Exercise

CREATE TABLE Employees
(
    id INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(10) NOT NULL,
    first_name VARCHAR(10) NOT NULL,
    middle_name VARCHAR(10),
    age INT NOT NULL,
    current_status VARCHAR(20) NOT NULL DEFAULT 'employed',
    PRIMARY KEY (id)
);

CREATE TABLE Employees
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(10) NOT NULL,
    first_name VARCHAR(10) NOT NULL,
    middle_name VARCHAR(10),
    age INT NOT NULL,
    current_status VARCHAR(20) NOT NULL DEFAULT 'employed'
);

INSERT INTO employees(first_name, last_name, age) 
VALUES ('Dora', 'Smith', 58);
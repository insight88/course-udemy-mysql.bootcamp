-- create database
CREATE DATABASE practice;
USE practice;

SHOW DATABASES;
SHOW TABLES;

-- create table
CREATE TABLE topic
(
  id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR (100) NOT NULL,
  description TEXT NULL,
  created DATETIME NOT NULL,
  author VARCHAR (15) NULL,
  profile VARCHAR (200) NULL,
  PRIMARY KEY (id)
);

-- show description of table
DESC topic;

-- create data
INSERT INTO topic (title,description,created,author,profile) VALUES('MySQL', 'MySQL is...', NOW(), 'kp', 'developer');
INSERT INTO topic (title,description,created,author,profile) VALUES('ORACLE', 'ORACLE is...', NOW(), 'kp', 'developer');
INSERT INTO topic (title,description,created,author,profile) VALUES('PostgreSQL', 'PostgreSQL is...', NOW(), 'taeho', 'publisher');
INSERT INTO topic(title,description,created,author,profile) VALUES('MongoDB', 'MongoDB is...', NOW(), 'taeho', 'publisher');

-- create data
SELECT * FROM topic;
SELECT title, created, author FROM topic;
SELECT id, title, created FROM topic WHERE author='kp';
SELECT id, title, created FROM topic WHERE author='kp' ORDER BY id DESC;
SELECT id, title, created FROM topic WHERE author='kp'
ORDER BY id ASC;
SELECT * FROM topic LIMIT 3;

-- update data
UPDATE topic SET description='Oracle...', title='Oracle' WHERE id=2;

-- delete data
DELETE FROM topic WHERE id=4;

-- rename table
RENAME TABLE topic TO topic_backup;
SHOW TABLES;

CREATE TABLE 'author' (
  'id' int(11) NOT NULL AUTO_INCREMENT,
  'name' varchar(20) NOT NULL,
  'profile' varchar(200) DEFAULT NULL,
  PRIMARY KEY('id')
);

CREATE TABLE 'topic' (
  'id' int(11) NOT NULL AUTO_INCREMENT,
  'title' varchar(30) NOT NULL,
  'description' text,
  'created' datetime NOT NULL,
  'author_id' int(11) DEFAULT NULL,
  PRIMARY KEY('id')
);

INSERT INTO 'author' VALUES (1, 'egoing', 'developer');
INSERT INTO 'author' VALUES (2, 'duru', 'database administrator');
INSERT INTO 'author' VALUES (3, 'taeho', 'data scientist, developer');

INSERT INTO 'topic' VALUES (1, 'MySQL', 'MySQL is...', '2018-01-01 12:10:11', 1);
INSERT INTO 'topic' VALUES (2, 'Oracle', 'Oracle is ...', '2018-01-03 13:01:10', 1);
INSERT INTO 'topic' VALUES (3, 'SQL Server', 'SQL Server is ...', '2018-01-20 11:01:10', 2);
INSERT INTO 'topic' VALUES (4, 'PostgreSQL', 'PostgreSQL is ...', '2018-01-23 01:03:03', 3);
INSERT INTO 'topic' VALUES (5, 'MongoDB', 'MongoDB is ...', '2018-01-30 12:31:03', 1);

-- join
SELECT * FROM topic;
SELECT * FROM topic LEFT JOIN author ON topic.author_id=author.id;
SELECT topic.id, title, description, created, name AS author_name, profile FROM topic LEFT JOIN author ON topic.author_id=author.id;
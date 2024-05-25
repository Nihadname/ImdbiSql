create database imdb

use imdb
create table movies(
id int primary key identity,
title NVARCHAR(50),
RealeaseDate datetime
)
create table directors(
id int primary key identity,
FullName nvarchar(60) not null,
BornTime date 
)
alter table movies  add directorId int foreign key references directors(id)
alter table movies add actorsId int foreign key references actors(id);
alter table movies add genresId int foreign key references genres(id)
alter table movies add imdbiPoint int 
create table actors(
id int primary key identity ,
fullName nvarchar(80) not null,
BornTime date
)
create table genres(
id int primary key identity ,
[Name] nvarchar(80) not null
)

-- Inserting data into the directors table
INSERT INTO directors (FullName, BornTime) VALUES 
('Christopher Nolan', '1970-07-30'),
('Quentin Tarantino', '1963-03-27'),
('Steven Spielberg', '1946-12-18');

-- Inserting data into the actors table
INSERT INTO actors (fullName, BornTime) VALUES
('Leonardo DiCaprio', '1974-11-11'),
('Brad Pitt', '1963-12-18'),
('Tom Hanks', '1956-07-09');

-- Inserting data into the genres table
INSERT INTO genres ([Name]) VALUES
('Action'),
('Drama'),
('Comedy');

-- Inserting data into the movies table
INSERT INTO movies (title, RealeaseDate, directorId, actorsId, genresId,imdbiPoint) VALUES
('Inception', '2010-07-16', 1, 1, 1,3),
('Pulp Fiction', '1994-10-14', 2, 2, 2,7),
('Forrest Gump', '1994-07-06', 3, 3, 2,9);

 DELETE FROM movies where imdbiPoint is null

SELECT m.title AS MovieTitle, m.RealeaseDate AS ReleaseDate, 
       directors.FullName AS DirectorName, directors.BornTime AS DirectorBornTime,
       a.fullName AS ActorName, a.BornTime AS ActorBornTime,
       g.Name AS GenreName
FROM movies m
INNER JOIN directors ON directors.id = m.directorId
INNER JOIN actors a ON a.id = m.actorsId
INNER JOIN genres g ON g.id = m.genresId;

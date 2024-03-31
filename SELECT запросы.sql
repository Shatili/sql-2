--Название и продолжительность самого длительного трека.
SELECT name, duration
FROM track
WHERE duration = (SELECT MAX(duration) FROM track);
--Название треков, продолжительность которых не менее 3,5 минут
SELECT name
FROM track
WHERE duration >= 210;
--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name
FROM collection
WHERE year_date BETWEEN '2018-01-01' AND '2020-12-31';
--Исполнители, чьё имя состоит из одного слова.
SELECT name
FROM artist
WHERE name  NOT LIKE '% %';
--Название треков, которые содержат слово «мой» или «my».
SELECT name
FROM track
WHERE name LIKE '%мой%' OR name LIKE '%my%';

--1.количество исполнителей в каждом жанре;
SELECT genre.name AS genre_name, COUNT(*) AS artist_count
FROM genre
JOIN genre_artist ON genre.id = genre_artist.genre_id
GROUP BY genre.name;
--2.количество треков, вошедших в альбомы 2019-2020 годов;
SELECT COUNT(t.id) AS num_tracks
FROM track t
LEFT JOIN album a ON t.album_id = a.id
WHERE a.year_date BETWEEN '2019-01-01' AND '2020-12-31';
--3.средняя продолжительность треков по каждому альбому;
SELECT a.name AS album_name, AVG(t.duration) AS avg_duration
FROM album a
LEFT JOIN track t ON a.id = t.album_id
GROUP BY a.name;
--4.все исполнители, которые не выпустили альбомы в 2020 году;
SELECT ar.name AS artist_name
FROM artist ar
LEFT JOIN album_artist aa ON ar.id = aa.artist_id
LEFT JOIN album a ON aa.album_id = a.id
WHERE a.year_date != '2020-01-01';
--5.названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT c.name AS collection_name
FROM collection c
JOIN collection_track ct ON c.id = ct.collection_id
JOIN track t ON ct.track_id = t.id
JOIN album a ON t.album_id = a.id
JOIN album_artist aa ON a.id = aa.album_id
JOIN artist ar ON a.id = ar.id
WHERE ar.name = 'Иришка';



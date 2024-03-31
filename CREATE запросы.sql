CREATE TABLE IF NOT EXISTS album (
id SERIAL PRIMARY KEY,
name VARCHAR(200) NOT NULL,
year_date DATE
);

CREATE TABLE IF NOT EXISTS artist (
artist_id SERIAL PRIMARY KEY,
name VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre (
genre_id SERIAL PRIMARY KEY,
name VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS album_artist (
album_id INTEGER REFERENCES album(id),
artist_id INTEGER REFERENCES artist(id),
PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS genre_artist (
genre_id INTEGER REFERENCES genre(id),
artist_id INTEGER REFERENCES artist(id),
PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS track (
track_id SERIAL PRIMARY KEY,
name VARCHAR(200) UNIQUE NOT NULL,
duration INTEGER,
album_id INTEGER REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS collection (
collection_id SERIAL PRIMARY KEY,
name VARCHAR(300) UNIQUE NOT NULL,
year_date DATE
);

CREATE TABLE IF NOT EXISTS collection_track (
collection_id INTEGER REFERENCES collection(id),
track_id INTEGER REFERENCES track(id),
PRIMARY KEY (collection_id, track_id)
);


insert into artist (name) values ('Артём'), ('Сашка'), ('Иришка'), ('Катя');

insert into genre (name) values ('Лай'), ('Рычание'), ('Кусь');

insert into album (name, year_date) values ('Собачий поцелуй', '2024-01-01'), ('Вот бы поесть', '2023-05-15'), ('Пошли гулять', '2021-11-20');

insert into track (name, duration, album_id) values ('Лизь тебя', 180, 1), ('Вою на луну', 240, 1), ('пицца упади', 200, 2), ('Я с пола всё поем', 220, 2), ('Опять дождь', 190, 3), ('Уже 6 утра', 210, 3);

insert into collection (name, year_date) values ('Собачий нос', '2019-10-01'), ('Лапки', '2017-07-05'), ('Пузико', '2016-03-10'), ('Шерстяной', '2018-12-25');

insert into album_artist (album_id, artist_id) values (1, 1), (2, 2), (3, 3), (1, 4);

insert into genre_artist (genre_id, artist_id) values (1, 1), (2, 2), (3, 3), (1, 4);

insert into collection_track (collection_id, track_id) values (1, 1), (2, 2), (3, 3), (4, 4), (1, 5), (2, 6);
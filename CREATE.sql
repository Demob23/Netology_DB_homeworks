CREATE TABLE IF NOT EXISTS Artists (
id serial PRIMARY KEY,
artist_name varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
id serial PRIMARY KEY,
genre_name varchar(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS GenreInfo (
artist_id integer REFERENCES Artists(id),
genre_id integer REFERENCES Genres(id),
CONSTRAINT pk PRIMARY KEY(artist_id,
                          genre_id)
);

CREATE TABLE IF NOT EXISTS Albums (
id serial PRIMARY KEY,
album_name varchar(120) NOT NULL UNIQUE,
release_year integer NOT NULL CHECK(release_year > 1970)
);

CREATE TABLE IF NOT EXISTS AlbumInfo (
artist_id integer REFERENCES Artists(id),
album_id  integer REFERENCES Albums(id),
CONSTRAINT pk_1 PRIMARY KEY(artist_id,
                            album_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
id serial              PRIMARY KEY,
track_name varchar(80) NOT NULL UNIQUE,
duration integer       NOT NULL CHECK (duration > 60),
album_id integer       REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Mixtapes (
id serial            PRIMARY KEY,
name varchar(80)     NOT NULL UNIQUE,
release_year integer NOT NULL CHECK(release_year > 1970)
);

CREATE TABLE IF NOT EXISTS MixtapeContent (
mixtape_id integer REFERENCES Mixtapes(id),
track_id integer REFERENCES Tracks(id),
CONSTRAINT pk_2 PRIMARY KEY(mixtape_id,
                            track_id)
);
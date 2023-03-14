INSERT INTO Artists(artist_name)
VALUES ('Artist_1'),
       ('Artist_2'),
       ('Artist_3'),
       ('Artist_4'),
       ('Artist_5'),
       ('Artist_6'),
       ('Artist_7'),
       ('Artist_8');
     
INSERT INTO genres (genre_name)
VALUES ('Rock'),
       ('Math Rock'),
       ('Post-Rock'),
       ('Funk'),
       ('Neo-Classical');

INSERT INTO Albums(album_name, release_year)
VALUES ('Example album 1', 2018),
       ('Not enough good album', 2011),
       ('Really awful songs Vol.3', 2020),
       ('Songs that deserves more attention', 1987),
       ('Album that you will listen to very often', 2021),
       ('Some anime songs', 2018),
       ('IDK how to play on guitar', 2002),
       ('Music for programming', 1999);
      
INSERT INTO Tracks (track_name, duration, album_id)
VALUES ('We havent finished yet', 588, 1),
       ('This is your favorite song', 120, 7),
       ('Begining of an album', 186, 1),
       ('Peaceful music', 422, 8),
       ('My crucible quarantine', 133, 2),
       ('Becoming an Software engineer', 231, 8),
       ('Cool guitar solo', 110, 7),
       ('Casual anime song', 122, 6),
       ('Broken Wings', 181, 4),
       ('Praise the Sun', 162, 5),
       ('Come and listen', 192, 4),
       ('Nanomachines, son', 320, 3),
       ('Dont listen to this song', 153, 3),
       ('Crowded place', 133, 3),
       ('Song of JavaScript', 193, 8);
       
INSERT INTO Mixtapes(name, release_year)
VALUES ('Volume number 1', 2019),
       ('Buy this', 2020),
       ('Goo Goo', 2021),
       ('Устал придумывать названия', 2022),
       ('God bless this music', 2021),
       ('Play it in your co-living at 5am', 2021),
       ('Как же сложно придумывать названия', 2022),
       ('I do not understand JavaScript', 2022);

INSERT INTO Genreinfo (artist_id, genre_id)
VALUES (1, 2),
       (1, 3),
       (2, 1),
       (3, 4),
       (3, 5),
       (4, 1),
       (4, 3),
       (4, 4),
       (5, 1),
       (6, 2),
       (7, 5),
       (8, 1),
       (8, 3);
       
INSERT INTO Albuminfo (artist_id, album_id)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (2, 3),
       (3, 2),
       (3, 4),
       (4, 1),
       (5, 5),
       (5, 7),
       (6, 4),
       (7, 6),
       (8, 8);

INSERT INTO Mixtapecontent (mixtape_id, track_id)
VALUES (1, 1),
       (1, 2),
       (2, 2),
       (2, 3),
       (2, 4),
       (3, 3),
       (4, 1),
       (4, 5),
       (4, 8),
       (5, 8),
       (5, 10),
       (6, 12),
       (7, 15),
       (8, 15);
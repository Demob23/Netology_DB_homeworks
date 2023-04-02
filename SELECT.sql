SELECT album_name, release_year 
FROM albums
WHERE (release_year = 2018);

SELECT track_name, duration
FROM tracks
WHERE duration = (
  SELECT MAX(duration)
  FROM tracks);
  
SELECT track_name
FROM tracks
WHERE duration > 210;

SELECT name
FROM mixtapes
WHERE release_year BETWEEN 2018 AND 2020;

SELECT artist_name
FROM artists
WHERE artist_name NOT LIKE '% %';

SELECT track_name
FROM tracks
WHERE track_name SIMILAR TO '%(my|мой)%';

-- Количество исполнителей в каждом жанре.
SELECT genre_name, count(g2.genre_id) 
FROM genres g
JOIN genreinfo g2 ON g.id = g2.genre_id
GROUP BY genre_name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT count(tracks.track_name) 
FROM tracks
JOIN albums a ON tracks.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020

-- Средняя продолжительность треков по каждому альбому.
SELECT album_name, avg(t.duration)  FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY album_name;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT artist_name
FROM artists
WHERE artist_name NOT IN (
    SELECT artist_name
    FROM artists
    JOIN albuminfo ON artists.id = albuminfo.artist_id
    JOIN albums ON albums.id = albuminfo.album_id
    WHERE albums.release_year = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT a3.artist_name, m.name FROM mixtapes m
JOIN mixtapecontent m2 ON m.id = m2.mixtape_id
JOIN tracks t ON m2.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN albuminfo a2 ON a.id = a2.album_id
JOIN artists a3 ON a2.artist_id = a3.id
WHERE a3.artist_name LIKE 'Artist_2'

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT album_name, a3.artist_name, count(g.genre_id) FROM albums a
JOIN albuminfo a2 ON a.id = a2.album_id
JOIN artists a3 ON a2.artist_id = a3.id 
JOIN genreinfo g ON g.artist_id = a3.id
GROUP BY album_name, a3.artist_name
HAVING count(g.genre_id) >= 2;

-- Наименования треков, которые не входят в сборники.
SELECT track_name FROM tracks AS t
LEFT JOIN mixtapecontent m ON t.id = m.track_id
WHERE m.track_id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT artist_name, min(t.duration) FROM artists a
JOIN albuminfo a2 ON a.id = a2.artist_id
JOIN albums a3 ON a2.album_id = a3.id
JOIN tracks t ON t.album_id = a3.id
WHERE t.duration = (SELECT min(duration) FROM tracks)
GROUP BY artist_name ;

-- Названия альбомов, содержащих наименьшее количество треков.
SELECT album_name
FROM albums a JOIN tracks t ON t.album_id = a.id
GROUP BY album_name
HAVING count(t.album_id) = (
  SELECT count(id) FROM tracks
  GROUP BY album_id
  ORDER BY 1
  LIMIT 1
);
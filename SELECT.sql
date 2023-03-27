SELECT album_name, release_year 
FROM albums
WHERE (release_year = 2018)

SELECT track_name, duration
FROM tracks
WHERE duration = (
  SELECT MAX(duration)
  FROM tracks)
  
SELECT track_name
FROM tracks
WHERE duration > 210

SELECT name
FROM mixtapes
WHERE release_year BETWEEN 2018 AND 2020

SELECT artist_name
FROM artists
WHERE artist_name NOT LIKE '% %'

SELECT track_name
FROM tracks
WHERE track_name SIMILAR TO '%(my|мой)%'

SELECT artist_name, genre_name FROM artists a
JOIN genreinfo g ON a.id = g.artist_id
JOIN genres g2 ON g.genre_id = g2.id 

SELECT release_year, count(album_name) FROM albums a
WHERE release_year BETWEEN 2019 AND 2020
GROUP BY release_year

SELECT album_name, avg(t.duration)  FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY album_name

SELECT artist_name FROM artists a
JOIN albums a2 ON a.id = a2.id
WHERE a2.release_year != 2020

SELECT a3.artist_name, m.name FROM mixtapes m
JOIN mixtapecontent m2 ON m.id = m2.mixtape_id
JOIN tracks t ON m2.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN albuminfo a2 ON a.id = a2.album_id
JOIN artists a3 ON a2.artist_id = a3.id
WHERE a3.artist_name LIKE 'Artist_2'
GROUP BY a3.artist_name, m.name

SELECT album_name, a3.artist_name, count(g.genre_id) FROM albums a
JOIN albuminfo a2 ON a.id = a2.album_id
JOIN artists a3 ON a2.artist_id = a3.id 
JOIN genreinfo g ON g.artist_id = a3.id
GROUP BY album_name, a3.artist_name
HAVING count(g.genre_id) >= 2

SELECT track_name FROM tracks AS t
LEFT JOIN mixtapecontent m ON t.id = m.track_id
WHERE m.track_id IS NULL

SELECT artist_name, min(t.duration) FROM artists a
JOIN albuminfo a2 ON a.id = a2.artist_id
JOIN albums a3 ON a2.album_id = a3.id
JOIN tracks t ON t.album_id = a3.id
WHERE t.duration = (SELECT min(duration) FROM tracks)
GROUP BY artist_name 

SELECT album_name, count(t.album_id) FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY album_name
HAVING count(t.album_id) = (SELECT min(count_min_tracks) 
                            FROM 
                               (SELECT count(album_id) count_min_tracks
                                FROM tracks JOIN albums a2 ON tracks.album_id = a2.id
                                GROUP BY album_name) x)
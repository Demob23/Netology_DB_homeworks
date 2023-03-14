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

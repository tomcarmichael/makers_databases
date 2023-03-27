release_year FROM albums;

SELECT release_year FROM albums WHERE title = 'Bossanova';

SELECT title 
  FROM albums
  WHERE release_year >= 1980 AND release_year <= 1990 AND artist_id = 1;

  
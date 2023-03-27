UPDATE albums SET release_year = 1972 WHERE id = 3;

UPDATE albums SET release_year = 1973,  title = 'Dark Side of the Moon' WHERE id = 1;
SELECT title, release_year, id FROM albums;


DELETE FROM albums WHERE id = 12;
SELECT title, release_year, id FROM albums ORDER BY id;


